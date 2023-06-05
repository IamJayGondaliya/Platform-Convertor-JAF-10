import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platfor_convertor_app/controllers/platform_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  bool isAndroid = Platform.isAndroid;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Container(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState!.showBottomSheet(
                  (context) => Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ),
                  elevation: 10,
                  enableDrag: false,
                );
              },
              child: const Text("Show Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  barrierColor: Colors.grey.withOpacity(0.5),
                  isDismissible: false,
                  showDragHandle: true,
                  useSafeArea: true,
                  builder: (context) => Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Show Modal Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}
