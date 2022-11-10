import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSegment extends StatefulWidget implements PreferredSizeWidget {
  final Map<int, Widget> children;
  final int initialValue;
  final ValueChanged<int> onValueChanged;

  const CustomSegment({
    super.key,
    required this.children,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  State<StatefulWidget> createState() => _CustomSegmentState();

  @override
  Size get preferredSize => const Size.fromHeight(44);
}

class _CustomSegmentState<T> extends State<CustomSegment> {
  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      initialValue: widget.initialValue,
      children: widget.children,
      padding: 28,
      height: 28,
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(8),
      ),
      splashColor: Colors.transparent,
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(milliseconds: 150),
      onValueChanged: (v) {
        widget.onValueChanged(v);
      },
    );
  }
}
