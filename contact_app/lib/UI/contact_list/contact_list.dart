import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: 30,
        // Runs and Build every single list item
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              faker.person.firstName() + ' ' + faker.person.lastName(),
              style: TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }
}
