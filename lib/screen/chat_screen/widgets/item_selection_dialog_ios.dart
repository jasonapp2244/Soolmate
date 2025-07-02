import 'package:flutter/cupertino.dart';
import 'package:soolmate_ui/generated/l10n.dart';
import 'package:soolmate_ui/utils/color_res.dart';

class ItemSelectionDialogIos extends StatelessWidget {
  final VoidCallback onImageBtnClickIos;
  final VoidCallback onVideoBtnClickIos;
  final VoidCallback onCloseBtnClickIos;

  const ItemSelectionDialogIos(
      {super.key,
      required this.onCloseBtnClickIos,
      required this.onImageBtnClickIos,
      required this.onVideoBtnClickIos});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        S.current.whichItemWouldYouLikeEtc,
        style: const TextStyle(color: ColorRes.grey),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: onImageBtnClickIos,
          child: Text(S.current.photos),
        ),
        CupertinoActionSheetAction(
          onPressed: onVideoBtnClickIos,
          child: Text(S.current.videos),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: onCloseBtnClickIos,
        child: Text(S.current.close),
      ),
    );
  }
}
