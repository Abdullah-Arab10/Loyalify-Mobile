import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_images.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/widgets/custom_picture.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AuthValidationCubit(),
        ),
        BlocProvider(
          create: (context) => EyeVisibilityCubit(),
        ),
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is AuthSuccessState){
            _appPreferences.setUserLoggedIn();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: AuthCubit.get(context).isLoading,
            color: AppColors.white,
            progressIndicator: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomPicture(
                          image: Assets.imagesLogin,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p14),
                         EmailAndpasswordfieldssection(
                           onChangedEmail: (value) => AuthValidationCubit.get(context).setLoginEmail(value),
                           onChangedPassword: (value) => AuthValidationCubit.get(context).setLoginPassword(value),
                           ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p10),
                        BlocBuilder<AuthValidationCubit, AuthValidationState>(
                          builder: (context, state) {
                            return ButtonsSection(
                              buttonText: AppStrings.login,
                              bottomCenterText: AppStrings.createAnAccount,
                              onPressed: (state is AllDataLoginIsValid) ? () {
                                AuthCubit.get(context).login(context);
                              } : null,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
