import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'select_free_space.dart';

class SelectableItem {
  final String title;
  bool isSelected;

  SelectableItem(this.title, {this.isSelected = false});
}

class SelectableItemListPage extends StatefulWidget {
  const SelectableItemListPage({Key? key}) : super(key: key);

  @override
  _SelectableItemListPageState createState() => _SelectableItemListPageState();
}

class _SelectableItemListPageState extends State<SelectableItemListPage> {
  List<SelectableItem> items = [];

  @override
  void initState() {
    super.initState();

    List<String> newItems = [
      'Air Freshener',
      'Apple',
      'BBQ Sauce',
      'Baby Wipes',
      'Banana',
      'Bath Towels',
      'Beef',
      'Bread',
      'Broom',
      'Butter',
      'Canned Soup',
      'Carrots',
      'Cereal',
      'Cereal Bars',
      'Cheese',
      'Chicken',
      'Chips',
      'Cleaning Rags',
      'Cleaning Spray',
      'Coffee',
      'Deodorant',
      'Diapers',
      'Dish Soap',
      'Dishware',
      'Dustpan',
      'Eggs',
      'Extension Cords',
      'Feminine Hygiene Products',
      'Garden Hose',
      'Hair Gel',
      'Hand Sanitizer',
      'Honey',
      'Ice Cream',
      'Insect Repellent',
      'Iron',
      'Ironing Board',
      'Jam',
      'Ketchup',
      'Laundry Detergent',
      'Lawn Mower',
      'Light Bulbs',
      'Mayonnaise',
      'Milk',
      'Mop',
      'Mustard',
      'Olive Oil',
      'Onions',
      'Orange',
      'Pancake Mix',
      'Paper Towels',
      'Pasta',
      'Peanut Butter',
      'Pickles',
      'Plant Fertilizer',
      'Potatoes',
      'Power Strips',
      'Razors',
      'Rice',
      'Salmon',
      'Shampoo',
      'Shaving Cream',
      'Shower Gel',
      'Shrimp',
      'Soap',
      'Soda',
      'Spinach',
      'Sponges',
      'Syrup',
      'Tea',
      'Tissues',
      'Toilet Paper',
      'Tomatoes',
      'Toothbrush',
      'Toothpaste',
      'Trash Bags',
      'Trash Cans',
      'Tuna',
      'Vacuum Cleaner',
      'Vinegar',
      'Water',
      'Yogurt'
    ];

    // Converting newItems into SelectableItem objects
    items = newItems.map((itemName) => SelectableItem(itemName)).toList();
  }

  void _fetchData() async {
    // Filter selected items
    List<Map<String, String>> selectedItemsJson = items
        .where((item) => item.isSelected)
        .map((item) => {"item": item.title})
        .toList();


    // Example season
    String season = "Winter"; // Change as needed

    print('Selected Item Names: $selectedItemsJson');

    // Convert selectedItems to JSON
    String body =
        json.encode(selectedItemsJson); // Removed wrapping with {"item": ...}

    print('Selected body: $body');

    // Make the API call with season as a query parameter
    final response = await http
        .post(
          Uri.parse(
              'https://shenuka-fyp-f6da223878dd.herokuapp.com/getItems?season=$season'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        )
        .timeout(const Duration(seconds: 300));

    // Handle response
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> data = json.decode(response.body);
      setState(() {
        // Handle the response data
        // Here you can update your UI or store the data as needed
        print(body);
        print('successfully sent data');
        print('Response :$data');

        // Navigate to FreeSpacePage with response data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FreeSpacePage(data: data),
          ),
        );
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Items',
          style: TextStyle(
            color: Color(0xFF755DC1),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Assuming you have a SearchItemBar widget
            // Replace it with your implementation
            // SearchItemBar(
            //   controller: TextEditingController(),
            //   onSearchChanged: (String value) {
            //     // Handle search functionality here
            //   },
            // ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(items[index].title),
                    value: items[index].isSelected,
                    onChanged: (value) {
                      setState(() {
                        items[index].isSelected = value!;
                      });
                    },
                  );
                },
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.08,
                child: ElevatedButton(
                  onPressed: _fetchData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9F7BFF),
                  ),
                  child: Text(
                    'Select Items',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width * 0.035,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
