import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/common/common_enum.dart';
import 'package:selfrenew_space/dao/focus/repository.dart';
import 'package:selfrenew_space/page-core/tile/simple_tile_slider.dart';
import 'package:selfrenew_space/page-mobile/action/habit/form/repeat.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

import 'notification.dart';

class FocusForm extends StatefulWidget {
  final Map<String, dynamic> params;

  const FocusForm({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> with TickerProviderStateMixin {
  late String appBarTitle;
  late String type;
  final FocusRepository focusRepository = FocusRepository();

  @override
  void initState() {
    super.initState();

    type = widget.params['type'];
    if (type == FocusType.tomato.name) {
      appBarTitle = '番茄钟';
    } else if (type == FocusType.uptime.name) {
      appBarTitle = '正计时';
    } else if (type == FocusType.downtime.name) {
      appBarTitle = '倒计时';
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusFormProvider focusFormProvider = Provider.of(context, listen: false);

      focusFormProvider.query();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusFormProvider focusFormProvider = Provider.of(context);
    FocusFormProvider update = Provider.of(context, listen: false);

    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: AppBarText(
          title: appBarTitle,
        ),
        leading: BackBtn(
          title: '专注',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: 80,
        actions: [
          ActionBtn(
            onPressed: () async {
              Map<String, Object?> values = {
                'title': focusFormProvider.getTargetTime(),
                'icons': focusFormProvider.getTargetTime(),
                'repeat': focusFormProvider.getTargetTime(),
                'remind': focusFormProvider.getTargetTime(),
                'targetTime': focusFormProvider.getTargetTime(),
                'shortRelaxTime': focusFormProvider.getShortRelaxTime(),
                'longRelaxTime': focusFormProvider.getLongRelaxTime(),
                'longRelaxInterval': focusFormProvider.getLongRelaxInterval(),
                'autoRelax': focusFormProvider.getAutoRelax(),
                'gmtDate': DateTime.now().millisecondsSinceEpoch,
              };

              await focusRepository.insert(values);

              Routers.push(Routers.focusHome);
            },
            title: '保存',
          )
        ],
      ),
      body: ScaffoldGradientBackground(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: SPHelper.pagePaddingHorizontal,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SPHelper.getDefaultHeightBox(),
                      FormCard(
                        title: '名称',
                        titleTrailing: SPHelper.empty,
                        fontWeight: FontWeight.normal,
                        child: AutoSizeTextField(
                          style: TextStyle(
                            fontSize: SPHelper.sp(
                              SPHelper.fontSp17,
                            ),
                            color:
                                Theme.of(context).textTheme.labelSmall!.color,
                          ),
                          maxLength: 12,
                          controller: TextEditingController(),
                          cursorColor: Theme.of(context).primaryColor,
                          cursorWidth: 3,
                          decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            filled: true,
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SPHelper.getDefaultHeightBox(),
                      SimpleTile(
                        onPressed: () {
                          BottomDialog.showModalBottomSheet(
                            context,
                            const Repeat(),
                          );
                        },
                        topRadius: true,
                        title: '重复',
                        trailing: Text(
                          '每天',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SimpleTile(
                        onPressed: () {
                          BottomDialog.showModalBottomSheet(
                            context,
                            const NotificationPage(),
                          );
                        },
                        title: '提醒',
                        trailing: Text(
                          '完成',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SimpleTile(
                        hide: type == FocusType.tomato.name,
                        title: '目标时长',
                        bottomRadius: type != FocusType.tomato.name,
                      ),
                      SimpleTileSlider(
                        hide: type != FocusType.tomato.name,
                        title: '番茄时长',
                        bottomRadius: true,
                        max: 90,
                        min: 5,
                        initValue: focusFormProvider.getTargetTime(),
                        onValueChanged: (_) {
                          update.updateTargetTime(_ * 60);
                        },
                        trailing: Text(
                          '${focusFormProvider.getTargetTime()} 分钟',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SPHelper.getDefaultHeightBox(),
                      SimpleTile(
                        hide: type != FocusType.tomato.name,
                        title: '自动休息',
                        topRadius: true,
                        showArrow: false,
                        trailing: CommonSwitch(
                          value: focusFormProvider.getAutoRelax(),
                          func: (_) {
                            update.updateAutoRelax(_);
                          },
                        ),
                      ),
                      SimpleTileSlider(
                        hide: type != FocusType.tomato.name,
                        title: '短休息时长',
                        max: 10,
                        min: 1,
                        initValue: focusFormProvider.getShortRelaxTime(),
                        onValueChanged: (_) {
                          update.updateShortRelaxTime(_ * 60);
                        },
                        trailing: Text(
                          '${focusFormProvider.getShortRelaxTime()} 分钟',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SimpleTileSlider(
                        hide: type != FocusType.tomato.name,
                        title: '长休息时长',
                        max: 50,
                        min: 1,
                        initValue: focusFormProvider.getLongRelaxTime(),
                        onValueChanged: (_) {
                          update.updateLongRelaxTime(_ * 60);
                        },
                        trailing: Text(
                          '${focusFormProvider.getLongRelaxTime()} 分钟',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SimpleTileSlider(
                        hide: type != FocusType.tomato.name,
                        title: '长休息间隔',
                        bottomRadius: true,
                        max: 10,
                        min: 1,
                        initValue: focusFormProvider.getLongRelaxInterval(),
                        onValueChanged: (_) {
                          update.updateLongRelaxInterval(_);
                        },
                        trailing: Text(
                          '${focusFormProvider.getLongRelaxInterval()} 番茄',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
