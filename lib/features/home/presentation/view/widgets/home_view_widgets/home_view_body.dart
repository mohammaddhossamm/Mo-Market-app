import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/body_section.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/custom_home_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(),
              SizedBox(height: 20,),
              BodySection(),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
