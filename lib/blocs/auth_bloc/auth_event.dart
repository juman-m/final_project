abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String convarimpassword;

  SignUpEvent(
      this.name, this.email, this.phone, this.password, this.convarimpassword);
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(
    this.email,
    this.password,
  );
}

class OTPEvent extends AuthEvent {
  final String otp;
  final String email;
  OTPEvent(this.otp, this.email);
}
