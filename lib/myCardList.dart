import 'package:flutter/material.dart';
import 'package:ui_task/MyWidgets.dart';

class MyCardList extends StatelessWidget{
  final List<myCard>? items;

  MyCardList({Key? key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items!.length,
      itemBuilder: (context, index) {
        return myCardItem(items![index]);
      },
    );
  }
}