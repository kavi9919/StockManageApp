import 'package:flutter/material.dart';

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Select Season',
            style: TextStyle(
              color: Color(0xFF755DC1),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                      imagePath: 'assets/winter.png',
                      buttonText: 'Winter',
                      onPressed: () {
                        // onPressed for ImageButton
                        Navigator.of(context).pushNamed('/items');
                      }),
                  ImageButton(
                      imagePath: 'assets/spring.png',
                      buttonText: 'Spring',
                      onPressed: () {
                        // onPressed for ImageButton
                        Navigator.of(context).pushNamed('/items');
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                      imagePath: 'assets/summer.png',
                      buttonText: 'Summer',
                      onPressed: () {
                        // onPressed for ImageButton
                        Navigator.of(context).pushNamed('/items');
                      }),
                  ImageButton(
                      imagePath: 'assets/autumn.png',
                      buttonText: 'Automn',
                      onPressed: () {
                        // onPressed for ImageButton
                        Navigator.of(context).pushNamed('/items');
                      })
                ],
              )
            ],
          ),
        ));
  }
}

class ImageButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const ImageButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.purple),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imagePath),
                Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF755DC1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
