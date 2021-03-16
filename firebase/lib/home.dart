import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("TopPost");
  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.docs;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Backend'),
        actions: [
          IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint('search')),
          IconButton(icon: Icon(Icons.add), onPressed: () => debugPrint('add')),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
                accountName: Text('Rohit Surya'),
                accountEmail: Text('rvs@xyz.com')),
            new ListTile(
              title: Text('first page'),
              leading: Icon(
                Icons.cake_rounded,
                color: Colors.amber,
              ),
            ),
            new ListTile(
              title: Text('second page'),
              leading: Icon(
                Icons.account_balance_wallet,
                color: Colors.greenAccent,
              ),
            ),
            new ListTile(
              title: Text('third page'),
              leading: Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.blueAccent,
              ),
            ),
            new Divider(
              height: 10,
              color: Colors.black87,
            ),
            new ListTile(
              title: Text('Close'),
              trailing: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onTap: () => Navigator.of(context).pop(debugPrint('close')),
            )
          ],
        ),
      ),
      body: new ListView(
        children: [
          new Container(
            height: 250,
            child: new ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10.0,
                  child: new Column(
                    children: [
                      new ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
