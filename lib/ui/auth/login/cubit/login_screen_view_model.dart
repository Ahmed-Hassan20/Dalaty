import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/api/api_manager.dart';

import 'login_screen_states.dart';

class LoginScreenViewModel extends Cubit<LoginScreenStates> {
  LoginScreenViewModel() : super(LoginScreenInitialState());
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  Future<String?> login() async {
    if (formKey.currentState?.validate() == true) {
      try{
        emit(LoginScreenLoadingState(loadingMessage: 'Loading...'));
        var response = await ApiManager.login(
            emailController.text,
            passWordController.text,
          );
        if(response.status != "fail"){
          emit(LoginScreenSuccessState(response: response));
          print(response.token);
          return response.token;
        }else{
          emit(LoginScreenErrorState(errorMessage: response.message));
        }
      }catch(e){
        emit(LoginScreenErrorState(errorMessage: e.toString()));
      }
    }
  }
}
