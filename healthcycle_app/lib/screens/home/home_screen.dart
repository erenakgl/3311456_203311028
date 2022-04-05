import 'package:flutter/material.dart';
import 'package:healthcycle_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Health Cycle",
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: const Color(0xFF39285A),
      leading: IconButton(
        icon: Image.asset(
          "assets/images/health.png",
          width: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
