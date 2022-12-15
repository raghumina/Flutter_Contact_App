import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(
            'Contact test',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'Contact test',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'Contact test',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'Contact test',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'Contact test',
            style: TextStyle(fontSize: 40),
          )
        ]),
      ),
    );
  }
}
