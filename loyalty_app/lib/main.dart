import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos_impl.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_layout_cubit/home_layout_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_category_cubit/merchants_category_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/search_cubit/search_cubit.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/theme_manager.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const Loyalify());
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => const Loyalify()
  //   ));
}

class Loyalify extends StatelessWidget {
  const Loyalify({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MerchantsCubit(),
        ),
        BlocProvider(create: (context) => MerchantsCategoryCubit(getIt.get<MerchantsReposImpl>())..fetchCategories()
        ),
        BlocProvider(create: (context) => MerchantsStoreCubit(getIt.get<MerchantsReposImpl>())..fetchStores(categoryId: 0),
        ),
        BlocProvider(create: (context) => SearchCubit(getIt.get<MerchantsReposImpl>()),
        ),
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: getApplicationTheme(),
      ),
    );
  }
}
