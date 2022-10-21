import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '行动',
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
