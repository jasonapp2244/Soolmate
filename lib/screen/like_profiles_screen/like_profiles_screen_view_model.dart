import 'package:flutter/services.dart';
import 'package:soolmate_ui/api_provider/api_provider.dart';
import 'package:soolmate_ui/model/user/registration_user.dart';
import 'package:stacked/stacked.dart';

class LikeProfilesScreenViewModel extends BaseViewModel {
  List<RegistrationUserData> likeUsers = [];
  bool isLoading = true;

  void init() {
    fetchLikedProfiles();
  }

  void fetchLikedProfiles() async {
    isLoading = true;
    ApiProvider().fetchLikedProfiles().then((value) {
      isLoading = false;
      likeUsers.addAll(value.data ?? []);
      notifyListeners();
    });
  }

  void onLikeBtnTap(RegistrationUserData p0) {
    HapticFeedback.lightImpact();
    likeUsers.removeWhere((element) => element.id == p0.id);
    notifyListeners();
    ApiProvider().updateLikedProfile(p0.id);
  }

  void onUpdateUser(RegistrationUserData? userData) {
    if (userData?.isLiked == false) {
      likeUsers.removeWhere((element) => element.id == userData?.id);
      notifyListeners();
    }
  }
}
