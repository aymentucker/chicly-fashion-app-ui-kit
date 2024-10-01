import 'package:chicly/components/custom_button.dart';
import 'package:chicly/components/custom_input.dart';
import 'package:chicly/screens/auth/forgot_password_screen.dart';
import 'package:chicly/screens/auth/register_screen.dart';
import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _loginUser() {}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back, Chicly',
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
              const SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: MyColors.primaryColor,
                ),
                onTapSuffixIcon: _togglePasswordVisibility,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {
                          // Implement state management logic
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    ),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Login', onPressed: _loginUser),
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
                    'Dont’t have an account?',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the sign-up screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(
                      'Register',
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
    );
  }
}
