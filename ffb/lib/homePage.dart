import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('firebase app'),
        backgroundColor: Colors.blue[400],
        actions: [
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint('search')),
          new IconButton(
              icon: new Icon(Icons.add), onPressed: () => debugPrint('added')),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text('rohits account'),
              accountEmail: new Text('rvs@gmail.com'),
              decoration: new BoxDecoration(color: Colors.deepPurpleAccent),
              otherAccountsPictures: [null],
            ),
            new ListTile(
              title: new Text("first page"),
              leading: new Icon(
                Icons.search,
                color: Colors.green,
              ),
            ),
            new ListTile(
              title: new Text("second page"),
              leading: new Icon(
                Icons.add,
                color: Colors.red,
              ),
            ),
            new ListTile(
              title: new Text("third page"),
              leading: new Icon(
                Icons.access_alarm_sharp,
                color: Colors.blueGrey,
              ),
            ),
            new Divider(
              height: 10.0,
              color: Colors.black,
            ),
            new ListTile(
              title: new Text('close'),
              trailing: new Icon(
                Icons.close,
                color: Colors.redAccent,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
