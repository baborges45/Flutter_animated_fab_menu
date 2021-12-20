import 'package:flutter/material.dart';
import 'package:flutter_animated_fab_menu/app/components/circular_button.dart';
import 'package:flutter_animated_fab_menu/app/screens/add_screen.dart';
import 'package:flutter_animated_fab_menu/app/screens/camera_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController!);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController!);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController!);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    super.initState();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
              right: 30,
              bottom: 30,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  IgnorePointer(
                    child: Container(
                      color: Colors.transparent,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(270),
                        degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.blue,
                        width: 50,
                        heigth: 50,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onclick: () {
                          print('First Button');
                          //Navigator.pushNamed(context, "/add");
                          Navigator.push(
                            context,
                            PageTransition(
                              child: AddScreen(),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(225),
                        degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black,
                        width: 50,
                        heigth: 50,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        onclick: () {
                          print('Second button');
                          Navigator.push(
                            context,
                            PageTransition(
                              child: CameraScreen(),
                              type: PageTransitionType.rotate,
                              alignment: Alignment.center,
                              duration: Duration(milliseconds: 600),
                              reverseDuration: Duration(milliseconds: 600),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(180),
                        degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.orangeAccent,
                        width: 50,
                        heigth: 50,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onclick: () {
                          print('Third Button');
                          Navigator.pushNamed(context, "/contact");
                        },
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.red,
                      width: 60,
                      heigth: 60,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onclick: () {
                        if (animationController!.isCompleted) {
                          animationController!.reverse();
                        } else {
                          animationController!.forward();
                        }
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   ValueNotifier<bool> isDialOpen = ValueNotifier(false);
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (isDialOpen.value) {
//           isDialOpen.value = false;
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         floatingActionButton: SpeedDial(
//           animatedIcon: AnimatedIcons.menu_close,
//           openCloseDial: isDialOpen,
//           backgroundColor: Colors.redAccent,
//           overlayColor: Colors.grey,
//           overlayOpacity: 0.5,
//           spacing: 15,
//           spaceBetweenChildren: 15,
//           closeManually: true,
//           children: [
//             SpeedDialChild(
//                 child: Icon(Icons.share_rounded),
//                 label: 'Share',
//                 backgroundColor: Colors.blue,
//                 onTap: () {
//                   print('Share Tapped');
//                 }),
//             SpeedDialChild(
//                 child: Icon(Icons.mail),
//                 label: 'Mail',
//                 onTap: () {
//                   print('Mail Tapped');
//                 }),
//             SpeedDialChild(
//               child: Icon(Icons.copy),
//               label: 'Anamnese',
//               onTap: () {
//                 print('Copy Tapped');
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     child: AddScreen(),
//                     type: PageTransitionType.size,
//                     alignment: Alignment.center,
//                     duration: Duration(milliseconds: 600),
//                     reverseDuration: Duration(milliseconds: 600),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           child: const Text(
//             "FAB Menu Example",
//             style: TextStyle(fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }
