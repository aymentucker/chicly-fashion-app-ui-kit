import 'package:chicly/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: MyColors.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: MyColors.primaryColor)),
          ],
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: MyColors.primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      );
    }
  }
}
