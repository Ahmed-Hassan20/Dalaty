import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/api/api_manager.dart';

import 'forget_password_screen_states.dart';

class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordScreenStates> {
  ForgetPasswordScreenViewModel() : super(ForgetPasswordScreenInitialState());
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> sendOTP() async {
    if (formKey.currentState?.validate() == true) {
      try{
        emit(ForgetPasswordScreenLoadingState(loadingMessage: 'Loading...'));
        var response = await ApiManager.forgetPassword(
            emailController.text,
          );
        if(response.status != "fail"){
          emit(ForgetPasswordScreenSuccessState(response: response));
        }else{
          emit(ForgetPasswordScreenErrorState(errorMessage: response.message));
        }
      }catch(e){
        emit(ForgetPasswordScreenErrorState(errorMessage: e.toString()));
      }
    }
  }
}
