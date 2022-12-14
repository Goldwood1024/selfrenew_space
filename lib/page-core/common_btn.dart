import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class BackBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const BackBtn({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.back,
            size: SPHelper.backIconSize,
            color: Theme.of(context).primaryColor,
          ),
          title == null
              ? Container()
              : Text(
                  title!,
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.gapDp18),
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
        ],
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const ActionBtn({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 14, 0),
        child: title == null
            ? Container()
            : Text(
                title!,
                style: TextStyle(
                  fontSize: SPHelper.sp(SPHelper.gapDp18),
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
      ),
    );
  }
}

class ActionIconBtn extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onPressed;

  const ActionIconBtn({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.zero,
        child: icon,
      ),
    );
  }
}

class GoBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const GoBtn({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title == null
              ? Container()
              : Text(
                  title!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
          // Icon(
          //   CupertinoIcons.forward,
          //   size: 22,
          //   color: Theme.of(context).primaryColor,
          // ),
        ],
      ),
    );
  }
}

class ConfirmBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const ConfirmBtn({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 140,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(SPHelper.mediumRadius()),
        ),
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CancelBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const CancelBtn({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 140,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CupertinoColors.opaqueSeparator,
          borderRadius: BorderRadius.circular(SPHelper.mediumRadius()),
        ),
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
