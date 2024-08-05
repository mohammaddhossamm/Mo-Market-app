import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/settings/data/model/profile_var_model/profile_var_model.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final ProfileVarModel model;
   final void Function() onTapOk;
     final bool? suffixIcon;
  const ProfileListItem({
    super.key,
    required this.model, 
    required this.onTapOk, 
    this.suffixIcon=false, 
   
  });

  @override
  Widget build(BuildContext context) {
 return Row(
      children: [
        Icon(
          model.icon,
          color: AppColors.primary,
          size: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: Styles.textStyleNormal12,
            ),
            Text(
              model.content,
              style: Styles.textStyleNormal14,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
           
            profileBottomSheet( 
              context,
              title: model.title,
              controller: model.controller,
              keyboardType: model.keyboardType,
              validator: model.validator,
              suffixIcon: suffixIcon,
              hintText: model.hintText!,
              onTapOk: onTapOk,
            ); 
          },
          icon: const Icon(
            Icons.edit,
            color: AppColors.primary,
            size: 20,
          ),
        ),
      ],
    );

  }
}
