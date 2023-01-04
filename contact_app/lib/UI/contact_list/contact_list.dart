//import 'package:contact_app/UI/contact/widget/contact_form.dart';
import 'package:contact_app/UI/widget/contact_tile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:contact_app/UI/contact/contact_create_page.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  // underscore acts like a private access modifier

// runs when widget is initialized
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      // Scope model descendant runs when notifyListeners() is called from the model
      body: ScopedModelDescendant<ContactModel>(
        builder: ((context, child, model) {
          return ListView.builder(
            itemCount: model.contacts.length,
            // Runs and Build every single list item
            itemBuilder: (context, index) {
              return ContactTile(
                contactIndex: index,
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ContactCreatePage())));
        },
      ),
    );
  }
}
