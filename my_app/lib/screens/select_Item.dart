import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemSelectorScreen extends StatefulWidget {
  const ItemSelectorScreen({super.key});

  @override
  State<ItemSelectorScreen> createState() => _ItemSelectorScreenState();
}

class _ItemSelectorScreenState extends State<ItemSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Select Item',
            style: TextStyle(
              color: Color(0xFF755DC1),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Text(
          'Select Item',
          style: TextStyle(fontSize: 25),
        ));
  }
}
