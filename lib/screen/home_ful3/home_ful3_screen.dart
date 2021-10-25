// import 'dart:typed_data';
// import 'package:bokete_maker_app/screen/store/store_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_editor/image_editor.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
//
// class HomeFulScreen3 extends StatefulWidget {
//   const HomeFulScreen3({Key? key}) : super(key: key);
//
//   @override
//   _HomeFulScreenState3 createState() => _HomeFulScreenState3();
// }
//
// class _HomeFulScreenState3 extends State<HomeFulScreen3> {
//   final TextEditingController _controller = TextEditingController(text: '');
//   ImageProvider? target;
//   String fontName = '';
//   String assets = 'assets/images/odai.png';
//   late Uint8List _uint8list;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         title: const Text(
//           '大喜利 メーカー(3行)',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: Row(
//           children: [
//             const Spacer(),
//             GestureDetector(
//               onTap: Navigator.of(context).pop,
//               child: const Icon(
//                 Icons.arrow_back_ios,
//                 size: 40,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           target != null ? Image(image: target!) : Image.asset(assets),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//             child: SizedBox(
//               width: 400,
//               height: 100,
//               child: TextField(
//                 maxLines: 1,
//                 maxLength: 10,
//                 textAlign: TextAlign.center,
//                 controller: _controller,
//                 keyboardType: TextInputType.multiline,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//           ),
//           const Spacer(),
//
//           //TODO ボタンのデザインを変えたい。
//           GestureDetector(
//             onTap: () async {
//               await addText(fontName);
//             },
//             child: const Text(
//               '文字を反映する',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//           const Spacer(),
//
//           //TODO ボタンのデザインを変えたい。
//           GestureDetector(
//             onTap: () async {
//               onImageStore();
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const StoreScreen(),
//                 ),
//               );
//             },
//             child: const Text(
//               '画像を保存する',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
//
//   Future addText(String fontName) async {
//     //TODO 文字の設定位置を考えたい。
//
//     //TODO 日本語は大丈夫そう。
//
//     //TODO 英語が絡んでくるとズレる。。。
//
//     const int size = 60;
//     final ImageEditorOption option = ImageEditorOption();
//     final AddTextOption textOption = AddTextOption();
//     var position = const Offset(0, 0);
//     if (_controller.text.isEmpty) {
//       position = const Offset(0, 0);
//     } else if (_controller.text.length == 1) {
//       position = const Offset(330, 240);
//     } else if (_controller.text.length == 2) {
//       position = const Offset(300, 240);
//     } else if (_controller.text.length == 3) {
//       position = const Offset(270, 240);
//     } else if (_controller.text.length == 4) {
//       position = const Offset(250, 240);
//     } else if (_controller.text.length == 5) {
//       position = const Offset(235, 240);
//     } else if (_controller.text.length == 6) {
//       position = const Offset(190, 240);
//     } else if (_controller.text.length == 7) {
//       position = const Offset(170, 240);
//     } else if (_controller.text.length == 8) {
//       position = const Offset(150, 240);
//     } else if (_controller.text.length == 9) {
//       position = const Offset(130, 240);
//     } else if (_controller.text.length == 10) {
//       position = const Offset(100, 240);
//     }
//     textOption.addText(
//       EditorText(
//         offset: position,
//         text: _controller.text,
//         fontSizePx: size,
//         textColor: Colors.black,
//         fontName: fontName,
//       ),
//     );
//     option.outputFormat = const OutputFormat.png();
//     option.addOption(textOption);
//     final Uint8List u = await getAssetImage();
//     final Uint8List? result =
//     await ImageEditor.editImage(image: u, imageEditorOption: option);
//     if (result == null) {
//       return;
//     }
//     target = MemoryImage(result);
//     _uint8list = result;
//     setState(() {});
//   }
//
//   Future<Uint8List> getAssetImage() async {
//     final ByteData byteData = await rootBundle.load(assets);
//     return byteData.buffer.asUint8List();
//   }
//
//   void onImageStore() async {
//     final result = await ImageGallerySaver.saveImage(_uint8list);
//   }
// }
