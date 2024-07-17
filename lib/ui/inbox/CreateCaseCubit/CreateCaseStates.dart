import 'package:graduationproject/model/response/CreateCaseResponse.dart';

abstract class CreateCaseStates {}

class CreateCaseLoadingState extends CreateCaseStates {}

class CreateCaseErrorState extends CreateCaseStates {
  String? errorMessage;
  CreateCaseErrorState({required this.errorMessage});
}

class CreateCaseSuccessState extends CreateCaseStates {
  CreateCaseResponse response;
  CreateCaseSuccessState({required this.response});
}
