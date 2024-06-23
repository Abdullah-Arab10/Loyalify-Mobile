import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/app_styles.dart';
import 'package:loyalty_app/core/utils/strings_manager.dart';
import 'package:loyalty_app/core/utils/values_manager.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class EmailAndpasswordfieldssection extends StatefulWidget {
  const EmailAndpasswordfieldssection({super.key});

  @override
  State<EmailAndpasswordfieldssection> createState() => _EmailAndpasswordfieldssectionState();
}

class _EmailAndpasswordfieldssectionState extends State<EmailAndpasswordfieldssection> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

   bool isEmailValid = true;
   bool isPasswordValid = true;

  /*_bind() {
    isEmailValid = true;
    isPasswordValid = true;
    _emailController
        .addListener(() => AuthValidationCubit.get(context).setEmail(_emailController.text));
    _passwordController
        .addListener(() => AuthValidationCubit.get(context).setPassword(_passwordController.text));
  }*/

@override
  void initState() {
    //_bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthValidationCubit, AuthValidationState>(
      listener: (BuildContext context, AuthValidationState state) { 
        if(state is EmailIsValid){
          isEmailValid = true;
        }else if(state is EmailIsInValid){
          isEmailValid = false;
        }else if(state is PasswordIsValid){
          isPasswordValid = true;
        }else if(state is PasswordIsInValid){
          isPasswordValid = false;
        }
       },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _emailController,
                label: AppStrings.email,
                onChanged: (value) => AuthValidationCubit.get(context).setEmail(value),
                error: (isEmailValid) ? null : AppStrings.emailError,
                textStyle: AppStyles.styleMedium20(context).copyWith(
                  color: Colors.grey[400],
                ),
                prefixIcon: Assets.imagesEmailOutlined,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / AppPadding.p33),
            BlocBuilder<EyeVisibilityCubit, EyeVisibilityState>(
              builder: (context, state) {
                return CustomTextFieldWidget(
                  textFieldModel: TextFieldModel(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: AppStrings.password,
                    onChanged: (value) => AuthValidationCubit.get(context).setPassword(value),
                    error: (isPasswordValid)
                                ? null
                                : '${AppStrings.passwordError1}\n${AppStrings.passwordError2}',
                    textStyle: AppStyles.styleMedium20(context).copyWith(
                      color: Colors.grey[400],
                    ),
                    prefixIcon: Assets.imagesLockOutlined,
                    obscureText: EyeVisibilityCubit.get(context).isPassword,
                    suffixPressed: EyeVisibilityCubit.get(context)
                        .changePasswordVisibility,
                    suffixIcon: EyeVisibilityCubit.get(context).suffix,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
