
import '../../../model/response/Missing.dart';

abstract class HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorState extends HomeStates {
  String? errorMessage;
  HomeErrorState({required this.errorMessage});
}

class HomeSuccessState extends HomeStates {
  List<MissingPersons> allMissingList;
  HomeSuccessState({required this.allMissingList});
}
