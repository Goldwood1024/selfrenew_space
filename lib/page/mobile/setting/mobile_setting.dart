import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileSetting extends StatefulWidget {
  const MobileSetting({super.key});

  @override
  State<StatefulWidget> createState() => _MobileSettingState();
}

class _MobileSettingState extends State<MobileSetting> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const Text(
          '设置',
          style: TextStyle(
            fontSize: SPHelper.fontSp20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getHeightBox(SPHelper.gapDp12),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.slowmo,
                size: SPHelper.settingIconSize,
                color: HexColor('330E85'),
              ),
              title: '主题',
              topRadius: true,
            ),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.app_badge,
                size: SPHelper.settingIconSize,
                color: HexColor('330E85'),
              ),
              title: '通知',
            ),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.ellipsis,
                size: SPHelper.settingIconSize,
                color: HexColor('330E85'),
              ),
              title: '更多',
              bottomRadius: true,
              showDivider: false,
            ),
            SPHelper.getHeightBox(SPHelper.gapDp12),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.bubble_left_bubble_right,
                size: SPHelper.settingIconSize,
              ),
              title: '意见反馈',
              trailing: Text(
                '邮件',
                style: TextStyle(
                  fontSize: SPHelper.fontSp16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              topRadius: true,
            ),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.info,
                size: SPHelper.settingIconSize,
              ),
              title: '关于',
              bottomRadius: true,
              showDivider: false,
              trailing: Text(
                '1.0.0',
                style: TextStyle(
                  fontSize: SPHelper.fontSp16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
