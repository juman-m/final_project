import 'package:final_project/blocs/Auth_bloc/auth_bloc.dart';
import 'package:final_project/blocs/Auth_bloc/auth_event.dart';
import 'package:final_project/blocs/Auth_bloc/auth_state.dart';
import 'package:final_project/screens/auth_screens/widget/button_widget.dart';
import 'package:final_project/screens/auth_screens/otp_screen.dart';
import 'package:final_project/screens/auth_screens/signin_screen.dart';
import 'package:final_project/screens/auth_screens/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.zero,
        child: BlocListener<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is LoadingSignUpState) {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff018CDD))));
            } else if (state is SuccessSignUpState) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OtpScreen(email: emailController.text),
                  ));
            } else if (state is ErrorSignUpState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.message,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: const Color(0xff018CDD)));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset("assets/Vector 1sup.png",
                    fit: BoxFit.fill, width: 250),
              ),
              const Center(
                child: Text(
                  'إنشاء حساب',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              CustomTextField(
                hint: 'اسم المستخدم',
                controller: nameController,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'الايميل',
                controller: emailController,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'رقم الجوال',
                controller: phoneController,
                icon: Icons.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'الرقم السري',
                controller: passwordController,
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'تأكيد الرقم السري',
                controller: confirmPasswordController,
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'تسجيل ',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignUpEvent(
                          nameController.text,
                          emailController.text,
                          phoneController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                        ),
                      );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('هل لديك بالفعل حساب؟'),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'سجل دخول',
                      style: TextStyle(
                        color: Color(0xff018CDD),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff018CDD),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'assets/Vector 2sup.png',
                    fit: BoxFit.fill,
                    width: 130,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
