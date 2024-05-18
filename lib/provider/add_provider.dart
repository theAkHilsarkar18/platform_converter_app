import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/model/contact_model.dart';

class AddProvider extends ChangeNotifier
{
  List<ContactModel> contactList = [];
  bool isDark = false;

  void addToList(ContactModel contactModel)
  {
    contactList.add(contactModel);
    notifyListeners();
  }

  void removerFromList(int index)
  {
    contactList.removeAt(index);
    notifyListeners();
  }

  void updateFromList(TextEditingController txtPhone,TextEditingController txtName,TextEditingController txtAbout,int index)
  {
    ContactModel contactModel = ContactModel(phone: txtPhone.text, name: txtName.text, about: txtAbout.text);
    contactList[index] = contactModel;
    notifyListeners();
  }

  void changeTheme(bool value)
  {
    isDark = value;
    notifyListeners();
  }

}