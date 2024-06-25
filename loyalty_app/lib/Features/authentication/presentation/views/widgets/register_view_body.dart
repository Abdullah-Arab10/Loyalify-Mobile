import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/address_and_phone_number_fields_section.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/first_name_and_last_name_fields_section.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/title_and_subtitle_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

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
        listener: (context, state) {},
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
                        const TitleAndSubTitleSection(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p33),
                        const FirstnameAndLastnameFieldsSection(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p33),
                        EmailAndpasswordfieldssection(
                          onChangedEmail: (value) =>
                              AuthValidationCubit.get(context)
                                  .setRegisterEmail(value),
                          onChangedPassword: (value) =>
                              AuthValidationCubit.get(context)
                                  .setRegisterPassword(value),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p33),
                        const AddressAndPhonenumberFieldsSection(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppPadding.p12),
                        BlocBuilder<AuthValidationCubit, AuthValidationState>(
                          builder: (context, state) {
                            return ButtonsSection(
                              buttonText: AppStrings.register,
                              bottomCenterText: AppStrings.alreadyHaveAnAccount,
                              onPressed: (state is AllDataRegisterIsValid)
                                  ? () {
                                    AuthCubit.get(context).register(context);
                                  }
                                  : null,
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
