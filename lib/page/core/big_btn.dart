import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FloatingBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingBtn({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        child: SvgPicture.asset(
          'assets/icons/add.svg',
          width: 48,
          height: 48,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class TextBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double width;
  final TextStyle style;

  const TextBtn({
    super.key,
    required this.onPressed,
    required this.title,
    required this.style,
    this.width = 60,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color fontColor;
  final Color backgroundColor;
  final GestureTapCallback onPressed;
  final String title;

  const CustomBtn({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.title,
    required this.fontSize,
    required this.fontColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            SPHelper.mediumRadius(),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: SPHelper.sp(fontSize),
            fontWeight: FontWeight.w600,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
