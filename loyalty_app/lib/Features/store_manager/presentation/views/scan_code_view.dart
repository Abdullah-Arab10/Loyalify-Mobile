import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos_impl.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/process_on_points_cubit/process_on_points_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/curved_corners_painter.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/extensions_manager.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:loyalty_app/core/resources/app_router.dart';

class ScanCodeView extends StatefulWidget {
  const ScanCodeView({super.key, required this.takeOrAdd});

  final bool takeOrAdd;

  @override
  State<ScanCodeView> createState() => _ScanCodeViewState();
}

class _ScanCodeViewState extends State<ScanCodeView> {
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();
  late TextEditingController _totalCostController;
  bool isTotalCostValid = true;
  String storeManagerId = '';

  @override
  void initState() {
    _appPreferences.getToken().then((value) {
      storeManagerId = JwtDecoder.decode(value)['sub'];
    });
    _totalCostController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessOnPointsCubit, ProcessOnPointsState>(
      listener: (context, state) {
        final SnackBar snackBar;
        if (state is ProcessOnPointsSuccessState) {
          snackBar = customSnackBar(
              title: 'Will Done!',
              message: widget.takeOrAdd
                  ? 'Points added successfully'
                  : 'Points have been successfully deducted',
              contentType: ContentType.success,
              color: AppColors.successGren);
          showSnackBar(context, snackBar);
          // _appPreferences.setUserLoggedIn();
          GoRouter.of(context).pop();
        } else if (state is ProcessOnPointsFailureState) {
          snackBar = customSnackBar(
            title: 'On Snap',
            message: state.message,
            contentType: ContentType.failure,
          );
          showSnackBar(context, snackBar);
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: ProcessOnPointsCubit.get(context).isLoading,
          color: AppColors.darkGainsboro,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBar(
              backgroundColor: state is ProcessOnPointsLoadingState
                  ? const Color(0xffE2E2E2)
                  : AppColors.white,
              svgPicture: CustomIcon(
                image: Assets.imagesLeftArrow,
                color: AppColors.black,
                padding: 12.0,
              ),
              onTap: () {
                GoRouter.of(context).pop();
              },
              isTitle: true,
              title: 'Scan QR Code',
            ),
            body: Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates,
                    returnImage: true,
                  ),
                  onDetect: (capture) {
                    final Uint8List? image = capture.image;
                    if (image != null) {
                      if (widget.takeOrAdd) {
                        customAlertDialog(
                            context, capture.barcodes.first.rawValue ?? ' | ');
                      } else {
                        ProcessOnPointsCubit.get(context).takeOffer(
                            capture.barcodes.first.rawValue?.split('|')[0] ??
                                "",
                            capture.barcodes.first.rawValue?.split('|')[1] ??
                                "");
                      }
                    }
                  },
                ),
                // Corner shapes overlay
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: CustomPaint(
                      painter: CurvedCornersPainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> customAlertDialog(BuildContext context, String result) {
    return showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<StoreManagerCubit, StoreManagerState>(
          listener: (context, state) {
            if (state is TotalCostIsValid) {
              isTotalCostValid = true;
            } else if (state is TotalCostIsInValid) {
              isTotalCostValid = false;
            }
          },
          builder: (context, state) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              title: CustomTextFieldWidget(
                textFieldModel: TextFieldModel(
                  controller: _totalCostController,
                  label: 'Total Cost',
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      StoreManagerCubit.get(context).setTotalCost(value),
                  error: (isTotalCostValid)
                      ? null
                      : 'total cost must not be empty',
                  prefixIcon: Assets.imagesDollarSign,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.height / AppPadding.p50),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      foregroundColor: AppColors.white,
                      text: 'Add Total Cost',
                      backgroundColor: AppColors.kPrimaryColor,
                      onPressed: (state is AllDataIsValid)
                          ? () {
                              StoreManagerCubit.get(context)
                                  .clearstoreManagerObject();
                              GoRouter.of(context).pop();
                              ProcessOnPointsCubit.get(context).addPoints(
                                  result.split('|')[0],
                                  storeManagerId,
                                  double.tryParse(_totalCostController.text) ??
                                      0);
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _totalCostController.dispose();
    super.dispose();
  }
}
