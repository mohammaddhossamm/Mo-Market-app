import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.textStyleBold18,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          body,
          style: Styles.textStyleNormal12,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
