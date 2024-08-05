import 'package:e_commerce_app/core/shared/widgets/custom_alart_dialog.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/amount_price_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

 customBottomSheet(context,{required num price})  {
   showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             AmountPriceButton(price:price),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              textButton: AppLocalizations.of(context)!.buy,
              onPressed: () {
                customAlartDialog(context);
              },
            ),
             const SizedBox(height: 20,),
          ],
        ),
      );
    },
  );
}
