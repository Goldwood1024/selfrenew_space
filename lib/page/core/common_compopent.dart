import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class CommonSwitch extends StatefulWidget {
  final bool value;
  final Function(bool) func;

  const CommonSwitch({
    super.key,
    this.value = false,
    required this.func,
  });

  @override
  State<StatefulWidget> createState() => _CommonSwitchState();
}

class _CommonSwitchState extends State<CommonSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: _value,
      width: 52,
      height: 28,
      toggleSize: 25,
      padding: 2,
      activeColor: Theme.of(context).primaryColor,
      onToggle: (bool value) {
        setState(() {
          _value = value;
          widget.func(_value);
        });
      },
    );
  }
}
