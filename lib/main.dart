import 'package:app/register.dart';
import 'package:app/user.dart';
import 'package:app/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Users'),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final List<User> users = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToRegistration() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    final newUser = ModalRoute.of(context).settings.arguments;

    if (newUser != null) {
      setState(() {
        widget.users.add(newUser);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          automaticallyImplyLeading: false
      ),
      body: Center(
        child: UsersPage(widget.users)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRegistration,
        tooltip: 'New user',
        child: Icon(Icons.add),
      ),
    );
  }
}
