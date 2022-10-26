import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileFunc extends StatefulWidget {
  const MobileFunc({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MobileFuncState();
}

class _MobileFuncState extends State<MobileFunc> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '功能模块',
        ),
        actions: [
          ActionBtn(
            onPressed: () {
              Navigator.pop(context);
            },
            title: '确定',
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            SimpleTile(
              title: '日常习惯',
              topRadius: true,
              onPressed: () {},
              showArrow: false,
              trailing: CommonSwitch(
                value: true,
                func: (bool) {},
              ),
            ),
            SimpleTile(
              title: '专注',
              bottomRadius: true,
              onPressed: () {},
              showArrow: false,
              trailing: CommonSwitch(
                value: true,
                func: (bool) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
