import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class URLController extends GetxController {
  Future<void> launchURL(String url) async {
    String encodedUrl = Uri.encodeFull(url);
    if (!await canLaunch(encodedUrl)) {
      throw 'Could not launch $url';
    } else {
      await launch(encodedUrl);
    }
  }
}
