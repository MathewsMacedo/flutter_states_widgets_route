import 'package:flutter/material.dart';

Widget getItemList(Widget? leading, String title, String subtitle){
  leading ??= const Icon(Icons.blur_circular);
    return Card(
      child: ListTile(
        leading: leading,
        title: Text(title),
        subtitle: Text(subtitle),
      )
    );
  }