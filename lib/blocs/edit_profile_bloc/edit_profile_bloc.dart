import 'package:final_project/blocs/edit_profile_bloc/edit_profile_event.dart';
import 'package:final_project/blocs/edit_profile_bloc/edit_profile_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/services/supabase_profile_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      try {
        emit(LoadingState());
        if (event.name.isNotEmpty && event.phone.isNotEmpty) {
          if ((RegExp(r'^0\d{8}$').hasMatch(event.phone))) {
            emit(ErrorState(
                message:
                    'يجب أن يبدأ رقم الهاتف بالصفر ويكون عبارة عن 10 أرقام"'));
          } else {
            await editUser(
              name: event.name,
              phone: event.phone,
            );

            currentUser!.username = event.name;
            currentUser!.phone = event.phone;

            emit(UpdateProfileState());
          }
        } else {
          emit(ErrorState(message: 'يرجى ملء جميع الحقول'));
        }
      } catch (e) {
        emit(ErrorState(message: 'حدث خطأ'));
      }
    });
  }
}
