import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcycle_app/screens/dailyactivity_list/components/body.dart';
import 'package:healthcycle_app/screens/home/home_screen.dart';

class DailyActivtyListScreen extends StatelessWidget {
  const DailyActivtyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Daily Activity List",
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
      backgroundColor: const Color(0xFF39285A),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back_arrow.svg",
            color: Colors.white),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }
}
