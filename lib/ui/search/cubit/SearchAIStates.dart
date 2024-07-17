

import 'package:graduationproject/model/response/SearchAiResponse.dart';

abstract class SearchAIStates{}
class SearchAILoadingState extends SearchAIStates {
  String? loadingMessage;
  SearchAILoadingState({this.loadingMessage});
}
class SearchAIErrorState extends SearchAIStates {
  String? errorMessage;
  SearchAIErrorState({this.errorMessage});
}
class SearchAISuccessState extends SearchAIStates {
  SearchResponse? response;
SearchAISuccessState({required this.response});
}