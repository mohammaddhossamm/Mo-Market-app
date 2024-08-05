import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  final DetailsModel detailsModel;

  const DetailsView({
    super.key,
    required this.detailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: Scaffold(
        body: DetailsViewBody(
          detailsModel: detailsModel,
        ),
      ),
    );
  }
}
