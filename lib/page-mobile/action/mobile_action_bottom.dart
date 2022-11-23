import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class MobileActionBottom extends StatefulWidget {
  const MobileActionBottom({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionBottomState();
}

class _MobileActionBottomState extends State<MobileActionBottom> {
  @override
  Widget build(BuildContext context) {
    AppSettingProvider appSettingProviderUpdate =
        Provider.of(context, listen: false);
    AppSettingProvider appSettingProvider = Provider.of(context);

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
              title: '习惯',
              topRadius: true,
              onPressed: () {},
              showArrow: false,
              trailing: CommonSwitch(
                value: appSettingProvider.hasModule('habit'),
                func: (value) {
                  appSettingProviderUpdate.updateModule('habit', !value);
                },
              ),
            ),
            SimpleTile(
              title: '专注',
              bottomRadius: true,
              onPressed: () {},
              showArrow: false,
              trailing: CommonSwitch(
                value: appSettingProvider.hasModule('focus'),
                func: (value) {
                  appSettingProviderUpdate.updateModule('focus', !value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
