import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameAndDetailsProduct extends StatelessWidget {
  final String productName;
  final String productDescription;
  const NameAndDetailsProduct({super.key, required this.productName, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: Styles.textStyleBold16,
          ),
          const SizedBox(
            height: 15,
          ),
           Text(
           AppLocalizations.of(context)!.productDetails,
            style: Styles.textStyleBold14,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            productDescription,
            style: Styles.textStyleNormal14,
          ),
        ],
      ),
    );
  }
}
