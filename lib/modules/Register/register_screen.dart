


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/Home/home.dart';
import 'package:social_app/modules/Register/Cubit/cubit.dart';
import 'package:social_app/modules/Register/Cubit/states.dart';
import 'package:social_app/sheared/components/components.dart';



class RegisterSocialScreen extends StatefulWidget {
  const RegisterSocialScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSocialScreen> createState() => _RegisterSocialScreenState();
}

class _RegisterSocialScreenState extends State<RegisterSocialScreen> {


  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var phoneController=TextEditingController();

  var nameController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
// hethiiii 
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => RegisterCubit()),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is RegisterCreateSuccessState){
         Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
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
                          Text('Register',
                      style: Theme.of(context).textTheme.headline5,
                      ),
                         Text('Login now to communicate with friends',       
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
                      ),
                     const SizedBox(
                        height: 30,
                      ),
                       defaultTextfield(
                        onChanged:(){},
                        errorfor: 'Name',
                       hint: 'Name ',
                       label: 'Name',
                       type: TextInputType.text,
                       myController: nameController,
                       icon: const Icon(Icons.person)
                       ),
                       const SizedBox(height: 10,),
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
                        RegisterCubit.get(context).changePasswordVisibility();
                       },
                       iconsufix: RegisterCubit.get(context).suffix,
                       abscure:  RegisterCubit.get(context).abscure,
                       ),
                      const SizedBox(height: 10,),
                       defaultTextfield(
                        onChanged:(){},
                        errorfor: 'Phone',
                       hint: 'Phone ',
                       label: 'Phone',
                       type: TextInputType.phone,
                       myController:phoneController,
                       icon: const Icon(Icons.phone)
                       ),
                        const SizedBox(height: 20,),
                          ConditionalBuilder(
                          condition: state is !RegisterLoadingState,
                         builder:(context)=> defaultButton(
                             text: 'REGISTER',
                           validate:(){ 
                             
                           if(_formKey.currentState != null && _formKey.currentState!.validate()) {  
                                  RegisterCubit.get(context).userRegister(
                                    name:nameController.text ,
                                     email: emailController.text,
                                      password: passwordController.text,
                                       phone: phoneController.text);

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
                            const Text('You have account?'),
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'Login');
                              },
                               child: const Text('Login'))
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