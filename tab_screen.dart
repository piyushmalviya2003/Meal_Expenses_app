import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController (length: 2,child : Scaffold(
      appBar: AppBar(title: Text('Meals'),bottom: TabBar(tabs: [Tab(icon: Icon(Icons.category,) text: 'categories',),
      Tab( Icon: (Icon.star,), text: 'favorite',),],),),),
    );
  }
}