import 'package:flutter/cupertino.dart';

class MobileSetting extends StatefulWidget {
  const MobileSetting({super.key});

  @override
  State<StatefulWidget> createState() => _MobileSettingState();
}

class _MobileSettingState extends State<MobileSetting> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('设置'),
        ),
      ],
    );
  }
}
