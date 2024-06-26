import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/provider/add_provider.dart';
import 'package:platform_converter_app/screens/add_contact.dart';
import 'package:provider/provider.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProviderTrue = Provider.of<AddProvider>(context, listen: true);
    final addProviderFalse = Provider.of<AddProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: const Icon(CupertinoIcons.person_2),
            // middle: Text('Contacts'),
            trailing: CupertinoSwitch(
              onChanged: (value) {
                addProviderFalse.changeTheme(value);
              },
              value: addProviderTrue.isDark,
            ),
            largeTitle: const Text('Contacts'),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              itemCount: addProviderTrue.contactList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // TODO : key point is here----
                  String name = addProviderTrue.contactList[index].name;
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      log("Index: $index");
                      return CupertinoActionSheet(
                        title: Text(name),
                        // message: Text(addProviderTrue.contactList[index].phone),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              txtEditName = TextEditingController(
                                  text:
                                      addProviderTrue.contactList[index].name);
                              txtEditPhone = TextEditingController(
                                  text:
                                      addProviderTrue.contactList[index].phone);
                              txtEditAbout = TextEditingController(
                                  text:
                                      addProviderTrue.contactList[index].about);

                              Navigator.pop(context);
                              showCupertinoDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('Edit Contacts'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AdaptiveTextField(
                                        placeholder: 'Full Name',
                                        txtController: txtEditName,
                                        icon: CupertinoIcons.person,
                                      ),
                                      AdaptiveTextField(
                                        placeholder: 'Phone NO.',
                                        txtController: txtEditPhone,
                                        icon: CupertinoIcons.phone,
                                      ),
                                      AdaptiveTextField(
                                        placeholder: 'About',
                                        txtController: txtEditAbout,
                                        icon: CupertinoIcons.chart_bar,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    CupertinoButton(
                                        child: const Text('Edit'),
                                        onPressed: () {
                                          addProviderFalse.updateFromList(
                                              txtEditPhone,
                                              txtEditName,
                                              txtEditAbout,
                                              index);
                                          Navigator.of(context).pop();
                                        }),
                                    CupertinoButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              addProviderFalse.removerFromList(index);
                            },
                            child: const Text('Delete'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoListTile(
                    title: Text(addProviderTrue.contactList[index].name ?? ""),
                    subtitle:
                        Text(addProviderTrue.contactList[index].phone ?? ""),
                    additionalInfo: Text(
                      addProviderTrue.contactList[index].about,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextEditingController txtEditName = TextEditingController(text: 'Akhil Sarkar');
TextEditingController txtEditPhone = TextEditingController(text: '9825486060');
TextEditingController txtEditAbout =
    TextEditingController(text: 'Flutter Developer');
