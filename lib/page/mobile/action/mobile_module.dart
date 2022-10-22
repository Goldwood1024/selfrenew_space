import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileModule extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const MobileModule({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _MobileModuleState();
}

class _MobileModuleState extends State<MobileModule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '习惯',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GoBtn(
                  title: '更多',
                  onPressed: widget.onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: const BoxDecoration(
                // color: Colors.white,
                ),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
