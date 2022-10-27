import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusFormCard extends StatefulWidget {
  final String title;
  final Widget child;
  final FontWeight fontWeight;
  final double fontSize;

  const FocusFormCard({
    super.key,
    required this.title,
    required this.child,
    required this.fontWeight,
    this.fontSize = SPHelper.fontSp18,
  });

  @override
  State<StatefulWidget> createState() => _FocusFormCardState();
}

class _FocusFormCardState extends State<FocusFormCard>
    with SingleTickerProviderStateMixin {
  late bool selected;

  @override
  void initState() {
    super.initState();
    selected = false;
  }

  @override
  void dispose() {
    selected = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          SPHelper.smallRadius(),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
              14,
              SPHelper.pageVerticalPadding(),
              0,
              0,
            ),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: SPHelper.sp(widget.fontSize),
                    fontWeight: widget.fontWeight,
                  ),
                )
              ],
            ),
          ),
          SPHelper.getHeightBox(SPHelper.pageVerticalPadding()),
          Container(
            margin: EdgeInsets.fromLTRB(
              SPHelper.pageHorizontalPadding(),
              0,
              SPHelper.pageHorizontalPadding(),
              SPHelper.pageVerticalPadding(),
            ),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
