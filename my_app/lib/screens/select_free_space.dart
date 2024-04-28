import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Seat {
  final int row;
  final int column;
  bool isAvailable;

  Seat(this.row, this.column, {this.isAvailable = true});
}

class FreeSpacePage extends StatefulWidget {
  final List data;

  const FreeSpacePage({Key? key, required this.data}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FreeSpacePageState createState() => _FreeSpacePageState();
}

class _FreeSpacePageState extends State<FreeSpacePage> {
  int rows = 0;
  int columns = 0;
  List<List<Seat>> theaterSeats = [];
  List<String> selectedSeats = [];
  bool showSelectedSpaces = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Free Space',
          style: TextStyle(
            color: Color(0xFF755DC1),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Item count: ${widget.data.length}',
                style: TextStyle(
                  color: Color(0xFF755DC1),
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Enter number of rows and columns:',
                style: TextStyle(
                  color: Color(0xFF755DC1),
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Rows'),
                      onChanged: (value) {
                        setState(() {
                          rows = int.tryParse(value) ?? 0;
                          initializeTheater();
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Columns'),
                      onChanged: (value) {
                        setState(() {
                          columns = int.tryParse(value) ?? 0;
                          initializeTheater();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (rows > 0 && columns > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select free spaces:'),
                    SizedBox(
                      height: 300, // Adjust the height of the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: columns,
                        itemBuilder: (context, columnIndex) {
                          return SizedBox(
                            width: 40, // Adjust the width of the seat container
                            child: ListView.builder(
                              itemCount: rows,
                              itemBuilder: (context, rowIndex) {
                                final seat =
                                    theaterSeats[rowIndex][columnIndex];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seat.isAvailable = !seat.isAvailable;
                                      if (!seat.isAvailable) {
                                        selectedSeats.add(
                                            '${rowIndex + 1}-${columnIndex + 1}');
                                      } else {
                                        selectedSeats.remove(
                                            '${rowIndex + 1}-${columnIndex + 1}');
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4.0),
                                    width:
                                        40, // Adjust the width of the seat container
                                    height:
                                        40, // Adjust the height of the seat container
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: Colors.purple.shade400),
                                      color: seat.isAvailable
                                          ? Colors.purple.shade100
                                          : Colors.purple.shade800,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                        '${rowIndex + 1}-${columnIndex + 1}'),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 200, // Adjust the height of the ListView
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: widget.data.length,
                          itemBuilder: (context, index) {
                            final currentItem = widget.data[index];
                            final selectedSeat = selectedSeats.length > index
                                ? selectedSeats[index]
                                : '';

                            return ListTile(
                              title: Text(currentItem.toString()),
                              subtitle: Text('Row - Col: $selectedSeat'),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     print(widget
              //         .data); // Print the data list passed from the previous page
              //   },
              //   child: const Text('Print Selected Spaces'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeTheater() {
    theaterSeats = List.generate(
      rows,
      (row) => List.generate(
        columns,
        (column) => Seat(row, column),
      ),
    );
    selectedSeats.clear();
  }
}
