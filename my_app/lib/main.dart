import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/second_screen.dart';
import 'screens/select_Item.dart';
import 'screens/select_free_space.dart';
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
      home: MovieTheaterPage(),
      routes: <String, WidgetBuilder>{
        '/second': (context) => const SecondScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => SingUpScreen(),
        '/items': (context) => const ItemSelectorScreen(),
        'free_space': (context) => MovieTheaterPage(),
      },
    );
  }
}
