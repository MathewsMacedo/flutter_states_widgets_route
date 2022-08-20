import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';
import 'package:flutter_states_widgets_routes/screens/AddLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'customs/itemList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const MyHomePage(),
        "/add": (context) => AddLanguage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Language> languages = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose languages"),
        actions: [
          IconButton(
            onPressed: _goToNewLanguage, 
            icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children:[
          Wrap(
            spacing: 10,
            children: buildChoices()
          ),
          Expanded(child: ListView(children: buildListItens()))
        ]
      ), 
    );
  }

  void _goToNewLanguage(){
    Future future = Navigator.pushNamed(context, "add");
    future.then((value) => {
      setState((){
       languages.add(value);
      })
    });
  }

  List<Widget> buildChoices(){
    return languages
    .map((e) => ChoiceChip(
      label:  Text(e.title), 
      selected: e.selected,
      onSelected: (value){
        setState(() {
          e.selected = value;
        });
      },
      )).toList();
  }

  List<Widget> buildListItens(){
    return languages
    .where((e) => e.selected)
    .map((e) => getItemList(e.icon!, e.title, e.subtitle)).toList();
    
    
  }


}
