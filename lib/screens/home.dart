import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    CollectionReference projects =
        FirebaseFirestore.instance.collection("projects");
    return StreamBuilder<QuerySnapshot>(
        stream: projects.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error.toString()}');
            return Text('Uh oh. Failed to load projects.');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            body: Container(
              child: ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print("card tapped!");
                      },
                      child: ListTile(
                        title: Text(document.data()["title"]),
                        subtitle: Text(document.data()["about"]),
                      ),
                  ));
                }).toList(),
              ),
            ),
          );
        });
    /*
    return Scaffold(
      body: Container(
        child: Center(child: Text("hi")),
      ),
    );
    */
  }
}
