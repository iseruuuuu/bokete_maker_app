import 'package:bokete_maker_app/screen/home_ful/home_ful_screen.dart';
import 'package:bokete_maker_app/screen/home_ful2/home_ful2_screen.dart';
import 'package:bokete_maker_app/screen/home_ful3/home_ful3_screen.dart';
import 'package:get/get.dart';

class TitleScreenController extends GetxController {
  void onTap1() {
    Get.to(() => const HomeFulScreen());
  }

  void onTap2() {
    Get.to(() => const HomeFulScreen2());
  }

  void onTap3() {
    Get.to(() => const HomeFulScreen3());
  }
}
