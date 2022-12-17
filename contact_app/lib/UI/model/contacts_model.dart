import 'package:scoped_model/scoped_model.dart';
import 'package:faker/faker.dart' as faker;
import '../../data/contact.dart';

class ContactsModel extends Model {
  late List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
      name: faker.person.firstName() + ' ' + faker.person.lastName(),
      email: faker.internet.freeEmail(),
      phoneNumber: random.integer(1000000).toString(),
    );
  });

  List<Contact> get contacts => _contacts;

  void changeFavouriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
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
