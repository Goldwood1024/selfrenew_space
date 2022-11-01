import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/page-desktop/habit/home.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome>
    with SingleTickerProviderStateMixin {
  late int menuIndex;

  @override
  void initState() {
    super.initState();
    menuIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: () {
          return const DragToMoveArea(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
            ),
          );
        }(),
        automaticallyImplyLeading: false,
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // WindowButtons(),
          ],
        ),
      ),
      pane: NavigationPane(
        displayMode: PaneDisplayMode.open,
        onChanged: (i) {
          setState(() => menuIndex = i);
        },
        selected: menuIndex,
        size: const NavigationPaneSize(
          openMaxWidth: 240,
        ),
        items: [
          PaneItem(
            icon: const Icon(Icons.water_drop),
            title: const Text('习惯'),
            body: const DesktopHabitHome(),
          ),
          PaneItem(
            icon: const Icon(Icons.water_drop),
            title: const Text('专注'),
            body: const DesktopHabitHome(),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(CupertinoIcons.shield),
            title: const Text('设置'),
            body: Container(),
          ),
        ],
      ),
    );
  }
}
