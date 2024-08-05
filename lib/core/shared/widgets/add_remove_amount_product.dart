import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/custom_amount_button.dart';
import 'package:flutter/material.dart';

class AddRemoveAmountProduct extends StatelessWidget {
  final void Function() addOnPressed;
  final void Function() removeOnPressed;
  final int amount;
  const AddRemoveAmountProduct(
      {super.key,
      required this.addOnPressed,
      required this.removeOnPressed,
      required this.amount,
      });

  @override
  Widget build(BuildContext context) {
    return
  
         Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAmountButton(
              isAdd: false,
              onPressed: removeOnPressed,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$amount',
              style: Styles.textStyleBold14,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomAmountButton(
              onPressed:addOnPressed,
            ),
          ],
        );
  }
}
