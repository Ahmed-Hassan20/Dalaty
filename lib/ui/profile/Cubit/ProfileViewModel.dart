import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/profile/Cubit/ProfileStates.dart';

import '../../../api/api_manager.dart';


class ProfileViewModel extends Cubit<ProfileStates> {
  String? token;
  ProfileViewModel(this.token) : super(ProfileLoadingState());


  void getLoggedUserInfo() async {
    try {
      emit(ProfileLoadingState());
      var response = await ApiManager.getLoggedUserInfo(token!);
      if (response.success==false) {
        emit(ProfileErrorState(errorMessage: 'Error'));
      }
      else {
        emit(ProfileSuccessState(userInfo: response.result!));
      }
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }
}
