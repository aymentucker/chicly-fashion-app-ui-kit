import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onTapSuffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.onTapSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(prefixIcon, color: MyColors.primaryColor),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
