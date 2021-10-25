import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreScreenController extends GetxController {
  void onTapTwiter() async {
    final Map<String, dynamic> tweetQuery = {
      "text": 'あああ',
      "url": 'this.url',
      "hashtags": 'this.hashtags.join(",")',
      "via": 'this.via',
      "related": 'this.related',
    };

    void onTapShare() async {
      //Twitterにシェアをする。
      final Uri tweetScheme =
          Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

      final Uri tweetIntentUrl =
          Uri.https("twitter.com", "/intent/tweet", tweetQuery);

      await canLaunch(tweetScheme.toString())
          ? await launch(tweetScheme.toString())
          : await launch(tweetIntentUrl.toString());
    }

    print('sasa');
  }
}
