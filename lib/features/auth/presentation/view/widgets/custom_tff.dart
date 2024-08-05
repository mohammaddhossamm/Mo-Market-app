import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_border.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged, this.suffixIcon,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyleNormal12,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        border: borderTFF(),
        enabledBorder: borderTFF(),
        focusedBorder: borderTFF(borderColor: AppColors.primary),
        errorBorder: borderTFF(borderColor: Colors.redAccent),
        focusedErrorBorder: borderTFF(borderColor: Colors.redAccent),
      ),
    );
  }
}
