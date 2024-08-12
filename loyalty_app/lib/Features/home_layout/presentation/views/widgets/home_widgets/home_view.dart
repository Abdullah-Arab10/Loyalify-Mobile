import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/action_row.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/circular_pink_container.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/list_of_offers.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/list_popular_stores.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/points_row.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/view_all_row.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                const CircularPinkContainer(),
                Column(
                  children: [
                    const PointsRow(),
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
    );
  }
}
