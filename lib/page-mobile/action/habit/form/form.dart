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
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.params.isNotEmpty) {
      if (ObjectUtil.isNotEmpty(widget.params['key'])) {
        textEditingController.text = widget.params['title'];
      } else if (ObjectUtil.isNotEmpty(widget.params['id'])) {
        textEditingController.text = '22';
      }
    }
  }

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
          ActionBtn(
            onPressed: () async {
              Map<String, Object?> values = {
                "title": textEditingController.text,
                "icon": "assets/icons/delete.svg",
                "color": "#000000",
                "startDate": "title",
                "hearten": "title",
                "max": 2,
                "gmtDate": DateUtil.getNowDateMs(),
              };
              await habitRepository.insertHabit(values);

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
                        controller: textEditingController,
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
                          width: SPHelper.width(60),
                          height: SPHelper.height(60),
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 7),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(
                              SPHelper.minRadius(),
                            ),
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
                trailing: Text(
                  '每天',
                  style: TextStyleMode.trailingTextStyle(context),
                ),
              ),
              SimpleTile(
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Target(),
                  );
                },
                title: '目标',
                trailing: Text(
                  '每天',
                  style: TextStyleMode.trailingTextStyle(context),
                ),
              ),
              SimpleTile(
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Remind(),
                  );
                },
                title: '提醒',
                trailing: Text(
                  '每天',
                  style: TextStyleMode.trailingTextStyle(context),
                ),
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
                  '1月21',
                  style: TextStyleMode.trailingTextStyle(context),
                ),
              ),
              SPHelper.getDefaultHeightBox(),
              FormCard(
                title: '鼓励语',
                titleTrailing: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
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
                      controller: TextEditingController(),
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
