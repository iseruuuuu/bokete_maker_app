// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ImageEditorScreenController extends GetxController {
  RxDouble fontSize = 25.0.obs;
  RxDouble padding = 20.0.obs;
  ScreenshotController screenshotController = ScreenshotController();

  void incrementFontSize() {
    if (fontSize < 33 && padding < 80) {
      fontSize.value++;
    }
  }

  void decrementFontSize() {
    fontSize.value--;
  }

  void incrementPadding() {
    if (fontSize < 33 && padding < 80) {
      padding.value++;
    }
  }

  void decrementPadding() {
    padding.value--;
  }

  Future<void> storeImage() async {
    screenshotController.capture().then((capturedImage) async {
      if (capturedImage != null) {
        await ImageGallerySaver.saveImage(capturedImage);
        EasyLoading.show(status: 'loading...');
        await Future.delayed(const Duration(seconds: 1));
        EasyLoading.dismiss();
        await Future.delayed(const Duration(seconds: 1));
        Get.snackbar(
          '保存成功',
          'カメラロールに保存しました',
          backgroundColor: Colors.yellow,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    });
  }

  void shareImage() {
    screenshotController.capture().then((capturedImage) async {
      if (capturedImage != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(capturedImage);
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
