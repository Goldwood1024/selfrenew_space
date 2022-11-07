import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfrenew_space/page-mobile/background/scaffold_gradient_background.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class SoundSelect extends StatefulWidget {
  const SoundSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SoundSelectState();
}

class _SoundSelectState extends State<SoundSelect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '提醒',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            children: [
              Column(
                children: List.generate(
                  20,
                  (index) => SimpleTile(
                    title: '1',
                    showArrow: false,
                    trailing: RoundCheckBox(
                      isChecked: true,
                      uncheckedColor: CupertinoColors.white,
                      borderColor: Colors.transparent,
                      size: 26,
                      checkedColor: Theme.of(context).primaryColor,
                      onTap: (selected) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
