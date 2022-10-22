import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class StatisticCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const StatisticCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 68,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(SPHelper.pageVerticalPadding(), 0,
                  SPHelper.pageVerticalPadding(), 0),
              child: Icon(
                icon,
                size: SPHelper.sp(SPHelper.fontSp24),
                color: iconColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: SPHelper.sp(SPHelper.fontSp18),
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: SPHelper.sp(SPHelper.fontSp12),
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.systemGrey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
