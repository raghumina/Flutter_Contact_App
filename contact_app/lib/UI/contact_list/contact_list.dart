import 'package:contact_app/UI/widget/contact_tile.dart';
import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  // underscore acts like a private access modifier
  late List<Contact> _contacts;

// runs when widget is initialized
  @override
  void initState() {
    super.initState();
    _contacts = List.generate(50, (index) {
      return Contact(
        name: faker.person.firstName() + ' ' + faker.person.lastName(),
        email: faker.internet.freeEmail(),
        phoneNumber: random.integer(1000000).toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
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
