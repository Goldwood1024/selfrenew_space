import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitForm extends StatefulWidget {
  final Map<String, dynamic> params;

  const HabitForm({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final HabitRepository habitRepository = HabitRepository();

  late bool isEdit;

  @override
  void initState() {
    super.initState();

    isEdit = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HabitFormProvider habitFormProvider = Provider.of(context, listen: false);
      if (widget.params.isNotEmpty) {
        if (ObjectUtil.isNotEmpty(widget.params['key'])) {
          habitFormProvider.newHabit(widget.params['key']);
        } else if (ObjectUtil.isNotEmpty(widget.params['id'])) {
          habitFormProvider.query(widget.params['id']);
        }
      } else {
        habitFormProvider.newHabit('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);
    HabitFormProvider update = Provider.of(context, listen: false);

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
          ActionBtn(
            onPressed: () async {
              if (isEdit) {
                Map<String, Object?> values = {
                  "title": habitFormProvider.titleController.text,
                  "icons": {
                    "icons": habitFormProvider.getIconModel().icons,
                    "color": habitFormProvider.getIconModel().color,
                  },
                  "repeat": "1",
                  "target": '1',
                  "remind": '1',
                  "startDate": '1',
                  "hearten": habitFormProvider.heartenController.text,
                  "gmtDate": DateUtil.getNowDateMs(),
                };

                await habitRepository.insertHabit(values);
              } else {
                Map<String, Object?> values = {
                  "title": habitFormProvider.titleController.text,
                  "icons": "assets/icons/绘画.svg",
                  "repeat": "",
                  "target": DateUtil.getNowDateMs(),
                  "remind": DateUtil.getNowDateMs(),
                  "hearten": habitFormProvider.heartenController.text,
                  "gmtDate": DateUtil.getNowDateMs(),
                };
                await habitRepository.insertHabit(values);
              }

              Routers.go(Routers.habit);
            },
            title: '保存',
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
                        style: TextStyle(
                          fontSize: SPHelper.sp(
                            SPHelper.fontSp17,
                          ),
                          color: Theme.of(context).textTheme.labelSmall!.color,
                        ),
                        maxLength: 12,
                        controller: habitFormProvider.titleController,
                        cursorColor: Theme.of(context).primaryColor,
                        cursorWidth: 3,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          filled: true,
                          counterText: '',
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: SPHelper.width(56),
                          height: SPHelper.height(56),
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 7),
                          decoration: BoxDecoration(
                            color: HexColor(
                              habitFormProvider.getIconModel().color,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: SvgLoader(
                            path: habitFormProvider.getIconModel().icons,
                            size: SPHelper.sp(SPHelper.fontSp26),
                          ),
                        ),
                      ),
                    )
                  ],
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
                // trailing: Text(
                //   '每天',
                //   style: TextStyleMode.trailingTextStyle(context),
                // ),
              ),
              SimpleTile(
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Target(),
                  );
                },
                title: '目标',
                // trailing: Text(
                //   '每天',
                //   style: TextStyleMode.trailingTextStyle(context),
                // ),
              ),
              SimpleTile(
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Remind(),
                  );
                },
                title: '提醒',
                // trailing: Text(
                //   '每天',
                //   style: TextStyleMode.trailingTextStyle(context),
                // ),
              ),
              SimpleTile(
                bottomRadius: true,
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const StartDate(),
                  );
                },
                title: '开始日期',
                trailing: Text(
                  DatetimeUtil.getDateYMD(habitFormProvider.getStartDateTime()),
                  style: TextStyleMode.trailingTextStyle(context),
                ),
              ),
              SPHelper.getDefaultHeightBox(),
              FormCard(
                title: '鼓励语',
                titleTrailing: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    update.updateHearten();
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                    child: Icon(
                      Icons.refresh,
                      size: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                fontWeight: FontWeight.normal,
                child: Column(
                  children: [
                    AutoSizeTextField(
                      maxLength: 80,
                      minLines: 2,
                      maxLines: 5,
                      controller: habitFormProvider.heartenController,
                      style: TextStyle(
                        fontSize: SPHelper.sp(
                          SPHelper.fontSp17,
                        ),
                        color: Theme.of(context).textTheme.labelSmall!.color,
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      cursorWidth: 3,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        filled: true,
                        counterText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            SPHelper.minRadius(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
