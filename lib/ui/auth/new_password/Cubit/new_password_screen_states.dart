import 'package:graduationproject/model/response/ChangePasswordResponse.dart';

abstract class NewPasswordScreenStates{}
class NewPasswordScreenInitialState extends NewPasswordScreenStates {}
class NewPasswordScreenLoadingState extends NewPasswordScreenStates {
  String? loadingMessage;
  NewPasswordScreenLoadingState({this.loadingMessage});
}
class NewPasswordScreenErrorState extends NewPasswordScreenStates {
  String? errorMessage;
  NewPasswordScreenErrorState({this.errorMessage});
}
class NewPasswordScreenSuccessState extends NewPasswordScreenStates {
  ChangePasswordResponse response;
  NewPasswordScreenSuccessState({required this.response});
}