import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/model/user_model.dart';
import 'package:social_app/modules/chats/chat_scrren.dart';
import 'package:social_app/modules/feeds/feeds_scrren.dart';
import 'package:social_app/modules/users/users_scrren.dart';
import 'package:social_app/sheared/components/constans.dart';

import '../modules/settings/settings_secreen.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit() : super(SocialGetuserInitStates());


  static SocialCubit get(context)=>BlocProvider.of(context);
      UserModel? model;

  void getuserData(){
    emit(SocialGetuserLoadingStates());
    FirebaseFirestore.instance.collection('users')
    .doc(uId).
    get().
    then((value) {
      model=UserModel.fromJson(value.data());
      emit(SocialGetUserSuccesstStates());
    }).
    catchError((onError){
        print(onError.toString());
      emit(SocialGetUserErrorStates(onError));
    });
  }



  int currentIndex=0;
  List<Widget> screens=[
    FeedsScreen(),
   ChatScreen(),
   UsersScreen(),
   SettingsScreen()

  ];
    List<String> titles=[
      'Home'  ,
      'chats',
      'Users',
      'Settings'

  ];
void changeBottomnav(int index){
  currentIndex=index;
  emit(SocialChangeBottomNavState());

}
bool isdark=false;
void changeappmode({final darmode })async{
  if(darmode !=null){
    isdark=darmode;
                emit(SocialChangeModeState());

  }
  else{

isdark=!isdark;

     SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('mode',isdark );
                emit(SocialChangeModeState());

  }

}
}