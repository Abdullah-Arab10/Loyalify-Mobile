import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_points_cubit/get_points_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_popular_stores_cubit/get_popular_stores_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/action_row.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/circular_pink_container.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/list_of_offers.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/list_popular_stores.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/points_row.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/view_all_row.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/widgets/shimmer_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreferences appPreferences = getIt.get<AppPreferences>();

  String userId = '';

  @override
  void initState() {
    appPreferences.getToken().then((value) {
      userId = JwtDecoder.decode(value)['sub'];
      GetPointsCubit.get(context).getUserPoints(userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        GetPointsCubit.get(context).getUserPoints(userId);
        GetPopularStoresCubit.get(context).getPopularStores();
        GetPopularStoresCubit.get(context).getPopularStores();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(alignment: Alignment.topCenter, children: [
                  const CircularPinkContainer(),
                  Column(
                    children: [
                      BlocBuilder<GetPointsCubit, GetPointsState>(
                        builder: (context, state) {
                          return state is GetPointsSuccessState
                              ? PointsRow(
                                  points: state.points,
                                )
                              : state is GetPointsFailureState
                                  ? Container(
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Text(
                                          state.errMessage,
                                          style:
                                              AppStyles.styleSemiBold20(context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : Shimmer.fromColors(
                                      baseColor: AppColors.white,
                                      highlightColor: AppColors.sonicSilver,
                                      child: Container(
                                        height: 90,
                                        padding: const EdgeInsets.all(16),
                                        margin: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                        },
                      ),
                      Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: const ActionRow()),
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 24,
                ),
                const ViewAllRow(
                  leftText: 'Popular Merchants',
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 100, child: ListPopularStores()),
                const SizedBox(
                  height: 24,
                ),
                const ViewAllRow(
                  leftText: 'Promo & Rewards',
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 170, child: ListOfOffers()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
