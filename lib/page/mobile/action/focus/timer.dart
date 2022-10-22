import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> with SingleTickerProviderStateMixin {
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
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '专注',
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
