import 'package:flutter/material.dart';

class SearchItemBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSearchChanged;

  const SearchItemBar({
    super.key,
    required this.controller,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
