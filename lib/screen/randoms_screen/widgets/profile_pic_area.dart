import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:soolmate_ui/common/common_fun.dart';
import 'package:soolmate_ui/common/common_ui.dart';
import 'package:soolmate_ui/model/user/registration_user.dart';
import 'package:soolmate_ui/screen/shimmer_screen/shimmer_screen.dart';
import 'package:soolmate_ui/utils/asset_res.dart';
import 'package:soolmate_ui/utils/color_res.dart';

class ProfilePicArea extends StatelessWidget {
  final RegistrationUserData? data;
  final bool isLoading;

  const ProfilePicArea({super.key, required this.data, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetRes.worldMap),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SpinKitRipple(
            borderWidth: 100,
            duration: const Duration(milliseconds: 1500),
            size: Get.width / 1.1,
            //color: ColorRes.o,
            itemBuilder: (BuildContext context, int index) {
              return CircleAvatar(
                backgroundColor: ColorRes.grey21.withValues(alpha: 0.40),
              );
            },
          ),
          SpinKitRipple(
            borderWidth: 50,
            duration: const Duration(milliseconds: 1500),
            size: Get.width / 1.5,
            //color: ColorRes.o,
            itemBuilder: (BuildContext context, int index) {
              return CircleAvatar(
                backgroundColor: ColorRes.grey21.withValues(alpha: 0.30),
              );
            },
          ),
          isLoading
              ? ShimmerScreen.circular(
                  height: Get.width / 2.5,
                  width: Get.width / 2.5,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: CachedNetworkImage(
                    imageUrl: CommonFun.getProfileImage(images: data?.images),
                    cacheKey: CommonFun.getProfileImage(images: data?.images),
                    height: Get.width / 2.5,
                    width: Get.width / 2.5,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return CommonUI.profileImagePlaceHolder(
                          name: data?.fullname ?? 'Unknown',
                          borderRadius: 360,
                          heightWidth: Get.width / 2.5);
                    },
                    progressIndicatorBuilder: (context, url, progress) {
                      return ShimmerScreen.circular(
                        height: Get.width / 2.5,
                        width: Get.width / 2.5,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
