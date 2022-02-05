import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'UserInfo.dart';
import 'HelpScreen.dart';
import 'ListPage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: new Text("Итоговое задание"),
            decoration: new BoxDecoration(
              color: Colors.indigo,
            ),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_outlined),
            title: Text('Список пользователей'),
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ListPage()), (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text('Справка'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выход'),
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: 'Итоговая работа')), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
