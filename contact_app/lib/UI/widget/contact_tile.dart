import 'package:contact_app/UI/contact/contact_edit_page.dart';
import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

ContactModel contactModel = ContactModel();

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contactIndex,
  }) : super(key: key);
  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<ContactModel>(context);
    final displayedContact = model.contacts[contactIndex];

// Slidable
    return Slidable(
      endActionPane: ActionPane(motion: const BehindMotion(), children: [
        SlidableAction(
          icon: Icons.delete,
          label: 'Delete',
          backgroundColor: Colors.red,
          onPressed: ((context) => {}),
        )
      ]),
//

      child: ListTile(
        title: Text(displayedContact.name),
        subtitle: Text(displayedContact.email),
        trailing: IconButton(
            icon: Icon(
              displayedContact.isFavourite ? Icons.star : Icons.star_border,
              color: displayedContact.isFavourite
                  ? Colors.amber
                  : Color.fromARGB(255, 255, 68, 68),
            ),
            onPressed: () {
              model.changeFavoriteStatus(contactIndex);
            }),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ContactEditPage(
              editedContact: displayedContact,
              editedContactIndex: contactIndex,
            ),
          ));
        },
      ),
    );
  }
}
