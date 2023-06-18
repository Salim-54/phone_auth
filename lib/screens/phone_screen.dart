import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maibon/services/firebase_auth_methods.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone';
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter phone number',
            ),
            CustomButton(
              onTap: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .phoneSignIn(context, phoneController.text);
              },
              text: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
