import 'package:flutter/material.dart';
import 'package:snippet_code/core/constants/colors.dart';

Widget itemList(String title, Widget icon) {
  return Container(
    width: double.maxFinite,
    height: 45,
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      color: Colors.transparent,
      // border: Border.all(color: iconbg, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(child: icon),
        SizedBox(width: 20,),
        Text(title, style: TextStyle(color: iconbg,fontSize: 16,fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
