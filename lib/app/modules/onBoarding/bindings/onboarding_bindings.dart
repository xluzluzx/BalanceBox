import 'package:get/get.dart';
// import 'package:mobile/app/modules/home/controllers/home_controllers.dart';
import 'package:mobile/app/modules/onboarding/controllers/onboarding_controllers.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingControllers>(
      () => OnboardingControllers(),
    );
  }
}
