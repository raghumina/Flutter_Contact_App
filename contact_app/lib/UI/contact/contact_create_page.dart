import 'package:contact_app/UI/contact/widget/contact_form.dart';
import 'package:flutter/material.dart';

class ContactCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Create'),
      ),
      body: ContactForm(),
    );
  }
}
