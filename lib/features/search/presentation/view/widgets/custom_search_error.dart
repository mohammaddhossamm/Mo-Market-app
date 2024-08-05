import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSearchError extends StatelessWidget {
  final String lottie;
  final String errorMessage;
  const CustomSearchError({super.key, required this.lottie, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4, 
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Lottie.asset(
                    lottie,  
                    fit: BoxFit.contain,
                    repeat: true,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                errorMessage,
                style:Styles.textStyleNormal14,
                textAlign: TextAlign.center,
              ),             
            ],
          ),
        ),
    );
  }
}
