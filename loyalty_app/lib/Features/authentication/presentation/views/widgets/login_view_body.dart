import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttonsSection.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/emailAndPasswordFieldsSection.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/values_manager.dart';
import 'package:loyalty_app/core/widgets/customPicture.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
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
          return Center(
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
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30),
                      const CustomPicture(
                        image: Assets.imagesLogin,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p12),
                      const EmailAndpasswordfieldssection(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p10),
                      const ButtonsSection(),
                    ],
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
