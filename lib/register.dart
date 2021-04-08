import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:app/user.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name, birthdate;

  void add() {
    User newUser = User(name, birthdate);
    Navigator.pushNamed(context, '/', arguments: newUser);
  }

  void cancel() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User'),
      ),
        body: Center(
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name'
                ),
                onChanged:
                    (value) => (name = value),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Birthdate'
                ),
                onChanged:
                    (value) => (birthdate = value),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => add(),
                    child: Text('Confirm'),
                  ),
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () => cancel(),
                  )
                ],
              ),
            ])
        )
    );
  }
}