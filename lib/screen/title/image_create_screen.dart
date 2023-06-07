// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../../component/app_button.dart';
import 'image_create_screen_controller.dart';

class ImageCreateScreen extends StatelessWidget {
  const ImageCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageCreateScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          '大喜利メーカー',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: const Center(
                child: Text(
                  '作成例',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            //TODO 画像を追加する。
            Image.asset('assets/example/example.png'),
            const Spacer(),
            const Text(
              'お題',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: controller.onTitleChanged,
                maxLines: 2,
                maxLength: 40,
                inputFormatters: [
                  TextInputFormatter.withFunction(
                      (TextEditingValue oldValue, TextEditingValue newValue) {
                    int numLines = '\n'.allMatches(newValue.text).length;
                    if (numLines > 1) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                ],
                minLines: 1,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'サブタイトル',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: TextField(
                onChanged: controller.onSubTitleChanged,
                maxLines: 2,
                maxLength: 20,
                inputFormatters: [
                  TextInputFormatter.withFunction(
                      (TextEditingValue oldValue, TextEditingValue newValue) {
                    int numLines = '\n'.allMatches(newValue.text).length;
                    if (numLines > 1) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                ],
                minLines: 1,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            AppButton(
              onTap: controller.onSubmit,
              title: '生成する',
              buttonColor: Colors.yellow,
              titleColor: Colors.black,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
