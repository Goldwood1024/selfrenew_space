import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/form/focus_form_card.dart';
import 'package:selfrenew_space/page/mobile/action/form/focus_form_tile.dart';

class HabitForm extends StatefulWidget {
  const HabitForm({super.key});

  @override
  State<StatefulWidget> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) => MaterialWithModalsPageRoute(
        builder: (_) => Builder(
          builder: (_) => Scaffold(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            appBar: AppBar(
                backgroundColor: CupertinoColors.white,
                title: Text(
                  '333',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge?.color,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ]),
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
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 56,
                                            height: 56,
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 4),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors
                                                  .systemGroupedBackground,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    SPHelper.smallRadius(),
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/chunvzuo.svg',
                                            ),
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
                                topLeft:
                                    Radius.circular(SPHelper.smallRadius()),
                                topRight:
                                    Radius.circular(SPHelper.smallRadius()),
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 32),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    0,
                                    20,
                                    0,
                                  ),
                                  width: 80,
                                  height: SPHelper.height(52),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      SPHelper.smallRadius(),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.arrow_back,
                                        size: 28,
                                        color: CupertinoColors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    0,
                                    20,
                                    0,
                                  ),
                                  width: 180,
                                  height: SPHelper.height(52),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      SPHelper.smallRadius(),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '保存',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CupertinoColors.white,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_forward_outlined,
                                      //   size: 28,
                                      //   color: CupertinoColors.white,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
