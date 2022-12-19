import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

class ContactModel extends Model {
  List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
      name: faker.Person().firstName() + ' ' + faker.Person().lastName(),
      email: faker.Internet().freeEmail(),
      phoneNumber: faker.RandomGenerator().integer(1000000).toString(),
    );
  });

  // get sure we can get contacts from different classes
  List<Contact> get contacts => _contacts;

  void changeFavoriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
    _contacts.sort(((a, b) {
      
      } if (a.isFavorite){
        return -1;
      } 
    
      
      
      
      );
  }
}
