import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FormCard extends StatefulWidget {
  final String title;
  final Widget child;
  final Widget titleTrailing;
  final FontWeight fontWeight;
  final double fontSize;

  const FormCard({
    super.key,
    required this.title,
    required this.titleTrailing,
    required this.child,
    required this.fontWeight,
    this.fontSize = SPHelper.fontSp18,
  });

  @override
  State<StatefulWidget> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: SPHelper.sp(widget.fontSize),
                    fontWeight: widget.fontWeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                  child: widget.titleTrailing,
                ),
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
