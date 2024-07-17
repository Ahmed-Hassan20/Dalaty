import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_manager.dart';
import 'SearchAIStates.dart';

class SearchAIViewModel extends Cubit<SearchAIStates> {
  SearchAIViewModel() : super(SearchAILoadingState());

  void SearchByAI(File? image) async {
    try {
      emit(SearchAILoadingState());
      if (image == null) {
        emit(SearchAIErrorState(errorMessage: 'No image selected'));
        return;
      }
      var response = await ApiManager.SearchByAI(image);
      if (response?.success != true) {
        emit(SearchAIErrorState(errorMessage: 'Error'));

        print(response?.success);
        print('${response?.message}');
      } else {
        emit(SearchAISuccessState(response: response?.data));
        print(response?.success);
        print('${response?.message}');
      }
    } catch (e) {
      emit(SearchAIErrorState(errorMessage: e.toString()));
    }
  }




}
