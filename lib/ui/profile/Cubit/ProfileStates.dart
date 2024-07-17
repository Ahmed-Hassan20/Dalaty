import 'package:graduationproject/model/response/LoggedUserInfo.dart';

abstract class ProfileStates{}
class ProfileLoadingState extends ProfileStates {
  String? loadingMessage;
  ProfileLoadingState({this.loadingMessage});
}
class ProfileErrorState extends ProfileStates {
  String? errorMessage;
  ProfileErrorState({this.errorMessage});
}
class ProfileSuccessState extends ProfileStates {
Result userInfo;
ProfileSuccessState({required this.userInfo});
}