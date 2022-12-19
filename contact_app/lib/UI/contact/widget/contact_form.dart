import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:contact_app/UI/contact/widget/contact_form.dart';

class ContactForm extends StatefulWidget {
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
// Keys allows us to access widgets from a different place in code
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          TextFormField(
            onSaved: (value) => _name = value!,
            validator: _validateName,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onSaved: (value) => _email = value!,
            decoration: InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onSaved: (value) => _phoneNumber = value!,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Accessing form through form key
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
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

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Enter a name';
    }
  }
}
