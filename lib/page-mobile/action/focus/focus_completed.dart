import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusCompleted extends StatefulWidget {
  const FocusCompleted({super.key});

  @override
  State<StatefulWidget> createState() => _FocusCompletedState();
}

class _FocusCompletedState extends State<FocusCompleted> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const SvgLoader(
                  size: 200,
                  path: 'assets/icons/兴奋庆祝.svg',
                ),
              ),
            ),
            Text(
              '已完成',
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall!.color,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 56, 0, 100),
              child: ExitRelax(
                onPressed: () {
                  SmartDialog.dismiss();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
