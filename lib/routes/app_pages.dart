import 'package:get/get.dart';
import '../views/splash_page.dart';
import '../views/home_page.dart';
import '../views/campaign_matching_page.dart';
import '../views/my_info_page.dart';
import '../views/basic_info_page.dart';
import '../views/change_password_page.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.campaign, page: () => const CampaignMatchingPage()),
    GetPage(name: Routes.myInfo, page: () => const MyInfoPage()),
    GetPage(name: Routes.basicInfo, page: () => const BasicInfoPage()),
    GetPage(name: Routes.changePassword, page: () => const ChangePasswordPage()),
  ];
}
