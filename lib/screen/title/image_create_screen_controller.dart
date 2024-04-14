// Flutter imports:
import 'package:advertising_id/advertising_id.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:bokete_maker_app/admob/admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// Project imports:
import '../image_editor/image_editor_screen.dart';

class ImageCreateScreenController extends GetxController {
  String text = '';
  String subTitle = '';

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
    loadAppTracking();
    initPlatformState();
  }

  initPlatformState() async {
    String? advertisingId;
    bool? isLimitAdTrackingEnabled;
    try {
      advertisingId = await AdvertisingId.id(true);
    } on PlatformException {
      advertisingId = 'Failed to get platform version.';
    }

    try {
      isLimitAdTrackingEnabled = await AdvertisingId.isLimitAdTrackingEnabled;
    } on PlatformException {
      isLimitAdTrackingEnabled = false;
    }
    print(advertisingId);
    print(isLimitAdTrackingEnabled);
  }

  Future<void> loadAppTracking() async {
    if (await AppTrackingTransparency.trackingAuthorizationStatus ==
        TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

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
