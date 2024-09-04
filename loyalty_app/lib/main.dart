import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/home_repo/home_repo_impl.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos_impl.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo_impl.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_points_cubit/get_points_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_popular_offers_cubit/get_popular_offers_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_popular_stores_cubit/get_popular_stores_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_category_cubit/merchants_category_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/search_cubit/search_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos_impl.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/process_on_points_cubit/process_on_points_cubit.dart';
import 'package:loyalty_app/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/theme_manager.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/widgets/firebase_notifications.dart';

//import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();
  await FireBaseNotifications().initNotifications();
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
        BlocProvider(
          create: (context) => EyeVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => GetPointsCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetPopularStoresCubit(getIt.get<HomeRepoImpl>())
            ..getPopularStores(),
        ),
        BlocProvider(
          create: (context) => GetPopularOffersCubit(getIt.get<HomeRepoImpl>())
            ..getPopularOffers(),
        ),
        BlocProvider(
          create: (context) => MerchantsCubit(),
        ),
        BlocProvider(
            create: (context) =>
                MerchantsCategoryCubit(getIt.get<MerchantsReposImpl>())
                  ..fetchCategories()),
        BlocProvider(
          create: (context) =>
              MerchantsStoreCubit(getIt.get<MerchantsReposImpl>())
                ..fetchStores(categoryId: 0),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<MerchantsReposImpl>()),
        ),
        BlocProvider(
            create: (context) =>
                OffersCubit(getIt.get<OfferRepoImpl>())..fetchAllOffersUser()),
        BlocProvider(
          create: (context) => StoreManagerCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ProcessOnPointsCubit(getIt.get<StoreManagerReposImpl>()),
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
