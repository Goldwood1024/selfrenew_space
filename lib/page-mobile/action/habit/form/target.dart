import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/common/common_enum.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Target extends StatefulWidget {
  const Target({super.key});

  @override
  State<StatefulWidget> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  late TargetEnum targetEnum;

  late bool expand;

  @override
  void initState() {
    super.initState();
    targetEnum = TargetEnum.day;
    expand = targetEnum == TargetEnum.count;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '目标',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SPHelper.getDefaultHeightBox(),
          Padding(
            padding: SPHelper.pagePaddingHorizontal,
            child: Column(
              children: [
                SimpleTile(
                  topRadius: true,
                  title: '当天完成打卡',
                  showArrow: false,
                  trailing: RoundCheckBox(
                    canCancel: true,
                    isChecked: targetEnum == TargetEnum.day,
                    uncheckedColor: CupertinoColors.systemFill,
                    borderColor: Colors.transparent,
                    size: 26,
                    checkedColor: Theme.of(context).primaryColor,
                    onTap: (selected) {
                      setState(() {
                        targetEnum = TargetEnum.day;
                        expand = false;
                      });
                    },
                  ),
                ),
                SimpleTile(
                  bottomRadius: !expand,
                  title: '完成一定量',
                  showArrow: false,
                  trailing: RoundCheckBox(
                    isChecked: targetEnum == TargetEnum.count,
                    uncheckedColor: CupertinoColors.systemFill,
                    borderColor: Colors.transparent,
                    size: 26,
                    checkedColor: Theme.of(context).primaryColor,
                    onTap: (selected) {
                      setState(() {
                        targetEnum = TargetEnum.count;
                        expand = true;
                      });
                    },
                  ),
                ),
                expand
                    ? Column(
                        children: [
                          SimpleTile(
                              title: '每天',
                              showArrow: false,
                              trailing: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: TextFormField(),
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16,
                                      ),
                                      value: 1,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 0,
                                          child: Text(
                                            '次',
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 1,
                                          child: Text(
                                            '杯',
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 2,
                                          child: Text(
                                            '分钟',
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 3,
                                          child: Text(
                                            '小时',
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 4,
                                          child: Text(
                                            '公里',
                                          ),
                                        ),
                                      ],
                                      onChanged: (_) {},
                                      elevation: 0,
                                    ),
                                  )
                                ],
                              )),
                          // const SimpleTile(
                          //   title: '打卡时',
                          //   showArrow: false,
                          // ),
                          SimpleTile(
                            bottomRadius: true,
                            title: '每次记录',
                            showArrow: false,
                            trailing: SizedBox(
                              width: 100,
                              child: TextFormField(),
                            ),
                          ),
                        ],
                      )
                    : SPHelper.empty,
              ],
            ),
          )
        ],
      ),
    );
  }
}
