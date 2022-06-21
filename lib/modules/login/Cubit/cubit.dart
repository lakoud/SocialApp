import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/modules/login/Cubit/states.dart';

class LoginCubit extends Cubit<loginStates>{
  
  LoginCubit():super(LoginInitState());
  static LoginCubit get(context)=>BlocProvider.of(context); //ne5o object

  void userLogin({
    required String email,
    required String password,
  })async{
    emit(LoginLoadingState());
    try {

      final userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
         password: password
         );
             final user = userCredential.user;  

        
         if(user!=null){
   
        
        emit(LoginSuccessState(user.uid));
    
        }

    } catch (error) {
 
      print(error.toString());
      emit(LoginErrorState(error.toString()));
      
    }


  }



  IconData suffix=Icons.visibility_outlined ;
  bool abscure=true;
  void changePasswordVisibility(){
        abscure=!abscure;
        suffix=abscure?Icons.visibility_outlined :Icons.visibility_off_outlined ;
        emit(LoginChangePasswordVisibilityState());
  }

}