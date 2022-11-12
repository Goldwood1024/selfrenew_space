import 'package:dropdown_button2/dropdown_button2.dart';
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

  final List<String> items = [
    '次',
    '杯',
    '公里',
    '分钟',
    '小时',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    targetEnum = TargetEnum.day;
    expand = targetEnum == TargetEnum.count;
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);
    HabitFormProvider update = Provider.of(context, listen: false);

    TargetModel model = habitFormProvider.getTargetModel();

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
              update.updateTargetModel(model);

              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              SimpleTile(
                topRadius: true,
                title: '当天完成打卡',
                showArrow: false,
                trailing: RoundCheckBox(
                  canCancel: true,
                  isChecked: model.type == TargetEnum.day,
                  uncheckedColor: CupertinoColors.systemFill,
                  borderColor: Colors.transparent,
                  size: 26,
                  checkedColor: Theme.of(context).primaryColor,
                  onTap: (selected) {
                    setState(() {
                      expand = false;

                      model.type = TargetEnum.day;
                      model.min = 0;
                      model.max = 1;
                      model.value = 0;
                    });
                  },
                ),
              ),
              SimpleTile(
                bottomRadius: !expand,
                title: '完成一定量',
                showArrow: false,
                trailing: RoundCheckBox(
                  isChecked: model.type == TargetEnum.count,
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                                child: SizedBox(
                                  width: 80,
                                  height: 42,
                                  child: AutoSizeTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: SPHelper.sp(
                                        SPHelper.fontSp17,
                                      ),
                                      color: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .color,
                                    ),
                                    controller: TextEditingController(),
                                    cursorColor: Theme.of(context).primaryColor,
                                    cursorWidth: 2.4,
                                    decoration: InputDecoration(
                                      fillColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      filled: true,
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  buttonPadding:
                                      const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                  itemSplashColor: Colors.transparent,
                                  itemHighlightColor: Colors.transparent,
                                  dropdownElevation: 1,
                                  hint: Text(
                                    '次',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  items: items
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  buttonHeight: 42,
                                  buttonWidth: 80,
                                  itemHeight: 42,
                                ),
                              )
                            ],
                          ),
                        ),
                        // const SimpleTile(
                        //   title: '打卡时',
                        //   showArrow: false,
                        // ),
                        SimpleTile(
                          bottomRadius: true,
                          title: '每次记录',
                          showArrow: false,
                          showDivider: false,
                          trailing: SizedBox(
                            width: 80,
                            height: 42,
                            child: AutoSizeTextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: SPHelper.sp(
                                  SPHelper.fontSp17,
                                ),
                                color: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .color,
                              ),
                              controller: TextEditingController(),
                              cursorColor: Theme.of(context).primaryColor,
                              cursorWidth: 2.4,
                              decoration: InputDecoration(
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SPHelper.empty,
            ],
          ),
        ),
      ),
    );
  }
}
