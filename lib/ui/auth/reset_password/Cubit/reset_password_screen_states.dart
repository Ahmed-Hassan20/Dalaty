import 'package:graduationproject/model/response/CheckOTPResponse.dart';

abstract class ResetPasswordScreenStates{}
class ResetPasswordScreenInitialState extends ResetPasswordScreenStates {}
class ResetPasswordScreenLoadingState extends ResetPasswordScreenStates {
  String? loadingMessage;
  ResetPasswordScreenLoadingState({this.loadingMessage});
}
class ResetPasswordScreenErrorState extends ResetPasswordScreenStates {
  String? errorMessage;
  ResetPasswordScreenErrorState({this.errorMessage});
}
class ResetPasswordScreenSuccessState extends ResetPasswordScreenStates {
  CheckOtpResponse response;
  ResetPasswordScreenSuccessState({required this.response});
}