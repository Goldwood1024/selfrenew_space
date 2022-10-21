import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

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
        title: Text(
          '通知',
          style: TextStyle(
            fontSize: SPHelper.fontSp20,
            color: Theme.of(context).textTheme.displayLarge?.color,
          ),
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.bell,
                size: SPHelper.settingIconSize,
              ),
              topRadius: true,
              title: '完成提示音',
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
              trailing: FlutterSwitch(
                value: select,
                width: 52,
                height: 28,
                toggleSize: 25,
                padding: 2,
                activeColor: Theme.of(context).primaryColor,
                onToggle: (bool value) {
                  setState(() {
                    select = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
