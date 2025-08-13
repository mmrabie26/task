
import 'package:flutter/material.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';

Widget authTextFromField({
  required String label,
  required String hint,
  required IconData icon,
  bool isPassword = false,
  TextInputType? keyboardType,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyles.textStyle16.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: Spacing.s8),
      TextFormField(
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.grey[600],
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.s16,
            vertical: Spacing.s16,
          ),
        ),
      ),
    ],
  );
}

