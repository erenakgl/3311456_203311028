import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:healthcycle_app/screens/home/home_screen.dart';
import 'package:healthcycle_app/screens/login/login.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECEF);
    double blur = isPressed ? 5.0 : 30.0;
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() {
              if (!isPressed) {
                isPressed = true;
                Future.delayed(
                    const Duration(milliseconds: 500),
                    () => {
                          isPressed = false,
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  LoginPage())),
                        });
              }
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: blur,
                      offset: -distance,
                      color: Colors.white,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: const Color(0xFFA7A9AF),
                      inset: isPressed,
                    ),
                  ]),
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Icon(Icons.add_circle_outline,
                    size: 67, color: Colors.purple),
              ),
            ),
          ),
        ));
  }
}
