import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:contact_app/UI/contact_list/contact_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScopedModel(
        model: ContactModel(),
        child: MaterialApp(
          title: 'Contacts',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const ContactsListPage(),
        ),
      ),
    );
  }
}
