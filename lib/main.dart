import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/provider/add_provider.dart';
import 'package:platform_converter_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddProvider(),
        ),
      ],
      builder: (context, child) => CupertinoApp(
        theme: CupertinoThemeData(
          brightness: (Provider.of<AddProvider>(context,listen: true).isDark)?Brightness.dark:Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
