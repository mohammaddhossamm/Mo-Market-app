import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

class GetStartImages extends StatelessWidget {
  const GetStartImages({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.all(Radius.circular(screenWidth * 0.25)),
                    ),
                    child: Image.asset(
                      AssetsData.clothes,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.grayColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(screenWidth / 7)),
                          ),
                            child: Image.asset(
                      AssetsData.laptop,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Container(
                          width: (screenWidth * 0.5) - 20,
                          height: (screenWidth * 0.5) - 20,
                          margin: const EdgeInsets.all(0),
                          decoration: const BoxDecoration(
                            color: AppColors.grayColor,
                          ),
                            child: Image.asset(
                      AssetsData.mobile,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
