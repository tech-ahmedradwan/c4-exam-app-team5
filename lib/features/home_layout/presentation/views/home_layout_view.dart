import '../../../explore/presentation/views/explore_view.dart';
import '../../helper/home_layout_enum.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../result/presentation/views/result_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/styles/assets.gen.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/custom_bottom_nav_bar_item.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  late HomeLayoutEnum _homeLayoutEnum;
  late List<Widget> _screens;
  @override
  void initState() {
    _homeLayoutEnum = HomeLayoutEnum.explore;
    _screens = [const ExploreView(), const ResultView(), const ProfileView()];
    super.initState();
  }

  void _onTapNavIcon(HomeLayoutEnum navEnum) {
    setState(() {
      _homeLayoutEnum = navEnum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_homeLayoutEnum.index],
      bottomNavigationBar: CustomBottomNavBar(
        navItems: [
          GestureDetector(
            onTap: () => _onTapNavIcon(HomeLayoutEnum.explore),
            child: CustomBottomNavBarItem(
              icon: Assets.icons.homeIcon.svg(),
              label: AppStrings.explore,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.explore,
            ),
          ),
          GestureDetector(
            onTap: () => _onTapNavIcon(HomeLayoutEnum.result),
            child: CustomBottomNavBarItem(
              icon: Assets.icons.resultIcon.svg(),
              label: AppStrings.result,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.result,
            ),
          ),
          GestureDetector(
            onTap: () => _onTapNavIcon(HomeLayoutEnum.profile),
            child: CustomBottomNavBarItem(
              icon: Assets.icons.profileIcon.svg(),
              label: AppStrings.profile,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.profile,
            ),
          ),
        ],
      ),
    );
  }
}
