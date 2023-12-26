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
                    "Phone number must start with zero and be 10 digits"));
              }
            } else {
              emit(ErrorSignUpState("Kindly provide the correct email"));
            }
          } else {
            emit(ErrorSignUpState(
                "Passwords don't match. Match them for access"));
          }
        } else {
          emit(ErrorSignUpState(
              "Complete all fields. Your entry is missing critical information"));
        }
      } catch (authException) {
        if (authException is AuthException) {
          print("AuthException: ${authException.message}");
          emit(ErrorSignUpState(authException.message));
        } else {
          print("Unexpected error: $authException");
          emit(ErrorSignUpState("Unexpected error occurred"));
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
                "Incorrect email or password. Please verify your entry"));
          }
          currentUser = await SupabaseFunctions().getUser();
          emit(SuccessSignInState());
        } else {
          emit(ErrorSignInState(
              "Complete all fields. Your entry is missing critical information"));
        }
      } catch (e) {
        print(e);
        emit(ErrorSignInState(
            "Error signing in. Double-check your credentials and try again"));
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
          emit(ErrorOtpState("Kindly enter the OTP to proceed"));
        }
      } catch (e) {
        print(e);
        emit(ErrorOtpState("Something went wrong. Please wait and try again"));
      }
    });
  }
}
