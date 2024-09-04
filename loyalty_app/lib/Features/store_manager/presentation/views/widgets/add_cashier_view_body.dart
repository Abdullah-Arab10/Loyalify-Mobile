import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos_impl.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/add_cashier_cubit/add_cashier_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/add_cashier_fields_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/widgets/custom_svg_picture.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCashierViewBody extends StatefulWidget {
  const AddCashierViewBody({super.key});

  @override
  State<AddCashierViewBody> createState() => _AddCashierViewBodyState();
}

class _AddCashierViewBodyState extends State<AddCashierViewBody> {
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();
  final _formKey = GlobalKey<FormState>();
  String storeManagerId = '';

  @override
  void initState() {
    _appPreferences.getToken().then((value) {
      storeManagerId = JwtDecoder.decode(value)['sub'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCashierCubit(getIt.get<StoreManagerReposImpl>()),
      child: BlocConsumer<AddCashierCubit, AddCashierState>(
        listener: (context, state) {
          final SnackBar snackBar;
          if (state is CashierAddedSuccess) {
            snackBar = customSnackBar(
                title: 'Will Done!',
                message: 'Cashier Added Successfully',
                contentType: ContentType.success,
                color: AppColors.successGren);
            showSnackBar(context, snackBar);
          } else if (state is CashierAddedFailure) {
            snackBar = customSnackBar(
              title: 'On Snap',
              message: state.errMessage,
              contentType: ContentType.failure,
            );
            showSnackBar(context, snackBar);
            AddCashierCubit.get(context).clearcashierObject();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: AddCashierCubit.get(context).isLoading,
            color: AppColors.darkGainsboro,
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
                                    AppPadding.p12),
                            ButtonsSection(
                              buttonText: 'Add Cashier',
                              onPressed: (state is AllDataIsValid)
                                  ? () {
                                      AddCashierCubit.get(context)
                                          .addCashier(storeManagerId);
                                    }
                                  : null,
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppPadding.p12),
                          ],
                        )
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
