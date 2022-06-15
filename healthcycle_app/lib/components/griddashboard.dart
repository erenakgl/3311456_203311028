import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcycle_app/screens/basalmetabolicrate_calculator/basalmetabolicratecalculator_screen.dart';
import 'package:healthcycle_app/screens/bmi_calculator/bmicalculator_screen.dart';
import 'package:healthcycle_app/screens/creatineneed_calculator/creatinneedcalculator_screen.dart';
import 'package:healthcycle_app/screens/dailyactivity_list/dailyactivitylist_screen.dart';
import 'package:healthcycle_app/screens/eye_test/eyetest_screen.dart';
import 'package:healthcycle_app/screens/lifetime_calculator/lifetimecalculator_screen.dart';
import 'package:healthcycle_app/screens/waterneed_calculator/waterneedcalculator_screen.dart';
import 'package:healthcycle_app/screens/datareadwrite/datareadwrite_screen.dart';
import 'package:healthcycle_app/screens/localdata_holder/localdataholder_screen.dart';
import 'package:healthcycle_app/screens/web_page/webpage_screen.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "BMI Calculator",
    subtitle: "Every Month",
    event: "2 Times",
    img: "assets/images/bmi.png",
    widget: BmiCalculatorScreen(),
  );

  Items item2 = Items(
    title: "Water Need Calculator",
    subtitle: "Every Month",
    event: "1 Items",
    img: "assets/images/water-bottle.png",
    widget: const WaterNeedCalculatorScreen(),
  );
  Items item3 = Items(
    title: "Daily Activity List",
    subtitle: "Every Dat",
    event: "5 Times",
    img: "assets/images/runner.png",
    widget: const DailyActivtyListScreen(),
  );
  Items item4 = Items(
    title: "Creatine Need Calculator",
    subtitle: "Every Month",
    event: "2 Times",
    img: "assets/images/protein-shake.png",
    widget: CreatineNeedCalculatorScreen(),
  );
  Items item5 = Items(
    title: "Life Time Calculator",
    subtitle: "Every Year",
    event: "1 Times",
    img: "assets/images/skull-and-bones.png",
    widget: const LifeTimeCalculatorScreen(),
  );
  Items item6 = Items(
    title: "More Information",
    subtitle: "Every Month",
    event: "3 Times",
    img: "assets/images/internet.png",
    widget: const WebPageScreen(),
  );
  Items item7 = Items(
    title: "Basal Metabolic Rate Calculator",
    subtitle: "Every Month",
    event: "1 Times",
    img: "assets/images/liver.png",
    widget: BasalMetabolicRateCalculatorScreen(),
  );
  Items item8 = Items(
    title: "Eye test",
    subtitle: "Every Month",
    event: "1 Times",
    img: "assets/images/eye-care.png",
    widget: const EyeTestScreen(),
  );
  Items item9 = Items(
    title: "PDF Saver",
    subtitle: "Every Month",
    event: "1 Times",
    img: "assets/images/eye-care.png",
    widget: DataReadWriteScreen(),
  );
  Items item10 = Items(
    title: "Local Data Saver",
    subtitle: "Every Month",
    event: "1 Times",
    img: "assets/images/eye-care.png",
    widget: LocalDataHolderScreen(),
  );

  GridDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
      item9,
      item10
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(45)),
              child: InkWell(
                focusColor: const Color(0xFFF9F8FD),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => data.widget));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ), // other widget
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Widget widget;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img,
      required this.widget});
}
