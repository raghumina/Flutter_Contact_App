import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:faker/faker.dart' as faker;

import '../../data/contact.dart';

class ContactsModel extends Model {
  // ignore: prefer_final_fields
  late List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
      name: faker.Person().firstName() + ' ' + faker.Person().lastName(),
      email: faker.Internet().freeEmail(),
      phoneNumber: random.integer(1000000).toString(),
    );
  });

  List<Contact> get contacts => _contacts;

  void changeFavouriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;

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
