import 'package:final_project/blocs/Auth_bloc/auth_event.dart';
import 'package:final_project/blocs/Auth_bloc/auth_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/models/user_model.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  AuthBloc() : super(InitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(LoadingSignUpState());
      try {
        if (event.email.isNotEmpty &&
            event.name.isNotEmpty &&
            event.password.isNotEmpty &&
            event.convarimpassword.isNotEmpty) {
          if (event.password == event.convarimpassword) {
            if (RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(event.email)) {
              if (RegExp(r'^0\d{9}$').hasMatch(event.phone)) {
                final supabase = Supabase.instance.client;

                await supabase.auth
                    .signUp(email: event.email, password: event.password);

                user = UserModel(
                  username: event.name,
                  email: event.email,
                  phone: event.phone,
                );

                emit(SuccessSignUpState());
              } else {
                emit(ErrorSignUpState(
                    "يجب أن يبدأ رقم الهاتف بالصفر ويكون عبارة عن 10 أرقام"));
              }
            } else {
              emit(ErrorSignUpState("يرجى تقديم البريد الإلكتروني الصحيح "));
            }
          } else {
            emit(ErrorSignUpState(
                "كلمات المرور غير متطابقة, يرجى التطابق للوصول"));
          }
        } else {
          emit(ErrorSignUpState("يرجى ملء جميع الحقول"));
        }
      } catch (authException) {
        if (authException is AuthException) {
          print("AuthException: ${authException.message}");
          emit(ErrorSignUpState(authException.message));
        } else {
          print("Unexpected error: $authException");
          emit(ErrorSignUpState("حدث خطأ غير متوقع"));
        }
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(LoadingSignInState());
      try {
        if (event.email.isNotEmpty && event.password.isNotEmpty) {
          final supabase = Supabase.instance.client;
          await Future.delayed(const Duration(seconds: 1));

          final login = await supabase.auth
              .signInWithPassword(email: event.email, password: event.password);
          if (login.user?.id != null) {
            currentUser = await SupabaseFunctions().getUser();
            emit(SuccessSignInState());
          } else {
            emit(ErrorSignInState(
                "البريد الإلكتروني أو كلمة المرور غير صحيحة, يرجى التحقق من إدخالك"));
          }
          currentUser = await SupabaseFunctions().getUser();
          emit(SuccessSignInState());
        } else {
          emit(ErrorSignInState("يرجى ملء جميع الحقول"));
        }
      } catch (e) {
        print(e);
        emit(ErrorSignInState(
            "حدث خطأ أثناء تسجيل الدخول, يرجى التحقق مرة أخرى من بيانات الاعتماد الخاصة بك والمحاولة مرة أخرى."));
      }
    });

    on<OTPEvent>((event, emit) async {
      emit(LoadingOtpState());
      try {
        if (event.otp.isNotEmpty) {
          final supabase = Supabase.instance.client;
          final authResponse = await supabase.auth.verifyOTP(
            token: event.otp,
            type: OtpType.signup,
            email: event.email,
          );
          print("add user");
          currentUser = await SupabaseFunctions().useradd({
            "id": authResponse.user!.id,
            "username": user!.username,
            "email": user!.email,
            "phone": user!.phone,
          });
          print("get user");
          currentUser = await SupabaseFunctions().getUser();
          emit(SuccessOtpState());
        } else {
          emit(ErrorOtpState("يرجى إدخال رمز التحقق للمتابعة"));
        }
      } catch (e) {
        print(e);
        emit(ErrorOtpState("حدث خطأ ما. يرجى الانتظار والمحاولة مرة أخرى"));
      }
    });
  }
}
