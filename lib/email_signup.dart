import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  // bool isLoading = false;
  // final _formKey = GlobalKey<FormState>();
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference dbRef =
  //     FirebaseDatabase.instance.reference().child("Users");
  // TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  String _email,_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign Up")),
        body: Form(
            key: _formkey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter User Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter User Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                     onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter an Email Address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  // controller: ageController,
                  decoration: InputDecoration(
                    labelText: "Enter Age",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Age';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  // controller: passwordController,
                  onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password';
                    } else if (value.length < 6) {
                      return 'Password must be atleast 6 characters!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child:  RaisedButton(
                        color: Colors.lightBlue,
                        onPressed:() => _registerFb(_email,_password),
                          // if (_formKey.currentState.validate()) {
                          //   setState(() {
                          //     isLoading = true;
                          //   });
                          //   registerToFb();
                          // }
                        
                        child: Text('Submit'),
                      ),
              )
            ]))));
  }

  // void registerToFb() {
  //   firebaseAuth
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text, password: passwordController.text)
  //       .then((result) {
  //     dbRef.child(result.user.uid).set({
  //       "email": emailController.text,
  //       "age": ageController.text,
  //       "name": nameController.text
  //     }).then((res) {
  //       isLoading = false;
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
  //       );
  //     });
  //   }).catchError((err) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text("Error"),
  //             content: Text(err.message),
  //             actions: [
  //               FlatButton(
  //                 child: Text("Ok"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //   });
  // }
  _registerFb(String _email, String _password) async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
    } on FirebaseAuthException catch (error){
     Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   ageController.dispose();
  // }
}