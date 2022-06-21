import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/layout/Home/home.dart';
import 'package:social_app/modules/Register/register_screen.dart';
import 'package:social_app/sheared/components/constans.dart';

import 'cubit/cubit.dart';
import 'modules/login/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized(); // tst3mlha ki ybda asyn l main bech tothmn eno 2li b3do tnafth 

await Firebase.initializeApp();

Widget widget;
   SharedPreferences prefs = await SharedPreferences.getInstance();
       uId = prefs.getString('uId');
      final  mode = prefs.getBool('mode');

       print("home");
    print(uId);
    if(uId !=null){
      widget=Home();
    }else{
      widget=LoginSocialScreen();
    }

  runApp( MyApp(startwidget:widget, mode:mode ,));
}

class MyApp extends StatelessWidget {
  Widget startwidget;
  final mode;
  
   MyApp({required this.startwidget, required this.mode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ( context)=>SocialCubit()..getuserData()
          
          )
      ],
     
     child: BlocProvider(
      create: (context)=>SocialCubit()..changeappmode(darmode: mode),
      child:BlocConsumer<SocialCubit,SocialStates>(
     listener :(context, state) {
       
     },
     builder: (context, state) {
       return MaterialApp(
            
            debugShowCheckedModeBanner: false,
            
            title: 'Flutter Demo',
            theme: ThemeData(
               // ignore: prefer_const_constructors
               textTheme: TextTheme(
                // ignore: prefer_const_constructors
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:Colors.black
                )
              ), 
              // ignore: prefer_const_constructors
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white
             ),
              // ignore: prefer_const_constructors
              appBarTheme:AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
     
                backgroundColor: Colors.white,
                // ignore: prefer_const_constructors
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark
                ),
                elevation: 0.0,
                // ignore: prefer_const_constructors
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,
                  fontWeight: FontWeight.bold
                )
                        )
            ),
            darkTheme: ThemeData(
              // ignore: prefer_const_constructors
              textTheme: TextTheme(
                // ignore: prefer_const_constructors
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:Colors.white
                )
              ),
              scaffoldBackgroundColor:HexColor('333739'),
                    // ignore: prefer_const_constructors
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              // ignore: prefer_const_constructors
              appBarTheme:AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
     
                backgroundColor:HexColor('333739'),
                // ignore: prefer_const_constructors
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                elevation: 0.0,
                // ignore: prefer_const_constructors
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  color:Colors.white,
                  fontWeight: FontWeight.bold
                )
            ),),
            themeMode: SocialCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
            home: startwidget,
            routes:{ 'Login':(context)=>const LoginSocialScreen(),
                      'Register':(context)=>const RegisterSocialScreen(),
                      'home':(context) => const Home()
            
            
            
            }
          );
     
     
     }) ,
     ));
    
  
  }
}
