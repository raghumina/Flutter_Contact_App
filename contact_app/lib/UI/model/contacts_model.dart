import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';

import 'package:scoped_model/scoped_model.dart';

class ContactModel extends Model {
  final List<Contact> _contacts = List.generate(50, (index) {
    var faker = Faker();

    return Contact(
      name: faker.person.firstName() + ' ' + faker.person.lastName(),
      email: faker.internet.freeEmail(),
      phoneNumber: random.integer(1000000).toString(),
    );
  });

  // get sure we can get contacts from different classes
  List<Contact> get contacts => _contacts;

  void changeFavoriteStatus(int index) {
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
  }
}
