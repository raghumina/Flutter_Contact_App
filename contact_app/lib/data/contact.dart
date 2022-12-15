import 'package:meta/meta.dart';

class Contact {
  String name;
  String email;
  // String - not all phone numbers are valid numbers
  String phoneNumber;

// Constructor with optional parameters

  Contact({required this.name, required this.email, required this.phoneNumber});
}
