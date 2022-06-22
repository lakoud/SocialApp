
import 'package:flutter/material.dart';

import 'package:social_app/sheared/styles/colors.dart';
import 'package:social_app/sheared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation:5,
            margin: EdgeInsets.all(8),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage("https://img.freepik.com/free-photo/portrait-dreamy-satisfied-ethnic-girl-concentrated-aside-with-happy-smile-holds-hands-chin-looks-with-hopeful-expression-believes-better-wears-casual-yellow-t-shirt-stands_273609-27990.jpg?t=st=1655840959~exp=1655841559~hmac=d21eeaec3096ebab9964a5e52cbe65cbea951427a40ba097f5b966950c5e1ee2&w=740")
                  ,fit: BoxFit.cover,
                  height: 200.0,
                  width:double.infinity ,
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Comnicate with friends',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white
                  )
                  ),
                )
              ],
            ),
              
          ),
      ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height:8,),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => PostItem(context),
        itemCount: 3,
      ),
       SizedBox(height: 8,)
       
        ],
      ),
    );
  }
  Widget PostItem(context)=>  Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation:5,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                Row(
                  children: [
                      CircleAvatar(
                        radius:25 ,
                        backgroundImage: NetworkImage("https://img.freepik.com/free-photo/indoor-shot-young-cheerful-dark-haired-woman-keeping-raised-hand-her-chest-laughing-happily-with-closed-eyes-isolated-blue-wall_295783-11258.jpg?t=st=1655833780~exp=1655834380~hmac=24cae6db432387692bc7690c2523b7d9d4aa61c8467b02416e69feb8941daaac&w=740"),
                    )
                      ,SizedBox(width: 15,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('lakoud rania',
                              style: TextStyle(height: 1.4),),
                              SizedBox(width: 8,),
                              Icon(Icons.check_circle , color: defaultColor,size: 16,),
                            ],
                          ),
                          Text("January 1, 2022 at 9:00 pm",
                          style: Theme.of(context).textTheme.caption!.copyWith(height: 1.4),)
                        ],
                      ))
                   ,SizedBox(width: 15,),
                   IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz, size: 16,))
                  ],
                  
    
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom:10,
                    top: 5 ),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                )
                  ,Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
                  ,style: Theme.of(context).textTheme.subtitle1,
                  )
                  ,
              Padding(
                   padding: const EdgeInsets.symmetric(vertical:5.0),
                   child: Container(
                    width: double.infinity,
                     child: Wrap(
              
                      children: [
                         Padding(
                   padding: const EdgeInsetsDirectional.only(end:5.0),
                           child: Container(    
                    height: 25,
                    child: MaterialButton(onPressed: (){}, 
                      minWidth: 1,
                      height: 20,
                      padding: EdgeInsets.zero,
                      child: Text('#Maroc',
                      style: TextStyle(color: defaultColor),
    
                      )),
                           ),
                         ),
                      
                        Padding(
                   padding: const EdgeInsetsDirectional.only(end:10.0),
                          child: Container(    height: 20,
                            child: MaterialButton(onPressed: (){}, 
                      minWidth: 1,
                
                      padding: EdgeInsets.zero,
                      child: Text('#Tunisia',
                      style: TextStyle(color: defaultColor),
    
                      )),
                          ),
                        ),
                       
                      ],
                   
                   
                   
                     ),
                   ),
                 ),
              Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(4),
                      image: DecorationImage(
                        
                          image:  NetworkImage("https://img.freepik.com/free-photo/international-students-day-young-cute-girl-red-checked-shirt-surprised-phone-call_140725-161455.jpg?t=st=1655840959~exp=1655841559~hmac=d7b76cc17f0d4e221998e9b6f604260812422669831747a5d5a8ac8301bb2da3&w=740"
                          
                          ),
                          fit: BoxFit.cover
                      ))) ,   
               
               Padding(
                 padding: const EdgeInsets.symmetric(vertical:5.0),
                 child: Row(
                        children: [

                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:5.0),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(IconBroken.Heart,
                                    size: 16,
                                    color: Colors.red,
                                    ),
                                        SizedBox(width:5),
                                Text("100",style: Theme.of(context).textTheme.caption,)
                                  ],
                                ),
                              ),
                           
                            ),
                          ),
                        Expanded(
                            child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(IconBroken.Chat,
                                    size: 16,
                                    color: Colors.amber,
                                    ),
                                        SizedBox(width:5),
                                Text("100 Comments",style: Theme.of(context).textTheme.caption,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                      
                        ],
                      ),
               ) ,
               Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                 child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
               ),
              Row(
                  children: [
                     Expanded(
                       child: InkWell(
                        onTap: (){},
                         child: Row(
                                         children: [
                          CircleAvatar(
                            radius:18 ,
                            backgroundImage: NetworkImage("https://img.freepik.com/free-photo/indoor-shot-young-cheerful-dark-haired-woman-keeping-raised-hand-her-chest-laughing-happily-with-closed-eyes-isolated-blue-wall_295783-11258.jpg?t=st=1655833780~exp=1655834380~hmac=24cae6db432387692bc7690c2523b7d9d4aa61c8467b02416e69feb8941daaac&w=740"),
                                           ),
                                           SizedBox(width: 15,),
                            Text("Write a coment ...",
                              style: Theme.of(context).textTheme.caption!.copyWith(height: 1.4),),
                                            
                                        
                                         ],
                                         
                           
                                       ),
                       ),
                     ),
                         InkWell(
                                child: Row(
                                  children: [
                                    Icon(IconBroken.Heart,
                                    size: 16,
                                    color: Colors.red,
                                    ),
                                        SizedBox(width:5),
                                Text("Like",style: Theme.of(context).textTheme.caption,)
                                  ],
                                ),
                              ),
                           
                  ],
                )
                
                ],
              ),
            ),
              
          );
          
          
}