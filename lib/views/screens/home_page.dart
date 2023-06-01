import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platfor_convertor_app/controllers/platform_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  bool isAndroid = Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAndroid ? "Android App" : "iOS App"),
        centerTitle: true,
        actions: [
          Consumer<PlatformController>(
            builder: (context, provider, child) => Transform.scale(
              scale: 0.7,
              child: Switch(
                value: provider.isAndroid,
                onChanged: (val) {
                  provider.changePlatform(val: val);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
