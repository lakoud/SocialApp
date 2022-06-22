import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/sheared/components/components.dart';
import 'package:social_app/sheared/styles/icon_broken.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var UserModel=SocialCubit.get(context).model;
        print(UserModel!.email);
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              Container(
                height: 195,
                 child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                   children: [ 
                       if(UserModel!=null)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                              height: 150,
                              width: double.infinity,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                // ignore: prefer_const_constructors
                                borderRadius:BorderRadius.only(
                                  // ignore: prefer_const_constructors
                                  topLeft: Radius.circular(4),
                                  // ignore: prefer_const_constructors
                                  topRight:Radius.circular(4)
                                  
                                  ),
                                image: DecorationImage(
                                  
                                    image:  NetworkImage(UserModel.cover??''
                                    
                                    ),
                                    fit: BoxFit.cover
                                ))),
                    ),
                     if(UserModel!=null)
                      CircleAvatar(
                          radius:61,
                          backgroundColor: Theme.of(context).backgroundColor,
                        child: CircleAvatar(
                              radius:60,
                              backgroundImage: NetworkImage(UserModel.image??''),
                          ),
                      
                    )
              ],
            
                    
                 ),
               ) ,   
              SizedBox(height: 5.0,),
              if(UserModel!=null)
              Text(UserModel.name??'',style: Theme.of(context).textTheme.bodyText1,)  ,
              Text("Bio ...",style: Theme.of(context).textTheme.caption,),  
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:20.0),
                  child: Row(
                    children: [
                      
                         Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('100',
                              style: Theme.of(context).textTheme.subtitle2,),
                                 Text('Posts',
                          style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                         Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('323',
                              style: Theme.of(context).textTheme.subtitle2,),
                                 Text('Photos',
                          style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                         Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('100M',
                              style: Theme.of(context).textTheme.subtitle2,),
                                 Text('Followers',
                          style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                         Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('200',
                              style: Theme.of(context).textTheme.subtitle2,),
                                 Text('Followings',
                          style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                   
    
                    ],),
                ),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(child: Text('Add Photos'),
                    onPressed: (){},)),
                    SizedBox(width: 10,),
                    OutlinedButton(child: Icon(
                      IconBroken.Edit,
                      size: 16,
                    ),
                    onPressed: (){},)

                  ],
                ),
        
          ],
        ),
      );
    
    
    

      },
     
    );
    
  }
}