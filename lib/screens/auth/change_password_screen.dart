import 'package:chicly/components/custom_button.dart';
import 'package:chicly/components/custom_input.dart';
import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _isEightCharacters = false;
  bool _hasLetter = false;
  bool _hasNumber = false;
  bool _hasSymbol = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_updatePasswordValidation);
  }

  void _updatePasswordValidation() {
    final password = _newPasswordController.text;
    setState(() {
      _isEightCharacters = password.length >= 8;
      _hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasSymbol = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordVisible = !_isNewPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _updatePassword() {
    // Logic to update password
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Create new password',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome back! Please enter your details.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _newPasswordController,
              obscureText: !_isNewPasswordVisible,
              hintText: 'Create new password',
              prefixIcon: Icons.lock,
              suffixIcon: Icon(
                _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: MyColors.primaryColor,
              ),
              onTapSuffixIcon: _toggleNewPasswordVisibility,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              hintText: 'Confirm password',
              prefixIcon: Icons.lock,
              suffixIcon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: MyColors.primaryColor,
              ),
              onTapSuffixIcon: _toggleConfirmPasswordVisibility,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  _buildPasswordCheckTile(_isEightCharacters,
                      "Password must be less than 8 letters"),
                  _buildPasswordCheckTile(
                      _hasLetter && _hasNumber && _hasSymbol,
                      "Must contain a letter, a number, and a symbol.")
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Change password',
              onPressed: _updatePassword,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCheckTile(bool isValid, String text) {
    return ListTile(
      leading: Icon(
        isValid ? Icons.check_circle_outline : Icons.error_outline,
        color: isValid ? Colors.green : Colors.red,
        size: 24,
      ),
      title: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
