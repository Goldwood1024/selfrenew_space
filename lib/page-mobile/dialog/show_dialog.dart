import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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
          alignment: Alignment.topCenter,
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
                  children: const [
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

  static showModalBottomSheet(
    BuildContext context,
    Widget child,
  ) {
    showCupertinoModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (_) {
        return child;
      },
    );
  }

  static showToast(String message) {
    SmartDialog.showToast(message);
  }
}
