import 'package:flutter/material.dart';
import 'package:flutter_animated_fab_menu/app/components/circular_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animated'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              right: 30,
              bottom: 30,
              child: Stack(
                children: [
                  CircularButton(
                      width: 60,
                      heigth: 60,
                      color: Colors.red,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onclick: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
