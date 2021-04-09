import 'package:flutter/material.dart';


class MyListTile extends StatelessWidget {
  final Widget myicon;
  final String text;
  final Function onTap;
  const MyListTile({ this.myicon,this.text,@required this.onTap});
   @override
   Widget build(BuildContext context) {
     return InkWell(
       onTap:
         onTap,

       child: ListTile(
         leading: myicon,
         title: Text(text),
       ),
     );
   }
 }
