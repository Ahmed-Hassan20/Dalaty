import 'package:graduationproject/model/response/LoginResponse.dart';

abstract class LoginScreenStates{}
class LoginScreenInitialState extends LoginScreenStates {}
class LoginScreenLoadingState extends LoginScreenStates {
  String? loadingMessage;
  LoginScreenLoadingState({this.loadingMessage});
}
class LoginScreenErrorState extends LoginScreenStates {
  String? errorMessage;
  LoginScreenErrorState({this.errorMessage});
}
class LoginScreenSuccessState extends LoginScreenStates {
  LoginResponse response;
  LoginScreenSuccessState({required this.response});
}