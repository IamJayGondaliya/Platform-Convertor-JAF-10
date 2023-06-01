import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platfor_convertor_app/controllers/platform_controller.dart';
import 'package:platfor_convertor_app/views/screens/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:platfor_convertor_app/views/screens/ios_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PlatformController(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformController>(context)).isAndroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              useMaterial3: true,
            ),
            routes: {
              '/': (context) => HomePage(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            routes: {
              '/': (context) => IOsHomePage(),
            },
          );
  }
}
