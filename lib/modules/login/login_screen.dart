
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/modules/login/Cubit/cubit.dart';
import 'package:social_app/sheared/components/components.dart';
import 'package:social_app/sheared/components/constans.dart';

import '../../layout/Home/home.dart';
import '../../sheared/components/constans.dart';
import '../../sheared/components/constans.dart';
import '../Register/Cubit/states.dart';
import 'Cubit/states.dart';

class LoginSocialScreen extends StatefulWidget {
  const LoginSocialScreen({Key? key}) : super(key: key);

  @override
  State<LoginSocialScreen> createState() => _LoginSocialScreenState();
}

class _LoginSocialScreenState extends State<LoginSocialScreen> {


  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
// hethiiii 
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( (context) => LoginCubit()),
      child: BlocConsumer<LoginCubit,loginStates>(
        listener: (context, state) 
    async    {
          if(state is LoginErrorState){
       toast(text: state.error,color: Colors.red);
          }
          if (state is LoginSuccessState) {
           
           
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('uId',state.uId );
           
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Home()));
          }

        },
        builder: (context,state)=>Scaffold(
            appBar: AppBar(),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('LOGIN',
                    style: Theme.of(context).textTheme.headline5,
                    ),
                       Text('Login now to communicate with friends',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
                    ),
                   const   SizedBox(
                      height: 30,
                    ),
                    defaultTextfield(
                      onChanged:(){},
                      errorfor: 'Email',
                     hint: 'Email Address',
                     label: 'Email Address',
                     type: TextInputType.emailAddress,
                     myController: emailController,
                     icon: const Icon(Icons.email)
                     ),
                    const SizedBox(height: 10,),
                   defaultTextfield(
                    onChanged: (){},
                      errorfor: 'Password',
                     hint: 'Passowrd',
                     label: 'Passowrd',
                     type: TextInputType.visiblePassword,
                     myController: passwordController,
                     icon: const Icon(Icons.lock),
                     suffixpressed:(){
                      LoginCubit.get(context).changePasswordVisibility();
                     },
                     iconsufix: LoginCubit.get(context).suffix,
                     abscure:  LoginCubit.get(context).abscure,
                     ),
                      const SizedBox(height: 20,),
                        ConditionalBuilder(
                          condition: state is !RegisterLoadingState,
                         builder:(context)=> defaultButton(
                             text: 'LOGIN',
                           validate:()async{ 
                            
                           if(_formKey.currentState != null && _formKey.currentState!.validate()) {  
                              LoginCubit.get(context).userLogin(
                                email: emailController.text, 
                                password: passwordController.text);
                    
                              
                                }
                              else {  
                                print('not validated');
                               }},
                          
                           radius: 10),
                           fallback: (context)=>const Center(child: CircularProgressIndicator()),
                        ), 
                       
                        
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have account?'),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, 'Register');
                            },
                             child: const Text('Register Now'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        
        
        ),
      ),
    );
      
  }
}