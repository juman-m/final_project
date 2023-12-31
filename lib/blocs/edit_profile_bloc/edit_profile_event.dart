abstract class EditProfileEvent {}

class UpdateProfileEvent extends EditProfileEvent {
  String name;
  String phone;

  UpdateProfileEvent({
    required this.name,
    required this.phone,
  });
}
