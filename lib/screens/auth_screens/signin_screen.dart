import 'package:final_project/blocs/Auth_bloc/auth_bloc.dart';
import 'package:final_project/blocs/Auth_bloc/auth_event.dart';
import 'package:final_project/blocs/Auth_bloc/auth_state.dart';
import 'package:final_project/screens/auth_screens/widget/button_widget.dart';
import 'package:final_project/screens/auth_screens/signup_screen.dart';
import 'package:final_project/screens/auth_screens/widget/text_filed.dart';
import 'package:final_project/screens/front_screens/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.zero,
        child: BlocListener<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is LoadingSignInState) {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff018CDD),
                  ),
                ),
              );
            } else if (state is SuccessSignInState) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppNavigationBar(),
                ),
              );
            } else if (state is ErrorSignInState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                      state.message,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: const Color(0xff018CDD)),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/Vector 1sin.png",
                  fit: BoxFit.fill,
                  width: 500,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Image.asset(
                  "assets/image 18.png",
                  fit: BoxFit.fill,
                  width: 90,
                  height: 102,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 35),
                child: Text(
                  ' سجل دخولك',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
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
                hint: 'الرقم السري',
                controller: passwordController,
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignInEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لايوجد لديك حساب؟',
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'تسجل الأن',
                      style: TextStyle(
                        color: Color(0xff018CDD),
                        fontSize: 15,
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
                    'assets/Vector 2sin.png',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 300,
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
