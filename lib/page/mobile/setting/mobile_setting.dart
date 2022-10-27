import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
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
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              heroTag: Hero(tag: 'MobileSetting', child: SPHelper.empty),
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              largeTitle: Text(
                '设置',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            padding: EdgeInsets.zero,
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
                onPressed: () {
                  Routers.go(Routers.themeSetting);
                },
              ),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.app_badge,
                  size: SPHelper.settingIconSize,
                  color: HexColor('330E85'),
                ),
                title: '通知',
                onPressed: () {
                  Routers.go(Routers.notification);
                },
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
                  Icons.mail_outline,
                  size: SPHelper.settingIconSize,
                ),
                title: '意见反馈',
                topRadius: true,
              ),
              const SimpleTile(
                leading: Icon(
                  CupertinoIcons.star_circle_fill,
                  size: SPHelper.settingIconSize,
                ),
                title: '评分',
              ),
              SimpleTile(
                leading: const Icon(
                  CupertinoIcons.info,
                  size: SPHelper.settingIconSize,
                ),
                title: '关于',
                bottomRadius: true,
                showDivider: false,
                trailing: const Text(
                  '1.0.0',
                  style: TextStyle(
                    fontSize: SPHelper.fontSp16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                onPressed: () {
                  Routers.go(Routers.about);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
