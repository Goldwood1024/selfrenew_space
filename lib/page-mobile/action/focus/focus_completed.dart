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
      body: SafeArea(
        top: true,
        child: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SPHelper.empty),
              Align(
                child: SvgLoader(
                  size: MediaQuery.of(context).size.width * 0.6,
                  path: 'assets/icons/兴奋庆祝.svg',
                ),
              ),
              Align(
                child: Text(
                  '恭喜完成👍🏻',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelSmall!.color,
                    fontSize: SPHelper.sp(18),
                  ),
                ),
              ),
              const Expanded(child: SPHelper.empty),
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
      ),
    );
  }
}
