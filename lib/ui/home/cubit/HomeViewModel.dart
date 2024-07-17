import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_manager.dart';
import 'HomeStates.dart';


class HomeViewModel extends Cubit<HomeStates> {
  String? token;
  HomeViewModel() : super(HomeLoadingState());

  void getAllMissing() async {
    try {
      emit(HomeLoadingState());
      var response = await ApiManager.getAllMissing(token!);
      if (response.status == 'fail') {
        emit(HomeErrorState(errorMessage: response.message));
      }
      else {
        emit(HomeSuccessState(allMissingList: response.data!.missingPersons!));
      }
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getToken(String newtoken) async {
    token = newtoken;
    print(token);
  }
}
