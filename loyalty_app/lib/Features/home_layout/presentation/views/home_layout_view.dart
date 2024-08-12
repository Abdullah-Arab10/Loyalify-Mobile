import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_layout_cubit/home_layout_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_layout_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeLayoutCubit(),
        child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.gainsboro,
              appBar: CustomAppBar(
                isActions: true,
                isTitle: true,
                title: HomeLayoutCubit.get(context)
                    .titles[HomeLayoutCubit.get(context).currentIndex],
                icon: Assets.imagesMenu,
                backgroundColor: HomeLayoutCubit.get(context).currentIndex == 0
                    ? AppColors.kPrimaryColor
                    : AppColors.gainsboro,
                svgPicture: CustomIcon(
                  image: Assets.imagesLogo,
                  color: HomeLayoutCubit.get(context).currentIndex == 0
                      ? AppColors.white
                      : AppColors.kPrimaryColor,
                  padding: 12.0,
                ),
                currentIndex: HomeLayoutCubit.get(context).currentIndex,
              ),
              body: HomeLayoutViewBody(
                currentIndex: HomeLayoutCubit.get(context).currentIndex,
              ),
              bottomNavigationBar: CustomBottomNavBar(
                currentIndex: HomeLayoutCubit.get(context).currentIndex,
              ),
            );
          },
        ));
  }
}
