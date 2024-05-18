import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/add_provider.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final addProviderTrue = Provider.of<AddProvider>(context, listen: true);
    final addProviderFalse = Provider.of<AddProvider>(context, listen: false);

    return CupertinoPageScaffold(child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          leading: const Icon(CupertinoIcons.phone),
          // middle: Text('Contacts'),
          trailing: CupertinoSwitch(
            onChanged: (value) {
              addProviderFalse.changeTheme(value);
            },
            value: addProviderTrue.isDark,
          ),
          largeTitle: const Text('Calls'),
        ),
        SliverFillRemaining(
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoListTile(
                title: Text(addProviderTrue.contactList[index].name),
                subtitle: Text(addProviderTrue.contactList[index].phone),
                trailing: Icon(CupertinoIcons.phone),
              ),
            ),
            itemCount: addProviderTrue.contactList.length,
          ),
        ),
      ],
    ),);
  }
}
