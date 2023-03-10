import 'package:contact_app/UI/model/contacts_model.dart';
import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:contact_app/UI/contact/widget/contact_form.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactForm extends StatefulWidget {
  final Contact? editedContact;
  final int? editedContactIndex;

  ContactForm({
    Key? key,
    this.editedContact,
    this.editedContactIndex,
  }) : super(key: key);

  //const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
// Keys allows us to access widgets from a different place in code
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phoneNumber;

  bool get isEditMode => widget.editedContact != null;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          const SizedBox(height: 50),
          _buildContactPicture(),
          const SizedBox(height: 50),

          TextFormField(
            onSaved: (value) => _name = value!,
            validator: _validateName,
            initialValue: widget.editedContact?.name,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            onSaved: (value) => _email = value!,
            validator: _validateEmail,
            initialValue: widget.editedContact?.email,
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            onSaved: (value) => _phoneNumber = value!,
            validator: _validatePhoneNumber,
            initialValue: widget.editedContact?.phoneNumber,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 14),
          // Accessing form through form key
          ElevatedButton(
            onPressed: _onSaveContactButtonPressed,
            //color: Theme.of(context).primaryColor,

            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Save Contact'),
                Icon(
                  Icons.person,
                  size: 18,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
          )
        ],
      ),
    );
  }

// FLUUTER
  Widget _buildContactPicture() {
    final halfScreenDiameter = MediaQuery.of(context).size.width / 2;
    return Hero(
      tag: widget.editedContact.hashCode,
      child: CircleAvatar(
          radius: halfScreenDiameter / 2,
          child: _buildCircleAvatarContant(halfScreenDiameter)),
    );
  }

  StatelessWidget _buildCircleAvatarContant(double halfScreenDiameter) {
    if (isEditMode) {
      return Text(
        widget.editedContact!.name[0],
        style: TextStyle(fontSize: halfScreenDiameter / 2),
      );
    } else {
      return Icon(
        Icons.person,
        size: halfScreenDiameter / 2,
      );
    }
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Enter a name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (value!.isEmpty) {
      return 'Enter E-mail';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid E mail address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    String phoneRegex = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(phoneRegex);

    if (value!.isEmpty) {
      return 'Enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  void _onSaveContactButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final newOrEditedContact = Contact(
        name: _name,
        email: _email,
        phoneNumber: _phoneNumber,
        // elvis operator?. returns null if editedContact is null
        // null coalescing operator (??)
        // if left side is null, it return right side
        isFavourite: widget.editedContact?.isFavourite ?? false,
      );
      if (isEditMode) {
        ScopedModel.of<ContactModel>(context).updateContact(
          newOrEditedContact,
          widget.editedContactIndex!,
        );
      } else {
        ScopedModel.of<ContactModel>(context).addContact(newOrEditedContact);
      }

      Navigator.of(context).pop();
    }
  }
}
