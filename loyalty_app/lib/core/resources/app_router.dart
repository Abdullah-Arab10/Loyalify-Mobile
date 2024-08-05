import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/login_view.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/register_view.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo_impl.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/home_layout_view.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/search_view.dart';
import 'package:loyalty_app/Features/merchants_details/data/repos/store_details_repo_impl.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_offers_cubit/fetch_store_offers_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/merchants_details_view.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/offer_details_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/on_boarding_view.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeLayoutView = '/homeLayoutView';
  static const kSearchView = '/searchView';
  static const kMerchantcDetailsView = '/merchantcDetailsView';
  static const kOfferDetailsView = '/offerDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          initMerchantsModule();
          initStoreDetailsModule();
          initOffersModule();
          return const HomeLayoutView();
          // initStoreDetailsModule();
          // return const MerchantsDetailsView();
          // initOffersModule();
          // return const OfferDetailsView();
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeLayoutView,
        builder: (context, state) {
          initMerchantsModule();
          return const HomeLayoutView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return const SearchView();
        },
      ),
      GoRoute(
          path: kMerchantcDetailsView,
          builder: (context, state) {
            initStoreDetailsModule();
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => MerchantsDetailsCubit(),
                ),
                BlocProvider(
                  create: (context) => FetchStoreDetailsCubit(
                    getIt.get<StoreDetailsRepoImpl>(),
                  ),
                ),
                BlocProvider(
                    create: (context) =>
                        FetchStoreOffersCubit(getIt.get<OfferRepoImpl>()))
              ],
              child: MerchantsDetailsView(
                storeId: state.extra as int,
              ),
            );
          }),
    ],
  );
}
