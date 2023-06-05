import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              const Text("iOS App"),
              CupertinoActivityIndicator(
                color: CupertinoColors.activeBlue,
                // radius: 80,
                // animating: false,
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoButton.filled(
                // color: CupertinoColors.activeBlue,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: Text("Cupertino Action Sheet"),
                      message: Text("This page is purely developed in IOS widgets from Flutter Cupertino (iOS) style !!"),
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {},
                        isDestructiveAction: true,
                        child: const Text("Cancel"),
                      ),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Button 1"),
                              CupertinoSwitch(
                                value: false,
                                onChanged: (val) {},
                              ),
                            ],
                          ),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          isDefaultAction: true,
                          child: const Text("Button 1"),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          isDestructiveAction: true,
                          child: const Text("Button 1"),
                        ),
                        CupertinoButton(
                          color: CupertinoColors.activeGreen,
                          child: Text("NB"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                pressedOpacity: 0,
                // padding: const EdgeInsets.all(20),
                child: const Text("C Button"),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: Text("Action 1"),
                    trailingIcon: CupertinoIcons.delete,
                    isDestructiveAction: true,
                  ),
                ],
                child: FlutterLogo(
                  size: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
