import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        title: const AppBarText(
          title: '添加',
        ),
        leading: const BackBtn(
          title: '专注',
        ),
        leadingWidth: 80,
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
