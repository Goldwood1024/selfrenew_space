import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class Habit extends StatefulWidget {
  const Habit({super.key});

  @override
  State<StatefulWidget> createState() => _HabitState();
}

class _HabitState extends State<Habit> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '习惯',
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              topRadius: true,
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
            HabitTile(
              title: '八段锦',
              subTitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '每天',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        size: 16,
                        color: CupertinoColors.systemGrey2,
                      ),
                      SPHelper.getWidthBox(8),
                      const Text(
                        '08:00',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              bottomRadius: true,
              leading: const Icon(
                Icons.access_time_filled,
                size: 28,
              ),
              trailing: Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  ),
                  Icon(
                    Icons.check_circle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
