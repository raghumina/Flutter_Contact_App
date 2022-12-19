import 'package:contact_app/UI/widget/contact_tile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:contact_app/UI/model/contacts_model.dart';

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
      body: ListView.builder(
        itemCount: _contacts.length,
        // Runs and Build every single list item
        itemBuilder: (context, index) {
          return ContactTile(
            contact: _contacts[index],
            onFavouritePressed: () {
              setState(() {
                _contacts[index].isFavourite = !_contacts[index].isFavourite;
                _contacts.sort((a, b) {
                  if (a.isFavourite) {
                    return -1;
                  } else if (b.isFavourite) {
                    return 1;
                  } else {
                    return 0;
                  }
                });
              });
            },
          );
        },
      ),
    );
  }
}
