import 'package:flutter/cupertino.dart';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutState();
}

class _AboutState extends State<About> {
  openAppStore() {
    OpenStore.instance.open(
      appStoreId: '',
      appStoreIdMacOS: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.appBarHeight(),
        leading: BackBtn(
          title: '设置',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: SPHelper.gapDp80,
        title: const AppBarText(
          title: '关于',
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.home,
                size: SPHelper.settingIconSize,
              ),
              topRadius: true,
              title: '官方网站',
            ),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.arrow_counterclockwise,
                size: SPHelper.settingIconSize,
              ),
              title: '检查更新',
              bottomRadius: true,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
