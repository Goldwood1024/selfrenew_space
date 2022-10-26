import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/habit/form_bottom.dart';

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
                      child: TextFormField(
                        style: const TextStyle(fontSize: 17),
                        maxLength: 12,
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Routers.go(Routers.habitIcons);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGroupedBackground,
                                borderRadius: BorderRadius.circular(
                                  SPHelper.smallRadius() / 2,
                                ),
                              ),
                            ),
                            const Text(
                              '图标库',
                              style: TextStyle(
                                fontSize: 14,
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
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Repeat(),
                  );
                },
                title: '重复',
                trailing: const Text(
                  '每天',
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
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
                trailing: const Text(
                  '每天',
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
              SimpleTile(
                bottomRadius: true,
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const Remind(),
                  );
                },
                title: '提醒',
                trailing: const Text(
                  '每天',
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
              SPHelper.getDefaultHeightBox(),
              FocusFormCard(
                title: '鼓励语',
                fontWeight: FontWeight.normal,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 80,
                      minLines: 2,
                      maxLines: 5,
                      controller: TextEditingController(),
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
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
