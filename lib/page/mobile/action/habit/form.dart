import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/focus/focus_form_card.dart';
import 'package:selfrenew_space/page/mobile/action/focus/focus_form_tile.dart';

class HabitForm extends StatefulWidget {
  const HabitForm({super.key});

  @override
  State<StatefulWidget> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        title: const AppBarText(
          title: '添加习惯',
        ),
        leading: BackBtn(
          title: '习惯库',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: 98,
        actions: [
          TextButton(
            onPressed: () {
              Routers.go(Routers.habit);
            },
            child: const Text(
              '保存',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
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
            padding: SPHelper.pagePadding,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      FocusFormCard(
                        title: '名称',
                        fontWeight: FontWeight.w500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AutoSizeTextField(
                                maxLength: 10,
                                controller: TextEditingController(),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Routers.go(Routers.habitIcons);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 56,
                                      height: 56,
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                      decoration: BoxDecoration(
                                        color: CupertinoColors
                                            .systemGroupedBackground,
                                        borderRadius: BorderRadius.circular(
                                          SPHelper.smallRadius(),
                                        ),
                                      ),
                                      // child: SvgPicture.asset(
                                      //   'assets/icons/chunvzuo.svg',
                                      // ),
                                    ),
                                    const Text(
                                      '图标库',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SPHelper.getHeightBox(
                        SPHelper.pageVerticalPadding(),
                      ),
                      FocusFormTile(
                        onTap: () {},
                        title: '重复',
                        tail: '每天',
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SPHelper.smallRadius()),
                          topRight: Radius.circular(SPHelper.smallRadius()),
                        ),
                      ),
                      FocusFormTile(
                        onTap: () {},
                        title: '目标',
                        tail: '每天',
                        borderRadius: BorderRadius.zero,
                      ),
                      FocusFormTile(
                        onTap: () {},
                        title: '场景',
                        tail: '每天',
                        borderRadius: BorderRadius.zero,
                      ),
                      // FocusFormTile(
                      //   onTap: () {
                      //     SmartDialog.show(
                      //       alignment: Alignment.bottomCenter,
                      //       builder: (_) {
                      //         return BottomDialog(
                      //           title: '选择提示音',
                      //           height: 500,
                      //           child: Container(),
                      //         );
                      //       },
                      //     );
                      //   },
                      //   title: '提醒',
                      //   tail: '叮',
                      //   borderRadius: BorderRadius.only(
                      //     bottomLeft:
                      //         Radius.circular(SPHelper.smallRadius()),
                      //     bottomRight:
                      //         Radius.circular(SPHelper.smallRadius()),
                      //   ),
                      // ),
                      SPHelper.getHeightBox(
                        SPHelper.pageVerticalPadding(),
                      ),
                      FocusFormCard(
                        title: '鼓励语',
                        fontWeight: FontWeight.w500,
                        child: Column(
                          children: [
                            AutoSizeTextField(
                              maxLength: 80,
                              minLines: 2,
                              maxLines: 5,
                              controller: TextEditingController(),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
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
