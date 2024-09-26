import 'package:FLUTTERPROJECT/app/modules/home/views/Welcome_views.dart';
import 'package:get/get.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeScreen>(
      () => WelcomeScreen(),
    );
  }
}
