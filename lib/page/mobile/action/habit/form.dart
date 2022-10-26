import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class HabitForm extends StatefulWidget {
  final Map<String, String> params;

  const HabitForm({
    super.key,
    required this.params,
  });

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
          ActionBtn(
            onPressed: () {
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
              FocusFormCard(
                title: '名称',
                fontWeight: FontWeight.normal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AutoSizeTextField(
                        maxLength: 10,
                        controller: TextEditingController(),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
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
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGroupedBackground,
                                borderRadius: BorderRadius.circular(
                                  SPHelper.smallRadius(),
                                ),
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
              SPHelper.getDefaultHeightBox(),
              SimpleTile(
                onPressed: () {},
                title: '重复',
              ),
              SimpleTile(
                onPressed: () {},
                title: '目标',
              ),
              SimpleTile(
                onPressed: () {},
                title: '时间',
              ),
              SimpleTile(
                onPressed: () {},
                title: '提醒',
              ),
              SPHelper.getDefaultHeightBox(),
              FocusFormCard(
                title: '鼓励语',
                fontWeight: FontWeight.normal,
                child: Column(
                  children: [
                    AutoSizeTextField(
                      maxLength: 80,
                      minLines: 2,
                      maxLines: 5,
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(2),
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
