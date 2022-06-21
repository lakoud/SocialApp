import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          margin: EdgeInsets.all(8),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image(
                image: NetworkImage("https://img.freepik.com/free-photo/satisfied-student-posing-against-pink-wall_273609-20219.jpg?t=st=1655665107~exp=1655665707~hmac=2aa4cfa322c28d5f0da03f0e3ae290feefe4dc88409f63a422211cd30557347f&w=740")
                ,fit: BoxFit.cover,
                height: 150.0,
                width:double.infinity ,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Comnicate with friendsm',
                style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
            
        )
      ],
    );
  }
}