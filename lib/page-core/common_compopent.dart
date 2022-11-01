import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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

class ChipEmpty extends StatefulWidget {
  final List<TipChip> options;
  final Function(Object) onPressed;

  const ChipEmpty({
    super.key,
    required this.options,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _ChipEmptyState();
}

class _ChipEmptyState extends State<ChipEmpty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SPHelper.getHeightBox(SPHelper.gapDp20),
        ChipsChoice.single(
          padding: EdgeInsets.zero,
          alignment: WrapAlignment.center,
          value: [],
          spacing: SPHelper.width(SPHelper.gapDp14),
          runSpacing: SPHelper.width(SPHelper.gapDp14),
          choiceStyle: C2ChipStyle(
            height: SPHelper.height(SPHelper.gapDp48),
            backgroundColor: Theme.of(context).backgroundColor,
            backgroundOpacity: 1,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding:
                EdgeInsets.fromLTRB(SPHelper.width(SPHelper.gapDp14), 0, 0, 0),
            foregroundSpacing: SPHelper.width(SPHelper.gapDp14),
            foregroundStyle: TextStyle(
              fontSize: SPHelper.sp(SPHelper.fontSp18),
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.labelSmall?.color,
            ),
          ),
          placeholder: '无',
          wrapped: true,
          onChanged: (_) {
            widget.onPressed(_);
          },
          choiceLeadingBuilder: (item, v) {
            return SizedBox(
              width: SPHelper.width(SPHelper.gapDp24),
              height: SPHelper.height(SPHelper.gapDp24),
              child: Image(
                image: item.avatarImage!,
              ),
            );
          },
          choiceItems: C2Choice.listFrom<String, TipChip>(
            source: widget.options,
            value: (i, v) => v.value,
            label: (i, v) => v.title,
            avatarImage: (i, v) => AssetImage(v.image),
          ),
        ),
        SPHelper.getHeightBox(SPHelper.gapDp20),
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
