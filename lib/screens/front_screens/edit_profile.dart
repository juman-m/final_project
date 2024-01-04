import 'package:final_project/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:final_project/blocs/edit_profile_bloc/edit_profile_event.dart';
import 'package:final_project/blocs/edit_profile_bloc/edit_profile_state.dart';
import 'package:final_project/globals/global.dart';
import 'package:final_project/screens/front_screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameController =
    TextEditingController(text: currentUser!.username);
TextEditingController phoneController =
    TextEditingController(text: currentUser!.phone);
TextEditingController emailController =
    TextEditingController(text: currentUser!.email);

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              content: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            ));
          } else if (state is UpdateProfileState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: Color(0xff018CDD),
              content: Text(
                'تم تحديث بياناتك بنجاح',
                style: TextStyle(color: Colors.white),
              ),
            ));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      color: Color(0xff0086D3),
                    ),
                  ),
                  Positioned(
                    bottom: 88,
                    left: 173,
                    child: Container(
                      width: 80,
                      height: 89,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xff0086D3),
                        size: 75,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 130,
                    child: Container(
                      width: 153,
                      height: 39,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 165,
                    child: Text(
                      '${currentUser!.username}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: -1,
                    child: Image.asset(
                      "assets/Intersect.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: -50,
                    child: Image.asset(
                      "assets/Ellipse 212.png",
                      width: 160,
                      height: 166,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    right: -28,
                    child: Image.asset(
                      "assets/Ellipse 209.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 60,
                    child: Image.asset(
                      "assets/Ellipse 211.png",
                      width: 90,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const TextWidget(
                    text: "اسم المستخدم",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: const Color(0x1481C5E8),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const TextWidget(
                    text: "رقم الجوال",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        fillColor: const Color(0x1481C5E8),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const TextWidget(
                    text: " الايميل",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: const Color(0x1481C5E8),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: InkWell(
                  onTap: () {
                    context.read<EditProfileBloc>().add(
                          UpdateProfileEvent(
                            name: nameController.text,
                            phone: phoneController.text,
                          ),
                        );
                  },
                  child: Container(
                    width: 265,
                    height: 59,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0086D3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Center(
                      child: state is LoadingState
                          ? const CircularProgressIndicator(
                              color: Color(0xff018CDD),
                            )
                          : const Text(
                              " حفظ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                height: 0.03,
                              ),
                            ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


