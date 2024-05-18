import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/model/contact_model.dart';

class AddProvider extends ChangeNotifier
{
  List<ContactModel> contactList = [];

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


}