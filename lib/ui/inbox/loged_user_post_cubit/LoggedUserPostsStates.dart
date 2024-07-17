
import 'package:graduationproject/model/response/LoggedUserPosts.dart';

abstract class LoggedUserPostsStates {}

class LoggedUserPostsLoadingState extends LoggedUserPostsStates {}

class LoggedUserPostsErrorState extends LoggedUserPostsStates {
  String? errorMessage;
  LoggedUserPostsErrorState({required this.errorMessage});
}

class LoggedUserPostsSuccessState extends LoggedUserPostsStates {
  List<LoggedUserPost>? LoggedUserPosts;
  LoggedUserPostsSuccessState({required this.LoggedUserPosts});
}
