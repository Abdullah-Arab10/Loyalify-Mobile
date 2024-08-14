import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/add_cashier_cubit/add_cashier_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/add_cashier_fields_section.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/widgets/custom_svg_picture.dart';

class AddCashierViewBody extends StatefulWidget {
  const AddCashierViewBody({super.key});

  @override
  State<AddCashierViewBody> createState() => _AddCashierViewBodyState();
}

class _AddCashierViewBodyState extends State<AddCashierViewBody> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCashierCubit(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvgPicture(
                      image: Assets.imagesAddCashier,
                      maxWidth: getMaxWidth(context)),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p14),
                      const AddCashierFieldsSection(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              AppPadding.p10),
                      BlocBuilder<AddCashierCubit, AddCashierState>(
                        builder: (context, state) {
                          return ButtonsSection(
                            buttonText: 'Add Cashier',
                            onPressed: (state is AllDataIsValid) ? () {} : null,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
