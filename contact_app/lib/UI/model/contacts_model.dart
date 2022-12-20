import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';

import 'package:scoped_model/scoped_model.dart';

class ContactModel extends Model {
  final List<Contact> _contacts = List.generate(50, (index) {
    var faker = Faker();

    return Contact(
      name: '${faker.person.firstName()} ${faker.person.lastName()}',
      email: faker.internet.freeEmail(),
      phoneNumber: random.integer(1000000).toString(),
    );
  });

  // get sure we can get contacts from different classes
  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void changeFavoriteStatus(int index) {
    _contacts[index].isFavourite = !_contacts[index].isFavourite;
    sortContacts();
    notifyListeners();
  }

  void sortContacts() {
    _contacts.sort((a, b) {
      int comparisonResult;
      comparisonResult = _compareBasedOnFavouriteStatus(a, b);
// If the favourite status of two contacts is identical.
// secondary, alphabatical sorting kicks in.
      if (comparisonResult == 0) {
        comparisonResult = compareAlphabetically(a, b);
      }

      return comparisonResult;
    });
  }

  int _compareBasedOnFavouriteStatus(Contact a, Contact b) {
    if (a.isFavourite) {
      return -1;
    } else if (b.isFavourite) {
      return 1;
    } else {
      return 0;
    }
  }

  int compareAlphabetically(Contact a, Contact b) {
    return a.name.compareTo(b.name);
  }
}
