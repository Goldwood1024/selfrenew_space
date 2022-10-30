import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  openAppStore() {
    OpenStore.instance.open(
      appStoreId: '',
      appStoreIdMacOS: '',
    );
  }

  late bool select;

  @override
  void initState() {
    super.initState();
    select = false;
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
          title: '通知',
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            SimpleTile(
              leading: const Icon(
                CupertinoIcons.bell,
                size: SPHelper.settingIconSize,
              ),
              topRadius: true,
              title: '完成提示音',
              onPressed: () {
                BottomDialog.showValueSelect(
                  context,
                  Padding(
                    padding: SPHelper.pagePaddingHorizontal,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                        ),
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                          trailing: Icon(Icons.check_circle_rounded),
                        ),
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                        ),
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                        ),
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                        ),
                        SimpleTile(
                          title: '钢琴',
                          showArrow: false,
                        ),
                      ],
                    ),
                  ),
                  "",
                );
              },
            ),
            SimpleTile(
              leading: const Icon(
                Icons.vibration,
                size: SPHelper.settingIconSize,
              ),
              title: '震动',
              bottomRadius: true,
              showDivider: false,
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
