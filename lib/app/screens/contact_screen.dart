import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../home_page.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: Align(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Discipline is the best tool',
                  ),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText(
                      'Do not test bugs out, design them out'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
