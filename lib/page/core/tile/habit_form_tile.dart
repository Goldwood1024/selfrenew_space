import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:uuid/uuid.dart';

class HabitFormTile extends StatefulWidget {
  const HabitFormTile({super.key});

  @override
  State<StatefulWidget> createState() => _HabitFormTileState();
}

class _HabitFormTileState extends State<HabitFormTile>
    with SingleTickerProviderStateMixin {
  late bool selected;

  @override
  void initState() {
    super.initState();
    selected = false;
  }

  @override
  void dispose() {
    selected = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(const Uuid().v4()),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.transparent,
            foregroundColor: CupertinoColors.black,
            label: '视图',
            icon: Icons.edit_note_sharp,
            onPressed: (BuildContext context) {
              // CustomDialog.showFocusStatistics(context);
            },
          ),
          SlidableAction(
            backgroundColor: Colors.transparent,
            foregroundColor: CupertinoColors.black,
            label: '删除',
            icon: CupertinoIcons.delete_simple,
            onPressed: (BuildContext context) {},
          ),
        ],
      ),
      child: Container(
        height: SPHelper.height(SPHelper.gapDp64),
        margin: EdgeInsets.fromLTRB(
          0,
          SPHelper.listVerticalPadding() / 2,
          0,
          SPHelper.listVerticalPadding() / 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            SPHelper.smallRadius(),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // CustomDialog.showHabitForm(context);
              },
              child: Container(
                width: SPHelper.width(SPHelper.gapDp32),
                height: SPHelper.height(SPHelper.gapDp32),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(
                  SPHelper.height(SPHelper.gapDp20),
                  0,
                  SPHelper.width(SPHelper.gapDp20),
                  0,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CupertinoColors.systemYellow,
                      ),
                      width: 28,
                      height: 28,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: 8,
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // CustomDialog.showFocusForm(context);
                SmartDialog.show(
                  alignment: Alignment.bottomCenter,
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(
                        SPHelper.pageHorizontalPadding(),
                        0,
                        SPHelper.pageHorizontalPadding(),
                        SPHelper.pageHorizontalPadding(),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          SPHelper.bigRadius(),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      // child: BottomDialog(
                      //   title: '选择身高',
                      //   height: 200,
                      //   child: Container(),
                      // ),
                    );
                  },
                );
              },
              child: SizedBox(
                height: SPHelper.height(SPHelper.gapDp64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '南京南',
                        style: TextStyle(
                          fontSize: SPHelper.sp(SPHelper.fontSp16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        0,
                        SPHelper.height(SPHelper.gapDp4),
                        0,
                        0,
                      ),
                      child: const Text(
                        '再晚也要吃早餐哦~',
                        style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(child: SPHelper.empty),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
