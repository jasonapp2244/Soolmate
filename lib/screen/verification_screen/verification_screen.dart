import 'package:flutter/material.dart';
import 'package:soolmate_ui/common/top_bar_area.dart';
import 'package:soolmate_ui/generated/l10n.dart';
import 'package:soolmate_ui/screen/verification_screen/verification_screen_view_model.dart';
import 'package:soolmate_ui/screen/verification_screen/widget/verification_center_area.dart';
import 'package:soolmate_ui/utils/color_res.dart';
import 'package:stacked/stacked.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationScreenViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => VerificationScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                TopBarArea(
                  title2: S.current.reqVerification,
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  width: MediaQuery.of(context).size.width,
                  color: ColorRes.grey5,
                ),
                VerificationCenterArea(
                  fullNameError: model.fullNameError,
                  fullNameController: model.fullNameController,
                  fullNameFocus: model.fullNameFocus,
                  showDropdown: model.showDropdown,
                  docType: model.docType,
                  onDocChange: model.onDocChange,
                  onDocTypeTap: model.onDocTypeTap,
                  onTakePhotoTap: model.onTakePhotoTap,
                  onDocumentTap: model.onDocumentTap,
                  onSubmitBtnClick: model.onSubmitBtnClick,
                  selfieImage: model.selfieImage,
                  imagesName: model.documentName,
                  isDocFile: model.isDocumentType,
                  isSelfie: model.isSelfie,
                  userIdentity: model.userData,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
