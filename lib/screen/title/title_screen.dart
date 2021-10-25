import 'package:bokete_maker_app/gen/assets.gen.dart';
import 'package:bokete_maker_app/screen/title/title_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TitleScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 13,
        title: const Text(
          '大喜利メーカー',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: controller.onTap1,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 10,
              ),
              child: Assets.images.title01.image(
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            ElevatedButton(
              onPressed: controller.onTapDialog,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 10,
              ),
              child: Assets.images.title02.image(
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            ElevatedButton(
              onPressed: controller.onTapDialog,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 10,
              ),
              child: Assets.images.title03.image(
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
