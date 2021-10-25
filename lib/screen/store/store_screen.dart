import 'package:bokete_maker_app/screen/store/store_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          '大喜利メーカー',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '保存が完了しました。',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            //TODO 画像を載せる。
            //Image(image: target!),

            const Text(
              'Twitterにシェアをしてみよう',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: controller.onTapTwiter,
              child: const Text(
                'シェアをする',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
