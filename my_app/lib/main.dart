import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/second_screen.dart';
import 'screens/select_free_space.dart';
import 'screens/selectable_items.dart';
import 'screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/second': (context) => const SecondScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => SingUpScreen(),
        '/items': (context) => const SelectableItemListPage(),
        '/free_space': (context) => const FreeSpacePage(),
      },
    );
  }
}
