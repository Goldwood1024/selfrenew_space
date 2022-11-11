import 'package:flexi_chip/flexi_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class CommonSwitch extends StatefulWidget {
  final bool value;
  final bool canSwitch;
  final Function(bool) func;

  const CommonSwitch({
    super.key,
    this.value = false,
    this.canSwitch = true,
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
        if (widget.canSwitch) {
          setState(() {
            _value = value;
            widget.func(_value);
          });
        }
      },
    );
  }
}

class SvgLoader extends StatelessWidget {
  final String path;
  final double size;

  const SvgLoader({
    super.key,
    required this.path,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
    );
  }
}

class SvgColorLoader extends StatelessWidget {
  final String path;
  final double size;

  const SvgColorLoader({
    super.key,
    required this.path,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      color: Theme.of(context).primaryColor,
    );
  }
}

// class ChipEmpty extends StatefulWidget {
//   final List<TipChip> options;
//   final Function(Object) onPressed;
//
//   const ChipEmpty({
//     super.key,
//     required this.options,
//     required this.onPressed,
//   });
//
//   @override
//   State<StatefulWidget> createState() => _ChipEmptyState();
// }
//
// class _ChipEmptyState extends State<ChipEmpty> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SPHelper.getHeightBox(SPHelper.gapDp20),
//         ChipsChoice.single(
//           padding: EdgeInsets.zero,
//           alignment: WrapAlignment.center,
//           value: [],
//           spacing: SPHelper.width(SPHelper.gapDp14),
//           runSpacing: SPHelper.width(SPHelper.gapDp14),
//           choiceStyle: C2ChipStyle(
//             height: SPHelper.height(SPHelper.gapDp48),
//             backgroundColor: Theme.of(context).backgroundColor,
//             backgroundOpacity: 1,
//             overlayColor: Colors.transparent,
//             shadowColor: Colors.transparent,
//             padding:
//                 EdgeInsets.fromLTRB(SPHelper.width(SPHelper.gapDp14), 0, 0, 0),
//             foregroundSpacing: SPHelper.width(SPHelper.gapDp14),
//             foregroundStyle: TextStyle(
//               fontSize: SPHelper.sp(SPHelper.fontSp18),
//               fontWeight: FontWeight.w500,
//               color: Theme.of(context).textTheme.labelSmall?.color,
//             ),
//           ),
//           placeholder: '无',
//           wrapped: true,
//           onChanged: (_) {
//             widget.onPressed(_);
//           },
//           choiceLeadingBuilder: (item, v) {
//             return SizedBox(
//               width: SPHelper.width(SPHelper.gapDp24),
//               height: SPHelper.height(SPHelper.gapDp24),
//               child: Image(
//                 image: item.avatarImage!,
//               ),
//             );
//           },
//           choiceItems: C2Choice.listFrom<String, TipChip>(
//             source: widget.options,
//             value: (i, v) => v.value,
//             label: (i, v) => v.title,
//             avatarImage: (i, v) => AssetImage(v.image),
//           ),
//         ),
//         SPHelper.getHeightBox(SPHelper.gapDp20),
//       ],
//     );
//   }
// }

class ChipEmptyV2 extends StatefulWidget {
  final List<TipChip> options;
  final Function(Object) onPressed;

  const ChipEmptyV2({
    super.key,
    required this.options,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _ChipEmptyV2State();
}

class _ChipEmptyV2State extends State<ChipEmptyV2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SPHelper.getHeightBox(SPHelper.gapDp20),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(
            widget.options.length,
            (index) => FlexiChip(
              onPressed: () {
                widget.onPressed(widget.options[index].value);
              },
              label: Text(widget.options[index].title),
              leading: SvgLoader(
                path: widget.options[index].image,
              ),
              style: FlexiChipStyle(
                height: SPHelper.height(SPHelper.gapDp48),
                backgroundColor: Theme.of(context).backgroundColor,
                backgroundOpacity: 1,
                overlayColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                    SPHelper.width(SPHelper.gapDp14), 0, 0, 0),
                foregroundSpacing: SPHelper.width(SPHelper.gapDp14),
                foregroundStyle: TextStyle(
                  fontSize: SPHelper.sp(SPHelper.fontSp18),
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
              disabled: false,
              autofocus: false,
            ),
          ),
        ),
      ],
    );
  }
}

class AccentColor extends StatefulWidget {
  final String color;
  final bool selected;
  final Function(String) onChange;

  const AccentColor({
    super.key,
    required this.color,
    required this.selected,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => _AccentColorState();
}

class _AccentColorState extends State<AccentColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange(widget.color);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, SPHelper.width(SPHelper.gapDp12), 0),
        width: SPHelper.width(SPHelper.gapDp32),
        height: SPHelper.height(SPHelper.gapDp32),
        decoration: BoxDecoration(
          color: HexColor(widget.color),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          child: widget.selected
              ? Container(
                  width: SPHelper.width(SPHelper.gapDp24),
                  height: SPHelper.height(SPHelper.gapDp24),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/check.svg',
                    color: Colors.white,
                  ),
                )
              : SPHelper.empty,
        ),
      ),
    );
  }
}

class HabitAccentColor extends StatefulWidget {
  final String color;
  final bool selected;
  final Function(String) onChange;

  const HabitAccentColor({
    super.key,
    required this.color,
    required this.selected,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => _HabitAccentColorState();
}

class _HabitAccentColorState extends State<HabitAccentColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange(widget.color);
      },
      child: Container(
        width: SPHelper.width(SPHelper.gapDp32),
        height: SPHelper.height(SPHelper.gapDp32),
        decoration: BoxDecoration(
          color: HexColor(widget.color),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          child: widget.selected
              ? Container(
                  width: SPHelper.width(SPHelper.gapDp24),
                  height: SPHelper.height(SPHelper.gapDp24),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/check.svg',
                    color: Colors.white,
                  ),
                )
              : SPHelper.empty,
        ),
      ),
    );
  }
}

class HabitAccentImage extends StatefulWidget {
  final String image;
  final String selectedColor;
  final bool selected;
  final Function(String) onChange;

  const HabitAccentImage({
    super.key,
    required this.image,
    required this.selected,
    required this.selectedColor,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => _HabitAccentImageState();
}

class _HabitAccentImageState extends State<HabitAccentImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange(widget.image);
      },
      child: Container(
        width: SPHelper.width(SPHelper.gapDp32),
        height: SPHelper.height(SPHelper.gapDp32),
        decoration: BoxDecoration(
          color: widget.selected
              ? HexColor(widget.selectedColor)
              : CupertinoColors.extraLightBackgroundGray,
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Align(
              child: SvgPicture.asset(
                widget.image,
                width: 32,
                height: 32,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: widget.selected
                  ? Container(
                      width: SPHelper.width(SPHelper.gapDp18),
                      height: SPHelper.height(SPHelper.gapDp18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/check.svg',
                        color: Colors.white,
                      ),
                    )
                  : SPHelper.empty,
            )
          ],
        ),
      ),
    );
  }
}

class ThemeModeCheck extends StatelessWidget {
  final bool selected;

  const ThemeModeCheck({
    super.key,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/check.svg',
              color: Theme.of(context).primaryColor,
              width: SPHelper.width(SPHelper.gapDp28),
              height: SPHelper.height(SPHelper.gapDp28),
            ),
          )
        : SPHelper.empty;
  }
}

class ImageDefaultEmpty extends StatelessWidget {
  final String imagePath;
  final String title;

  const ImageDefaultEmpty({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Align(
            child: SvgPicture.asset(
              imagePath,
              height: 200,
            ),
          ),
          Text(
            title,
            style: TextStyleMode.tipTextStyle(context),
          )
        ],
      ),
    );
  }
}

class RoundCheckBox extends StatefulWidget {
  const RoundCheckBox({
    Key? key,
    this.isChecked,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.size = 26,
    this.animationDuration,
    this.isRound = true,
    this.canCancel = false,
    required this.onTap,
  }) : super(key: key);

  final bool? isChecked;
  final Widget? checkedWidget;
  final Widget? uncheckedWidget;
  final Color? checkedColor;
  final Color? uncheckedColor;
  final Color? disabledColor;
  final Border? border;
  final Color? borderColor;
  final double? size;
  final Function(bool?)? onTap;
  final Duration? animationDuration;
  final bool isRound;
  final bool canCancel;

  @override
  State<StatefulWidget> createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  bool? _isChecked;
  late Duration animationDuration;
  double? size;
  Widget? checkedWidget;
  Widget? uncheckedWidget;
  Color? checkedColor;
  Color? uncheckedColor;
  Color? disabledColor;
  late Color borderColor;

  @override
  void initState() {
    _isChecked = widget.isChecked ?? false;
    animationDuration = widget.animationDuration ??
        const Duration(
          milliseconds: 500,
        );
    size = widget.size ?? 40.0;
    checkedWidget = widget.checkedWidget ??
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/check.svg',
            color: Colors.white,
            width: widget.size! - 2,
            height: widget.size! - 2,
          ),
        );
    checkedColor = widget.checkedColor ?? Colors.green;
    uncheckedColor = widget.uncheckedColor;
    borderColor = widget.borderColor ?? Colors.grey;
    uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    super.initState();
  }

  @override
  void didUpdateWidget(RoundCheckBox oldWidget) {
    uncheckedColor =
        widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    if (_isChecked != widget.isChecked) {
      _isChecked = widget.isChecked ?? false;
    }
    if (animationDuration != widget.animationDuration) {
      animationDuration =
          widget.animationDuration ?? const Duration(milliseconds: 500);
    }
    if (size != widget.size) {
      size = widget.size ?? 40.0;
    }
    if (checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor ?? Colors.green;
    }
    if (borderColor != widget.borderColor) {
      borderColor = widget.borderColor ?? Colors.grey;
    }
    checkedWidget = widget.checkedWidget ??
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/check.svg',
            color: Colors.white,
            width: widget.size! - 2,
            height: widget.size! - 2,
          ),
        );
    if (uncheckedWidget != widget.uncheckedWidget) {
      uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? GestureDetector(
            onTap: () {
              if (widget.canCancel) {
                setState(() => _isChecked = !_isChecked!);
              } else {
                // 取消关闭
                if (_isChecked == false) {
                  setState(() => _isChecked = true);
                }
              }

              widget.onTap!(_isChecked);
            },
            child: ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: animationDuration,
                height: size,
                width: size,
                decoration: BoxDecoration(
                  color: _isChecked! ? checkedColor : uncheckedColor,
                  border: widget.border ??
                      Border.all(
                        color: borderColor,
                      ),
                  borderRadius: borderRadius,
                ),
                child: _isChecked! ? checkedWidget : uncheckedWidget,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: animationDuration,
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: widget.disabledColor ?? Theme.of(context).disabledColor,
                border: widget.border ??
                    Border.all(
                      color: widget.disabledColor ??
                          Theme.of(context).disabledColor,
                    ),
                borderRadius: borderRadius,
              ),
              child: _isChecked! ? checkedWidget : uncheckedWidget,
            ),
          );
  }

  BorderRadius get borderRadius {
    if (widget.isRound) {
      return BorderRadius.circular(size! / 2);
    } else {
      return BorderRadius.zero;
    }
  }
}

class CommonSlider extends StatefulWidget {
  final int max;
  final int min;
  final int initValue;
  final int step;

  final Function(dynamic) onValueChanged;

  const CommonSlider({
    super.key,
    required this.onValueChanged,
    required this.max,
    this.min = 1,
    this.initValue = 1,
    this.step = 1,
  });

  @override
  State<StatefulWidget> createState() => _CommonSliderState();
}

class _CommonSliderState extends State<CommonSlider> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: WheelChooser.integer(
        horizontal: true,
        unSelectTextStyle: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(.2),
        ),
        selectTextStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        onValueChanged: (v) {
          widget.onValueChanged(v);
        },
        maxValue: widget.max,
        minValue: widget.min,
        step: widget.step,
        initValue: widget.initValue,
      ),
    );
  }
}

class IconVisible extends StatefulWidget {
  final bool visible;
  final IconData icon;

  const IconVisible({
    super.key,
    required this.visible,
    required this.icon,
  });

  @override
  State<StatefulWidget> createState() => _IconVisibleState();
}

class _IconVisibleState extends State<IconVisible> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      replacement: Container(),
      child: Icon(
        widget.icon,
        size: SPHelper.sp(SPHelper.gapDp24),
        color: Theme.of(context).textTheme.labelSmall?.color,
      ),
    );
  }
}

class StartRelax extends StatelessWidget {
  final Function() onPressed;

  const StartRelax({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        width: 140,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          '开始',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SkipRelax extends StatelessWidget {
  final Function() onPressed;

  const SkipRelax({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 140,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Text(
          '跳过',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
