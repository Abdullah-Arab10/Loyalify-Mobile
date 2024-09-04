import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/store_manager_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class StoreManagerView extends StatefulWidget {
  const StoreManagerView({super.key});

  @override
  State<StoreManagerView> createState() => _StoreManagerViewState();
}

class _StoreManagerViewState extends State<StoreManagerView> {
  final AppPreferences appPreferences = getIt.get<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backgroundColor: /*state is AuthLoadingState
                  ? const Color(0xffE2E2E2)
                  :*/
            AppColors.white,
        svgPicture: CustomIcon(
          image: Assets.imagesAdministrator,
          color: AppColors.kPrimaryColor,
          padding: 12.0,
        ),
        isTitle: true,
        title: 'Store Manager',
        isActions: true,
        icon: Assets.imagesLogout,
        actionsOnTap: () {
          appPreferences.logout();
          GoRouter.of(context).go(AppRouter.kOnboardingView);
        },
      ),
      body: const StoreManagerViewBody(),
    );
  }
}
