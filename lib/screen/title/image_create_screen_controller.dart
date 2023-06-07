// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// Project imports:
import '../image_editor/image_editor_screen.dart';

class ImageCreateScreenController extends GetxController {
  String text = '';
  String subTitle = '';

  void onTitleChanged(String value) {
    text = value;
  }

  void onSubTitleChanged(String value) {
    subTitle = value;
  }

  void onSubmit() async {
    if (text.isNotEmpty || subTitle.isNotEmpty) {
      EasyLoading.show(status: 'loading...');
      await Future.delayed(const Duration(seconds: 3));
      EasyLoading.dismiss();
      await Future.delayed(const Duration(seconds: 1));
      Get.to(
        () => ImageEditorScreen(
          title: text,
          subTitle: subTitle,
        ),
      );
    } else {
      Get.snackbar(
        '生成失敗',
        'お題を記載してください。',
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }
}
