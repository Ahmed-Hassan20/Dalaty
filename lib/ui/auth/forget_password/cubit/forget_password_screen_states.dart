import 'package:graduationproject/model/response/forgetPasswordResponse.dart';

abstract class ForgetPasswordScreenStates{}
class ForgetPasswordScreenInitialState extends ForgetPasswordScreenStates {}
class ForgetPasswordScreenLoadingState extends ForgetPasswordScreenStates {
  String? loadingMessage;
  ForgetPasswordScreenLoadingState({this.loadingMessage});
}
class ForgetPasswordScreenErrorState extends ForgetPasswordScreenStates {
  String? errorMessage;
  ForgetPasswordScreenErrorState({this.errorMessage});
}
class ForgetPasswordScreenSuccessState extends ForgetPasswordScreenStates {
  ForgetPasswordResponse response;
  ForgetPasswordScreenSuccessState({required this.response});
}