import 'package:canton/classes/custom_text.dart';
import 'package:flutter/material.dart';

import 'app_assets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppAssets.primaryColor,
    this.height = 48,
    this.width = double.infinity,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: color,
          ),
          onPressed: onTap,
          child: CustomTextWidget(
            text: text,
            textColor: textColor,
            fontSize: 15,
          )),
    );
  }
}
