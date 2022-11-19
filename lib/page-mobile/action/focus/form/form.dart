import 'dart:convert';

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
  final FocusRepository focusRepository = FocusRepository();

  late bool edit;

  @override
  void initState() {
    super.initState();

    late String type = widget.params['type'];
    if (type == FocusType.tomato.name) {
      appBarTitle = '番茄钟';
    } else if (type == FocusType.uptime.name) {
      appBarTitle = '正计时';
    } else if (type == FocusType.downtime.name) {
      appBarTitle = '倒计时';
    }

    edit = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusFormProvider focusFormProvider = Provider.of(context, listen: false);
      focusFormProvider.updateType(type);
      if (ObjectUtil.isNotEmpty(widget.params['id'])) {
        edit = true;
        focusFormProvider.queryById(widget.params['id']);
      } else {
        focusFormProvider.newFocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<int> getSeconds(List<DateTime> list) {
    List<int> data = [];
    for (DateTime time in list) {
      data.add(time.millisecondsSinceEpoch);
    }
    return data;
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
              if (edit) {
                Map<String, Object?> values = {
                  'title': focusFormProvider.titleEditingController.text,
                  'icons': jsonEncode({
                    'icon': focusFormProvider.getIconModel().icon,
                    'color': focusFormProvider.getIconModel().color,
                  }),
                  "repeat": jsonEncode({
                    "type": focusFormProvider.getRepeatType(),
                    "repeatDays": focusFormProvider.getRepeatDays(),
                    "selectedDates": getSeconds(
                      focusFormProvider.getSelectedDates(),
                    ),
                  }),
                  "remind": jsonEncode({
                    'completedMusic':
                        focusFormProvider.getFocusRemindModel().completedMusic,
                    'relaxdMusic':
                        focusFormProvider.getFocusRemindModel().relaxdMusic,
                    'feedback':
                        focusFormProvider.getFocusRemindModel().feedback,
                  }),
                  'targetTime': focusFormProvider.getTargetTime() * 60,
                  'shortRelaxTime': focusFormProvider.getShortRelaxTime() * 60,
                  'longRelaxTime': focusFormProvider.getLongRelaxTime() * 60,
                  'longRelaxInterval': focusFormProvider.getLongRelaxInterval(),
                  'autoRelax': focusFormProvider.getAutoRelax() ? 1 : 0,
                };

                await focusRepository.updateById(values, widget.params['id']);
              } else {
                Map<String, Object?> values = {
                  'title': focusFormProvider.titleEditingController.text,
                  'icons': jsonEncode({
                    'icon': focusFormProvider.getIconModel().icon,
                    'color': focusFormProvider.getIconModel().color,
                  }),
                  "repeat": jsonEncode({
                    "type": focusFormProvider.getRepeatType(),
                    "repeatDays": focusFormProvider.getRepeatDays(),
                    "selectedDates": getSeconds(
                      focusFormProvider.getSelectedDates(),
                    ),
                  }),
                  "remind": jsonEncode({
                    'completedMusic':
                        focusFormProvider.getFocusRemindModel().completedMusic,
                    'relaxdMusic':
                        focusFormProvider.getFocusRemindModel().relaxdMusic,
                    'feedback':
                        focusFormProvider.getFocusRemindModel().feedback,
                  }),
                  'type': focusFormProvider.type,
                  'targetTime': focusFormProvider.getTargetTime() * 60,
                  'shortRelaxTime': focusFormProvider.getShortRelaxTime() * 60,
                  'longRelaxTime': focusFormProvider.getLongRelaxTime() * 60,
                  'longRelaxInterval': focusFormProvider.getLongRelaxInterval(),
                  'autoRelax': focusFormProvider.getAutoRelax() ? 1 : 0,
                  'gmtDate': DateTime.now().millisecondsSinceEpoch,
                };

                await focusRepository.insert(values);
              }

              Routers.goParams(Routers.focusHome, {});
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
                          controller: focusFormProvider.titleEditingController,
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
                      SimpleTileHasTime(
                        title: '目标时长',
                        bottomRadius:
                            focusFormProvider.type != FocusType.tomato.name,
                        duration: Duration(
                          milliseconds:
                              focusFormProvider.getTargetTime() * 60 * 1000,
                        ),
                        onValueChanged: (_) {
                          update.updateTargetTime(_.inSeconds);
                        },
                        trailing: Text(
                          '${focusFormProvider.getTargetTime()} 分钟',
                          style: TextStyleMode.trailingTextStyle(context),
                        ),
                      ),
                      SimpleTileSlider(
                        hide: focusFormProvider.type != FocusType.tomato.name,
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
                        hide: focusFormProvider.type != FocusType.tomato.name,
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
                        hide: focusFormProvider.type != FocusType.tomato.name,
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
                        hide: focusFormProvider.type != FocusType.tomato.name,
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
                        hide: focusFormProvider.type != FocusType.tomato.name,
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
