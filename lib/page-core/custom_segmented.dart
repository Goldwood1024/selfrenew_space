import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSegmentBottom extends StatefulWidget
    implements PreferredSizeWidget {
  final Map<int, Widget> children;
  final int initialValue;
  final double height;
  final ValueChanged<int> onValueChanged;

  const CustomSegmentBottom({
    super.key,
    required this.children,
    required this.initialValue,
    required this.onValueChanged,
    this.height = 16,
  });

  @override
  State<StatefulWidget> createState() => _CustomSegmentBottomState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomSegmentBottomState<T> extends State<CustomSegmentBottom> {
  @override
  Widget build(BuildContext context) {
    return CustomSegment(
      initialValue: widget.initialValue,
      onValueChanged: widget.onValueChanged,
      children: widget.children,
    );
  }
}

class CustomSegment extends StatefulWidget {
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
}

class _CustomSegmentState<T> extends State<CustomSegment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: CustomSlidingSegmentedControl<int>(
        initialValue: widget.initialValue,
        children: widget.children,
        padding: 30,
        height: 30,
        fixedWidth: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        splashColor: Colors.transparent,
        thumbDecoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        duration: const Duration(milliseconds: 200),
        onValueChanged: (v) {
          widget.onValueChanged(v);
        },
      ),
    );
  }
}
