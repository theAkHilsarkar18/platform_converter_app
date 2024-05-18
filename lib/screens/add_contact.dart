import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_converter_app/model/contact_model.dart';
import 'package:provider/provider.dart';

import '../provider/add_provider.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProviderTrue = Provider.of<AddProvider>(context, listen: true);
    final addProviderFalse = Provider.of<AddProvider>(context, listen: false);

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Add Contact'),
        trailing: CupertinoSwitch(
          onChanged: (value) {
            addProviderFalse.changeTheme(value);
          },
          value: addProviderTrue.isDark,
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.activeBlue,
                          ),
                          child: Icon(
                            CupertinoIcons.camera,
                            color: CupertinoColors.white,
                          ),
                        ),
                        AdaptiveTextField(
                          placeholder: 'Full Name',
                          txtController: txtName,
                          icon: CupertinoIcons.person,
                        ),
                        AdaptiveTextField(
                          placeholder: 'Phone NO.',
                          txtController: txtPhone,
                          icon: CupertinoIcons.phone,
                        ),
                        AdaptiveTextField(
                          placeholder: 'About',
                          txtController: txtAbout,
                          icon: CupertinoIcons.chart_bar,
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              child: Text('Pick Date'),
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => Container(
                                          height: 250,
                                          decoration: BoxDecoration(
                                              color: CupertinoColors.white),
                                          child: CupertinoDatePicker(
                                            onDateTimeChanged: (value) {},
                                          ),
                                        ));
                              },
                            ),
                            CupertinoButton(
                              child: Text('Pick Time'),
                              onPressed: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                        color: CupertinoColors.white),
                                    child: CupertinoTimerPicker(
                                      onTimerDurationChanged: (value) {},
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                    child: Text('Save'),
                    onPressed: () {
                      ContactModel contactModel = ContactModel(
                          phone: txtPhone.text,
                          name: txtName.text,
                          about: txtAbout.text);
                      addProviderFalse.addToList(contactModel);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController txtName = TextEditingController(text: 'Akhil Sarkar');
TextEditingController txtPhone = TextEditingController(text: '9825486060');
TextEditingController txtAbout =
    TextEditingController(text: 'Flutter Developer');

class AdaptiveTextField extends StatelessWidget {
  final TextEditingController txtController;
  final String placeholder;
  final IconData icon;

  const AdaptiveTextField(
      {super.key,
      required this.placeholder,
      required this.txtController,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoTextField(
        controller: txtController,
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        placeholder: placeholder,
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
