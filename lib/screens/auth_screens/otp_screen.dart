import 'package:final_project/blocs/Auth_bloc/auth_bloc.dart';
import 'package:final_project/blocs/Auth_bloc/auth_event.dart';
import 'package:final_project/blocs/Auth_bloc/auth_state.dart';
import 'package:final_project/screens/auth_screens/button_widget.dart';
import 'package:final_project/screens/auth_screens/signin_screen.dart';
import 'package:final_project/screens/auth_screens/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: BlocListener<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is LoadingOtpState) {
              print("LoadingOtpState");
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff018CDD),
                  ),
                ),
              );
            } else if (state is SuccessOtpState) {
              print("SuccessOtpState");
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            } else if (state is ErrorOtpState) {
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
                height: 30,
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
                height: 30,
              ),
              CustomTextField(
                hint: ' رمز التحقق',
                controller: otpController,
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                text: 'تحقق الأن',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        OTPEvent(
                          otpController.text,
                          email,
                        ),
                      );
                },
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
