import 'package:flutter/cupertino.dart';
import 'package:platfor_convertor_app/controllers/platform_controller.dart';
import 'package:provider/provider.dart';

class IOsHomePage extends StatelessWidget {
  const IOsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("iOS App"),
        backgroundColor: CupertinoColors.extraLightBackgroundGray.withOpacity(0),
        trailing: Consumer<PlatformController>(builder: (context, provider, widget) {
          return Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: provider.isAndroid,
              onChanged: (val) => provider.changePlatform(val: val),
            ),
          );
        }),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          const Text("iOS App"),
        ],
      ),
    );
  }
}
