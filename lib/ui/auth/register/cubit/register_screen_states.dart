import 'package:graduationproject/model/response/RegisterResponse.dart';

abstract class RegisterScreenStates{}
class RegisterScreenInitialState extends RegisterScreenStates {}
class RegisterScreenLoadingState extends RegisterScreenStates {
  String? loadingMessage;
  RegisterScreenLoadingState({this.loadingMessage});
}
class RegisterScreenErrorState extends RegisterScreenStates {
  String? errorMessage;
  RegisterScreenErrorState({this.errorMessage});
}
class RegisterScreenSuccessState extends RegisterScreenStates {
  RegisterResponse response;
  RegisterScreenSuccessState({required this.response});
}