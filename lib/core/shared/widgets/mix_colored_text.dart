import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class MixColoredText extends StatelessWidget {
  const MixColoredText({
    super.key,
    required this.text1,
    required this.colorestext,
    required this.text2, 
    this.style=Styles.textStyleBold18,
  });

  final String text1;
  final String colorestext;
  final String text2;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: style,
      textAlign: TextAlign.center,
      TextSpan(
        text: text1,
        children: [
          TextSpan(
            text: colorestext,
            style: style!.copyWith(
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: text2,
          ),
        ],
      ),
    );
  }
}
