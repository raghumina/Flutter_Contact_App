import 'package:contact_app/UI/contact/contact_edit_page.dart';
import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';

//import 'package:flutter_slidable/flutter_slidable.dart';

ContactModel contactModel = ContactModel();

class ContactTile extends StatefulWidget {
  @override
  State<ContactTile> createState() => ContactTileState();

  const ContactTile({
    Key? key,
    required this.contactIndex,
  }) : super(key: key);
  final int contactIndex;
}

class ContactTileState extends State<ContactTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ContactTile(contactIndex: widget.contactIndex);
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<ContactModel>(context);
    final displayedContact = model.contacts[widget.contactIndex];

// Slidable

    return Slidable(
      startActionPane: ActionPane(
        // dismissible: DismissiblePane(onDismissed: () {}),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            icon: Icons.call,
            label: 'Call',
            backgroundColor: Colors.green,
            onPressed: ((context) => _onDismissed()),
          )
        ],
      ),
      //key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
            onPressed: ((context) => {
                  if (displayedContact.isFavourite)
                    {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Alert'),
                          content: const Text('Are you sure want to delete?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                model.deleteContact(widget.contactIndex);
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    }
                  else
                    {
                      model.deleteContact(widget.contactIndex),
                    }
                }),
          ),
          SlidableAction(
            icon: Icons.share,
            label: 'Share',
            backgroundColor: Colors.blue,
            onPressed: ((context) => {}),
          )
        ],
      ),

//
// Favourite Contact
      child: ListTile(
        title: Text(displayedContact.name),
        subtitle: Text(displayedContact.email),
        leading: _buildCircleAvatar(displayedContact),
        trailing: IconButton(
            icon: Icon(
              displayedContact.isFavourite ? Icons.star : Icons.star_border,
              color: displayedContact.isFavourite
                  ? Colors.amber
                  : const Color.fromARGB(255, 255, 68, 68),
            ),
            onPressed: () {
              model.changeFavoriteStatus(widget.contactIndex);
            }),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ContactEditPage(
              editedContact: displayedContact,
              editedContactIndex: widget.contactIndex,
            ),
          ));
        },
      ),
    );
  }

  Hero _buildCircleAvatar(Contact displayedContact) {
    return Hero(
      tag: displayedContact.hashCode,
      child: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(getInitials(
            displayedContact.name.toUpperCase(),
          ))),
    );
  }
}

class _onDismissed {}
