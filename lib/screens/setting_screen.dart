import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/add_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProviderTrue = Provider.of<AddProvider>(context, listen: true);
    final addProviderFalse = Provider.of<AddProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: const Icon(CupertinoIcons.settings),
            // middle: Text('Contacts'),
            trailing: CupertinoSwitch(
              onChanged: (value) {
                addProviderFalse.changeTheme(value);
              },
              value: addProviderTrue.isDark,
            ),
            largeTitle: const Text('Settings'),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoListTile(
                    title: const Text('Profile'),
                    subtitle: const Text('Update Profile Data'),
                    leading: Icon(CupertinoIcons.person),
                    trailing: CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoListTile(
                    title: const Text('Theme'),
                    subtitle: const Text('Change Theme'),
                    leading: const Icon(CupertinoIcons.person),
                    trailing: CupertinoSwitch(
                      onChanged: (value) {
                        addProviderFalse.changeTheme(value);
                      },
                      value: addProviderTrue.isDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
