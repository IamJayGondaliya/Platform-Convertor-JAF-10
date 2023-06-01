import 'package:flutter/widgets.dart';

class PlatformController extends ChangeNotifier {
  bool isAndroid = true;

  void changePlatform({required bool val}) {
    isAndroid = val;
    notifyListeners();
  }
}
