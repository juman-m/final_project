// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/auth_screens/signup_screen.dart';
import 'package:final_project/screens/nav_bar.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () async {
      final supabaseClint = Supabase.instance.client;
      final token = supabaseClint.auth.currentSession?.accessToken;

      if (token != null) {
        final isExp = supabaseClint.auth.currentSession?.isExpired ?? false;

        if (isExp) {
          await supabaseClint.auth
              .setSession(supabaseClint.auth.currentSession!.refreshToken!);
        }

        currentUser = await SupabaseFunctions().getUser();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AppNavigationBar(),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
          (route) => false,
        );
      }
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Vector 4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image 18.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/Vector 3.png"),
          ),
        ],
      ),
    );
  }
}
