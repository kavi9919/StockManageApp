import 'package:flutter/material.dart';

class Seat {
  final int row;
  final int column;
  bool isAvailable;

  Seat(this.row, this.column, {this.isAvailable = true});
}

class MovieTheaterPage extends StatefulWidget {
  @override
  _MovieTheaterPageState createState() => _MovieTheaterPageState();
}

class _MovieTheaterPageState extends State<MovieTheaterPage> {
  int rows = 0;
  int columns = 0;
  List<List<Seat>> theaterSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Free Seats'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter number of rows and columns:'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Rows'),
                      onChanged: (value) {
                        setState(() {
                          rows = int.tryParse(value) ?? 0;
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
                    const Text('Select free seats:'),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: rows * columns,
                      itemBuilder: (context, index) {
                        final row = index ~/ columns;
                        final column = index % columns;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              theaterSeats[row][column].isAvailable =
                                  !theaterSeats[row][column].isAvailable;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: theaterSeats[row][column].isAvailable
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            alignment: Alignment.center,
                            child: Text('${row + 1}-${column + 1}'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  List<String> selectedSeats = [];
                  for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < columns; j++) {
                      if (!theaterSeats[i][j].isAvailable) {
                        selectedSeats.add('${i + 1}-${j + 1}');
                      }
                    }
                  }
                  print('Selected seats: $selectedSeats');
                },
                child: const Text('Print Selected Seats'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeTheater();
  }

  void initializeTheater() {
    theaterSeats = List.generate(
      rows,
      (row) => List.generate(
        columns,
        (column) => Seat(row, column),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MovieTheaterPage(),
  ));
}
