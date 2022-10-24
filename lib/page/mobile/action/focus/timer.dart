import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer>
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
        toolbarHeight: SPHelper.appBarHeight(),
        centerTitle: true,
        title: const Icon(
          CupertinoIcons.loop,
          size: 20,
        ),
        leading: IconButton(
          onPressed: () {
            SmartDialog.dismiss();
          },
          icon: const Icon(
            CupertinoIcons.multiply_circle,
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            Align(
              child: Text(
                '同意方法',
                style: TextStyle(
                  fontSize: SPHelper.sp(SPHelper.fontSp18),
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.displayLarge?.color,
                ),
              ),
            ),
            SleekCircularSlider(
              min: 0,
              max: 1000,
              initialValue: 426,
              onChange: (double value) {},
              onChangeStart: (double startValue) {},
              onChangeEnd: (double endValue) {},
            )
          ],
        ),
      ),
    );
  }
}
