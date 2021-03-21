import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sonexai_3it1/NewScreen.dart';

import 'signup.dart';

class Home extends StatelessWidget {
  // Home({this.uid});
  // final String uid;
  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (Route<dynamic> route) => true);
                });
              },
            )
          ],
        ),
      
        body:
         Center(child: Text('Welcome!')),
        drawer: NavigateDrawer(/*uid: this.uid*/));
        
  }
}

class NavigateDrawer extends StatefulWidget {
  // final String uid;
  // NavigateDrawer({Key key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
         
          // UserAccountsDrawerHeader(
          //   // accountEmail: FutureBuilder(
          //   //     future: FirebaseDatabase.instance
          //   //         .reference()
          //   //         .child("Users")
          //   //         .child(widget.uid)
          //   //         .once(),
          //   //     builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          //   //       if (snapshot.hasData) {
          //   //         return Text(snapshot.data.value['email']);
          //   //       } else {
          //   //         return CircularProgressIndicator();
          //   //       }
          //   //     }),
          //   // accountName: FutureBuilder(
          //   //     future: FirebaseDatabase.instance
          //   //         .reference()
          //   //         .child("Users")
          //   //         .child(widget.uid)
          //   //         .once(),
          //   //     builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          //   //       if (snapshot.hasData) {
          //   //         return Text(snapshot.data.value['name']);
          //   //       } else {
          //   //         return CircularProgressIndicator();
          //   //       }
          //   //     }),
          //   decoration: BoxDecoration(
          //     color: Colors.red[200],
          //   ),
          // ),
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45.0,
                          backgroundImage: AssetImage("assets/Khonephapheng.jpg")
                          ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          "Sonexai Keobounphet",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Text(
                          "Sonexaikeobounphet@gmail.com",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              // print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ), ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.place, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Tourist Attractions'),
            onTap: () {
              // print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewScreen()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Settings'),
            onTap: () {
              // print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}