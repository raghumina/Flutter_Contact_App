import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contactIndex,
  }) : super(key: key);
  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
      final displayedContact = model.contacts[contactIndex];
      return ListTile(
        title: Text(displayedContact.name),
        subtitle: Text(displayedContact.email),
        trailing: IconButton(
            icon: Icon(
              displayedContact.isFavourite ? Icons.star : Icons.star_border,
              color: displayedContact.isFavourite
                  ? Colors.amber
                  : Colors.blueAccent,
            ),
            onPressed: () {
              model.changeFavoriteStatus(contactIndex);
            }),
      );
    });
  }
}
