import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController extends GetxController {
  void open(url) async {
    // const url =
    //     'https://www.youtube.com/watch?v=1MTMmB0Bjw0&list=PLdUA2Q01_CNRe-WAvMXlRYX3FJ81HFM5y';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
