import 'package:flutter/material.dart';

import '../../data/contact.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contact,
    required this.onFavouritePressed,
  }) : super(key: key);
  final Contact contact;
  final void Function() onFavouritePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.email),
      trailing: IconButton(
        icon: Icon(
          contact.isFavourite ? Icons.star : Icons.star_border,
          color: contact.isFavourite ? Colors.amber : Colors.blueAccent,
        ),
        onPressed: onFavouritePressed,
      ),
    );
  }
}
