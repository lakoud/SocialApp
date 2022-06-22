import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/user_model.dart';
import 'package:social_app/modules/Register/Cubit/states.dart';
class RegisterCubit extends Cubit<RegisterStates>{
 RegisterCubit():super(RegisterInitState());
  static RegisterCubit get(context)=>BlocProvider.of(context); //ne5o object
  
Future userRegister(
    {required String email,
     required String password,
     required String phone,
     required String name,
     
     }) async {
      emit(RegisterLoadingState());

  try {
    final userCredential = await FirebaseAuth.instance  
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;  
    print(user?.email);

     userCreate(
     name:name,
     email:email,
     phone:phone,
     uId: userCredential.user!.uid 
     );
              print(userCredential.user!.uid );

  } catch (error) {
      print(error.toString());
    emit(RegisterErrorState(error.toString()));
  }


  }
  
   CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> userCreate({
    required name,
    required email,
    required phone,
    required uId
    
  }) {
        UserModel model=UserModel(
          name: name,email:email, phone: phone,uId: uId,
          image: "https://img.freepik.com/free-photo/front-view-refined-woman-with-black-curly-hair_197531-16786.jpg?t=st=1655841283~exp=1655841883~hmac=640156e786e30925c2dcfe09001e77ceb401219674bd167f2245ee029356ce79&w=740"
       ,
       cover: "https://img.freepik.com/free-photo/front-view-refined-woman-with-black-curly-hair_197531-16786.jpg?t=st=1655841283~exp=1655841883~hmac=640156e786e30925c2dcfe09001e77ceb401219674bd167f2245ee029356ce79&w=740",
       
        bio: 'write uour bio'
          );

      return users.doc(uId)
          .set(model.toMap())
          .then((value){
            emit(RegisterCreateSuccessState());
            })
          .catchError((error) { 
            emit(RegisterErrorCreateState(error.toString()));
            // ignore: avoid_print
            print("Failed to add user: $error");});
    }

  IconData suffix=Icons.visibility_outlined ;
  bool abscure=true;
  void changePasswordVisibility(){
        abscure=!abscure;
        suffix=abscure?Icons.visibility_outlined :Icons.visibility_off_outlined ;
        emit(RegisterChangePasswordVisibilityState());
  }

}