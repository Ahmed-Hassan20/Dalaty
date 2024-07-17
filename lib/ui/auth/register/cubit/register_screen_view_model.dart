import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/api/api_manager.dart';
import 'package:graduationproject/ui/auth/register/cubit/register_screen_states.dart';

class RegisterScreenViewModel extends Cubit<RegisterScreenStates> {
  RegisterScreenViewModel() : super(RegisterScreenInitialState());
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isRePassword = true;
  var selectedGovernorate;
  List<String> governorateList = [
    "Alexandria",
    "Aswan",
    "Asyut",
    "Beheira",
    "Beni Suef",
    "Cairo",
    "Dakahlia",
    "Damietta",
    "Faiyum",
    "Gharbia",
    "Giza",
    "Ismailia",
    "Kafr El Sheikh",
    "Luxor",
    "Matrouh",
    "Minya",
    "Monufia",
    "New Valley",
    "North Sinai",
    "Port Said",
    "Qalyubia",
    "Qena",
    "Red Sea",
    "Sharqia",
    "Sohag",
    "South Sinai",
    "Suez",
  ];
  Future<void> register() async {
    if (formKey.currentState?.validate() == true) {
      try{
        emit(RegisterScreenLoadingState(loadingMessage: 'Loading...'));
        var response = await ApiManager.register(
            fullNameController.text,
            emailController.text,
            passWordController.text,
            confirmationPasswordController.text,
            phoneController.text,
            selectedGovernorate);
        if(response.status != "fail"){
          emit(RegisterScreenSuccessState(response: response));
        }else{
          emit(RegisterScreenErrorState(errorMessage: response.message));
        }
      }catch(e){
        emit(RegisterScreenErrorState(errorMessage: e.toString()));
      }
    }
  }
}
