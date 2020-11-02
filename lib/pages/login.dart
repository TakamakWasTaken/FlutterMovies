import 'package:MagicSystem/pages/movieList.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String login;
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
                padding: new EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          contentPadding: const EdgeInsets.all(20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white30,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white30,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white24,
                        ),
                        controller: loginController,
                        validator: (value) {
                          if (!validateEmail(value)) {
                            return 'Invalid format (dev tip: *.*@*.**)';
                          }
                          login = value;
                          return null;
                        },
                      ),
                      Padding(
                        padding: new EdgeInsets.only(top: 20.0),
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            contentPadding: const EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white30,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white30,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedErrorBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: "Password"),
                        controller: passwordController,
                        validator: (value) {
                          if (value.length < 5) {
                            return 'Wrong Password (dev tip: too short)';
                          }
                          login = value;
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                //return DetailPage(item: selectedItem);
                                return MovieList(title: login);
                              }));
                            }
                          },
                          child: Text('LOGIN'),
                        ),
                      ),
                    ]))));
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
