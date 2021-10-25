import 'package:bokete_maker_app/screen/home_ful/home_ful_screen.dart';
import 'package:bokete_maker_app/screen/home_ful2/home_ful2_screen.dart';
import 'package:bokete_maker_app/screen/home_ful3/home_ful3_screen.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleScreenController extends GetxController {
  final InAppReview inAppReview = InAppReview.instance;

  void onTap1() {
    Get.to(() => const HomeFulScreen());
  }

  void onTapDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("現在作成中です"),
          content: const Text("応援してください！"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('戻る'),
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text("応援する"),
              onPressed: () {
                Navigator.pop(context);
                _appReview();
              },
            ),
          ],
        );
      },
    );
  }

  void _appReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
