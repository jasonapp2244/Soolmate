import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soolmate_ui/common/common_fun.dart';
import 'package:soolmate_ui/common/common_ui.dart';
import 'package:soolmate_ui/model/user/registration_user.dart';
import 'package:soolmate_ui/screen/blocked_profiles_screen/blocked_profiles_screen_view_model.dart';
import 'package:soolmate_ui/screen/user_detail_screen/user_detail_screen.dart';
import 'package:soolmate_ui/utils/asset_res.dart';
import 'package:soolmate_ui/utils/color_res.dart';
import 'package:soolmate_ui/utils/font_res.dart';

class BlockedCard extends StatelessWidget {
  final RegistrationUserData userData;
  final BlockedProfilesScreenViewModel viewModel;
  final bool isBlocked;

  const BlockedCard(
      {super.key,
      required this.userData,
      required this.viewModel,
      required this.isBlocked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => UserDetailScreen(userData: userData))?.then((value) {
          viewModel.onBackBlockIds(userData);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: const BoxDecoration(color: ColorRes.lightGrey2),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: CommonFun.getProfileImage(images: userData.images),
                cacheKey: CommonFun.getProfileImage(images: userData.images),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return CommonUI.profileImagePlaceHolder(
                      name: userData.fullname, heightWidth: 40);
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(userData.fullname ?? 'Unknown',
                            style: const TextStyle(
                              color: ColorRes.darkGrey,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: FontRes.bold,
                            ),
                            maxLines: 1),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "${userData.age ?? ''}",
                        style: const TextStyle(
                            color: ColorRes.darkGrey,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      const SizedBox(width: 3),
                      userData.isVerified == 2
                          ? Image.asset(AssetRes.tickMark,
                              height: 18, width: 18)
                          : const SizedBox(),
                    ],
                  ),
                  Text(userData.live ?? '',
                      style: const TextStyle(
                          color: ColorRes.darkGrey9,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1),
                ],
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => viewModel.onUnblockClick(userData),
              style: ButtonStyle(
                maximumSize: WidgetStateProperty.all(
                  const Size(100, 100),
                ),
                backgroundColor: WidgetStateProperty.all(
                  ColorRes.darkOrange.withValues(alpha: 0.1),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                'Unblock',
                style: TextStyle(
                  fontFamily: FontRes.bold,
                  color: ColorRes.darkOrange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
