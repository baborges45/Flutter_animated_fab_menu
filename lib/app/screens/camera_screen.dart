import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_fab_menu/app/home_page.dart';
import 'package:page_transition/page_transition.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  Future<void> hideScreen() async {
    await Future.delayed(Duration(seconds: 5), () async {
      Navigator.push(
        context,
        PageTransition(
          child: HomePage(),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: Duration(milliseconds: 600),
          reverseDuration: Duration(milliseconds: 600),
        ),
      );
    });
  }

  bool hided = false;

  @override
  void didChangeDependencies() {
    if (!hided) {
      hideScreen();
      hided = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20.0, height: 100.0),
            const Text(
              'Flutter',
              style: TextStyle(fontSize: 43.0, color: Colors.white),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'TrajanPro_Bold',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('ANIMATED'),
                  RotateAnimatedText('DIFFERENT'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
