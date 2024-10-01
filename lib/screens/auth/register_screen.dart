import 'package:chicly/components/custom_button.dart';
import 'package:chicly/components/custom_input.dart';
import 'package:chicly/screens/auth/login_screen.dart';
import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _registerUser() {}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Register to join us',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryColor),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Welcome back! Please enter your details.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        hintText: 'Create Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: MyColors.primaryColor,
                        ),
                        onTapSuffixIcon: _togglePasswordVisibility,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        hintText: 'Confirm Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: MyColors.primaryColor,
                        ),
                        onTapSuffixIcon: _toggleConfirmPasswordVisibility,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Register',
                        onPressed: () => _registerUser(),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.grey[400]),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Or'),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Continue with Google',
                        onPressed: () {},
                        isOutlined: true,
                        icon: SvgPicture.asset(
                          'assets/icons/google.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account? ',
                            style: TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'By registering, you agree to the Terms of Use and Privacy Policy.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
