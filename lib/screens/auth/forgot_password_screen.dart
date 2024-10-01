import 'package:chicly/components/custom_button.dart';
import 'package:chicly/components/custom_input.dart';
import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _sendResetLink() {
    // Logic to send reset password link to the provided email
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Confirm your email',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the email associated with your account and we’ll send an email with code to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Send Code',
              onPressed: _sendResetLink,
            ),
          ],
        ),
      ),
    );
  }
}
