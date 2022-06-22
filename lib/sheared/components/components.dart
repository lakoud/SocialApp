import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/sheared/styles/colors.dart';

Widget defaultButton({
   double? width=double.infinity,
  Color? background =defaultColor,
  double radius=0.0,
 required   validate,
   required String text,
   bool isUpperCase=false,

})=> Container(
                  width: width,
                height: 50,
                  child: MaterialButton(
                    onPressed: ()=>validate(),
                    child: Text(
                      isUpperCase?
                      text.toUpperCase():text,
                    style:const TextStyle (color:Colors.white),
                  
                    ),
                    
                  ),
                  decoration: BoxDecoration(
                  color:background,
                  borderRadius: BorderRadius.circular(radius)
                 ),
               );

Widget defaultTextfield({
  required var myController,
  required final type,
  required String label,
  required String hint,
  required Icon icon,
  required String errorfor,
  required Function onChanged,
  IconData? iconsufix,
  bool abscure=false,
  Function? suffixpressed,
})=>   TextFormField(
                  validator: (String? value)
                  {
                    if (value==null || value.trim().isEmpty){
                        return '$errorfor address non null';
                        
                      }
                      return null;
                    
                  },
                  controller: myController,
                  keyboardType:type,
                  obscureText:abscure,
                  onFieldSubmitted: (value){
                    print(value);
                  },
                  onChanged:onChanged(),
                  decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                  prefixIcon:icon,
                  suffixIcon:iconsufix !=null ?IconButton(
                    onPressed:(){
                    suffixpressed!();
                    },
                   icon:Icon( iconsufix)):null,
                  border: const OutlineInputBorder()
                      
                  ),
                  
                );
Future<bool?> toast({
  required text ,
  required Color color,
})=> Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );