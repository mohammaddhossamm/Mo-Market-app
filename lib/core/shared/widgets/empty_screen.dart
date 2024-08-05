import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyScreen extends StatelessWidget {
  final String image;
  final String text;
  const EmptyScreen({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
             const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
             const SizedBox(height: 20,),
             Text(
              text,
              style: Styles.textStyleNormal14,
              textAlign: TextAlign.center
             ),
          ],
        ),
      ),
    );
  }
}