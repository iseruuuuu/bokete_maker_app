import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:bokete_maker_app/screen/store/store_screen.dart';

class HomeFulScreen extends StatefulWidget {
  const HomeFulScreen({Key? key}) : super(key: key);

  @override
  _HomeFulScreenState createState() => _HomeFulScreenState();
}

class _HomeFulScreenState extends State<HomeFulScreen> {
  final TextEditingController _controller = TextEditingController(text: '');
  ImageProvider? target;
  String fontName = '';
  String assets = 'assets/images/bokete.png';
  late Uint8List _uInt8list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          target != null ? Image(image: target!) : Image.asset(assets),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            height: 100,
            child: TextField(
              maxLines: 1,
              maxLength: 10,
              textAlign: TextAlign.center,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              addText(fontName);
            },
            icon: const Icon(Icons.icecream),
            label: const Text('反映する'),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                onImageStore();
                //TODO もし、画像が変化していなかったら、画像を保存しないようにする。
                //TODO ボタンの位置を変更したい。
                onTapStore();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                elevation: 10,
              ),
              child: const Text(
                '保存する',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                dialog();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                elevation: 10,
              ),
              child: const Text(
                '戻る',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future addText(String fontName) async {
    //TODO 文字の設定位置を考えたい。

    //TODO 日本語は大丈夫そう。

    //TODO 英語が絡んでくるとズレる。。。

    const int size = 60;
    final ImageEditorOption option = ImageEditorOption();
    final AddTextOption textOption = AddTextOption();
    var position = const Offset(0, 0);
    if (_controller.text.isEmpty) {
      position = const Offset(0, 0);
    } else if (_controller.text.length == 1) {
      position = const Offset(330, 240);
    } else if (_controller.text.length == 2) {
      position = const Offset(300, 240);
    } else if (_controller.text.length == 3) {
      position = const Offset(270, 240);
    } else if (_controller.text.length == 4) {
      position = const Offset(250, 240);
    } else if (_controller.text.length == 5) {
      position = const Offset(235, 240);
    } else if (_controller.text.length == 6) {
      position = const Offset(190, 240);
    } else if (_controller.text.length == 7) {
      position = const Offset(170, 240);
    } else if (_controller.text.length == 8) {
      position = const Offset(150, 240);
    } else if (_controller.text.length == 9) {
      position = const Offset(130, 240);
    } else if (_controller.text.length == 10) {
      position = const Offset(100, 240);
    }
    textOption.addText(
      EditorText(
        offset: position,
        text: _controller.text,
        fontSizePx: size,
        textColor: Colors.black,
        fontName: fontName,
      ),
    );
    option.outputFormat = const OutputFormat.png();
    option.addOption(textOption);
    final Uint8List u = await getAssetImage();
    final Uint8List? result =
        await ImageEditor.editImage(image: u, imageEditorOption: option);
    if (result == null) {
      return;
    }
    target = MemoryImage(result);
    _uInt8list = result;
    setState(() {});
  }

  Future<Uint8List> getAssetImage() async {
    final ByteData byteData = await rootBundle.load(assets);
    return byteData.buffer.asUint8List();
  }

  void onImageStore() async {
    await ImageGallerySaver.saveImage(_uInt8list);
  }

  void onTapStore() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StoreScreen(),
      ),
    );
  }

  Future dialog() {
    return showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("確認"),
        content: const Text('保存'),
        actions: [
          CupertinoDialogAction(
              child: const Text('Cancel'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              //Navigator.of(context).pop();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
    );
  }
}
