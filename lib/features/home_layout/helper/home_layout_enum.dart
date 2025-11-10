import '../../../core/constants/app_strings/app_strings.dart';

enum HomeLayoutEnum {
  explore(appBarTitle: AppStrings.exploreAppBar),
  result(appBarTitle: AppStrings.resultAppBar),
  profile(appBarTitle: AppStrings.profileAppBar);

  const HomeLayoutEnum({required this.appBarTitle});

  final String appBarTitle;
}
