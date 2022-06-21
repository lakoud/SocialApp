import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/sheared/styles/icon_broken.dart';

import '../../cubit/cubit.dart';
import '../../sheared/components/constans.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
  
       listener:(context, state)async {
      

       },
       builder: (context,state){
        var cubit=SocialCubit.get(context);
           return Scaffold(
      appBar: AppBar(
            title:  Text(cubit.titles[cubit.currentIndex]),
          actions: [
            IconButton(onPressed: (){}, 
            icon: Icon(IconBroken.Notification)
            
            
            ),
             IconButton(onPressed: (){}, 
            icon: Icon(IconBroken.Search)
            
            ),
              IconButton(onPressed: 
              (){
                SocialCubit.get(context).changeappmode();
              }, icon: Icon(Icons.brightness_4_outlined))
          ],
      ),
    body: cubit.screens[cubit.currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      currentIndex: cubit.currentIndex,
      onTap: (index) {
        cubit.changeBottomnav(index);

      },
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        
        BottomNavigationBarItem(
          icon: Icon(IconBroken.Home),
          label:'Home',
           ),
        BottomNavigationBarItem(
          icon: Icon(IconBroken.Chat,
          ),
          label:'chat',
          ),
        BottomNavigationBarItem(
          icon: Icon(IconBroken.Location),
          label:'User',
          
          ),
           BottomNavigationBarItem(
          icon: Icon(IconBroken.Setting),
          label:'Settings',
          
          ),
     
          
        
      ]),
      

    );
       });
  
  }}