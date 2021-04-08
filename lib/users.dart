import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:app/user.dart';

class UsersPage extends StatefulWidget {
  final List<User> users;

  UsersPage(this.users);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                final key = '${widget.users[index].name}';
                return Dismissible(
                  key: Key(key),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "User was removed"
                        )
                    ));
                    setState(() {
                      widget.users.removeAt(index);
                    });
                  },
                  background: Container(color: Colors.red),
                  child: Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  widget.users[index].name
                              ),
                              subtitle: Text(
                                  widget.users[index].birthdate
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
        )
      ],
    );
  }
}