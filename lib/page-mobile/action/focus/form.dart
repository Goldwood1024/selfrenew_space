import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/habit/icons.dart';

class FocusForm extends StatefulWidget {
  final Map<String, String> params;

  const FocusForm({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '番茄钟',
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
            onPressed: () {
              Routers.go(Routers.habit);
            },
            title: '保存',
          )
        ],
      ),
      body: Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AutoSizeTextField(
                                style: const TextStyle(fontSize: 17),
                                maxLength: 12,
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                BottomDialog.showModalBottomSheet(
                                  context,
                                  const HabitIcons(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 58,
                                      height: 64,
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                      decoration: BoxDecoration(
                                        color: CupertinoColors
                                            .quaternarySystemFill,
                                        borderRadius: BorderRadius.circular(
                                          SPHelper.smallRadius() / 2,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      '图标库',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SPHelper.getDefaultHeightBox(),
                      SimpleTile(
                        topRadius: true,
                        title: '重复',
                      ),
                      SimpleTile(
                        title: '提醒',
                      ),
                      SimpleTile(
                        title: '目标时长',
                      ),
                      SimpleTile(
                        title: '番茄时长',
                        bottomRadius: true,
                      ),
                      SPHelper.getDefaultHeightBox(),
                      SimpleTile(
                        topRadius: true,
                        title: '短休息时长',
                      ),
                      SimpleTile(
                        title: '长休息时长',
                      ),
                      SimpleTile(
                        title: '长休息间隔',
                      ),
                      SimpleTile(
                        title: '自动休息',
                      ),
                      SimpleTile(
                        title: '休息结束音效',
                      ),
                      SimpleTile(
                        title: '完成提示音效',
                        bottomRadius: true,
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
