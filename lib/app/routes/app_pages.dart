import 'package:get/get.dart';
import 'package:mobile/app/modules/ai_food_analysis/foodanalysis.dart';
import 'package:mobile/app/modules/daftar/bindings/daftar_binding.dart';
import 'package:mobile/app/modules/daftar/views/daftar_view.dart';
import 'package:mobile/app/modules/home/bindings/binding.dart' as HomeBindings;
import 'package:mobile/app/modules/home/views/home_view.dart';
import 'package:mobile/app/modules/masuk/bindings/masuk_binding.dart';
import 'package:mobile/app/modules/masuk/views/masuk_view.dart';
import 'package:mobile/app/modules/onBoarding/bindings/onboarding_bindings.dart';
import 'package:mobile/app/modules/onboarding/views/onboarding_view.dart';
import 'package:mobile/app/modules/splash/bindings/splash_bindings.dart';
import 'package:mobile/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBindings.HomeBindings(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => MasukView(),
      binding: MasukBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: _Paths.ANALYSIS,
      page: () => FoodAnalysisScreen(),
    ),
  ];
}
