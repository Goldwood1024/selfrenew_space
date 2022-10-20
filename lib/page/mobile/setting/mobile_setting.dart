import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileSetting extends StatefulWidget {
  const MobileSetting({super.key});

  @override
  State<StatefulWidget> createState() => _MobileSettingState();
}

class _MobileSettingState extends State<MobileSetting> {
  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //   backgroundColor: Colors.blue,
    //   child: CustomScrollView(
    //     slivers: [
    //       CupertinoSliverNavigationBar(
    //         largeTitle: Text('设置'),
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              SoundNotifications.player();
            },
            icon: Icon(Icons.add),
            label: Text('11'),
          )
        ],
      ),
    );
  }
}
