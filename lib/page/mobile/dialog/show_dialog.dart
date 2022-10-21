import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class BottomDialog {
  static showValueSelect(
    BuildContext context,
    Widget child,
    String title,
  ) {
    SmartDialog.show(
      alignment: Alignment.bottomCenter,
      builder: (_) {
        return Container(
          margin: SPHelper.pagePadding,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(SPHelper.smallRadius()),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              Container(
                margin: SPHelper.pagePaddingVertical,
                child: const Text(
                  '选择音效',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: child,
              ),
              Container(
                margin: SPHelper.pagePaddingVertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CancelBtn(
                      title: '取消',
                    ),
                    ConfirmBtn(
                      title: '确定',
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
