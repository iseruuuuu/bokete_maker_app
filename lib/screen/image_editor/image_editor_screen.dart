// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

// Project imports:
import '../../component/app_button.dart';
import 'image_editor_screen_controller.dart';

class ImageEditorScreen extends StatelessWidget {
  const ImageEditorScreen({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageEditorScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          iconSize: 30,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Screenshot(
            controller: controller.screenshotController,
            child: Stack(
              children: [
                Image.asset('assets/images/bokete.png'),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: controller.padding.value),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          const Spacer(),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: controller.fontSize.value,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      const Spacer(flex: 10),
                      Text(
                        subTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Text(
              'FontSize：${controller.fontSize.value}　Padding：${controller.padding.value}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const SizedBox(
                width: 130,
                child: Text(
                  '文字の大きさ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              IconButton(
                onPressed: controller.decrementFontSize,
                iconSize: 40,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
              ),
              const Spacer(flex: 1),
              IconButton(
                onPressed: controller.incrementFontSize,
                iconSize: 40,
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Spacer(flex: 2),
              const SizedBox(
                width: 130,
                child: Text(
                  'Textの位置',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              IconButton(
                onPressed: controller.decrementPadding,
                iconSize: 40,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
              ),
              const Spacer(flex: 1),
              IconButton(
                onPressed: controller.decrementPadding,
                iconSize: 40,
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const Spacer(),
          AppButton(
            onTap: controller.storeImage,
            title: '保存する',
            buttonColor: Colors.yellow,
            titleColor: Colors.black,
          ),
          const SizedBox(height: 30),
          AppButton(
            onTap: controller.shareImage,
            title: '共有する',
            buttonColor: Colors.black,
            titleColor: Colors.yellow,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
