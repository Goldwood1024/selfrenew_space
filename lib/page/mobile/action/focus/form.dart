import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm>
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
