import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_manager.dart';
import 'LoggedUserPostsStates.dart';

class LoggedUserPostsViewModel extends Cubit<LoggedUserPostsStates> {
  String? token;
  LoggedUserPostsViewModel(this.token) : super(LoggedUserPostsLoadingState());

  void getLoggedUserPosts() async {
    try {

      var response = await ApiManager.getLoggedUserPosts(token!);
      if (response.success != true) {
        emit(LoggedUserPostsErrorState(errorMessage: response.message));
      } else {
        emit(LoggedUserPostsSuccessState(
            LoggedUserPosts:response.data ));
      }
    } catch (e) {
      emit(LoggedUserPostsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getToken(String newtoken) async {
    token = newtoken;
    print(token);
  }
}
