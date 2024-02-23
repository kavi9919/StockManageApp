import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/widgets/search_bar.dart';

class SelectableItem {
  final String title;
  bool isSelected;

  SelectableItem(this.title, {this.isSelected = false});
}

class SelectableItemListPage extends StatefulWidget {
  const SelectableItemListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableItemListPageState createState() => _SelectableItemListPageState();
}

class _SelectableItemListPageState extends State<SelectableItemListPage> {
  List<SelectableItem> items = List.generate(
    20,
    (index) => SelectableItem('Item ${index + 1}'),
  );

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
            SearchItemBar(
                controller: TextEditingController(),
                onSearchChanged: (String value) {
                  // Handle search functionality here
                }),
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
                //sign in button
                child: ElevatedButton(
                  onPressed: () {
                    //sign in logic
                    Navigator.of(context).pushNamed('/free_space');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9F7BFF),
                  ),
                  child: Text(
                    'Select Items',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          screenSize.width * 0.035, // Responsive font size
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
