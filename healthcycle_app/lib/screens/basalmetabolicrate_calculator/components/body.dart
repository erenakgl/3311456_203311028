import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BasalMetabolicRateCalculator(),
    );
  }
}

class BasalMetabolicRateCalculator extends StatefulWidget {
  const BasalMetabolicRateCalculator({Key? key}) : super(key: key);

  @override
  State<BasalMetabolicRateCalculator> createState() =>
      _BasalMetabolicRateCalculatorState();
}

class _BasalMetabolicRateCalculatorState
    extends State<BasalMetabolicRateCalculator> {
  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;
  double age = 0;

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton(("Man"), Colors.blue, 0),
                    radioButton(("Woman"), Colors.pink, 1),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Your Height in cm:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Height in cm",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Your Weight in kg:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Weight in kg",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Your Age:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Age",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        FocusManager.instance.primaryFocus?.unfocus();
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });

                      calculateBmr(height, weight, age);
                    },
                    color: Colors.blue,
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "Your BMR is :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmr(double height, double weight, double age) {
    switch (currentindex) {
      case 0:
        double finalresult =
            66.5 + (13.75 * weight) + (5.03 * height) - (6.75 * age);
        String bmi = finalresult.toStringAsFixed(2);
        setState(() {
          result = bmi;
        });
        break;
      case 1:
        double finalresult =
            655.1 + (6.56 * weight) + (1.85 * height) - (4.68 * age);
        String bmr = finalresult.toStringAsFixed(2);
        setState(() {
          result = bmr;
        });
        break;
    }
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: FlatButton(
        color: currentindex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
