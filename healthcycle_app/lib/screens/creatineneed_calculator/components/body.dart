import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CreatineCalculator();
  }
}

class CreatineCalculator extends StatefulWidget {
  const CreatineCalculator({Key? key}) : super(key: key);

  @override
  State<CreatineCalculator> createState() => _CreatineCalculatorState();
}

class _CreatineCalculatorState extends State<CreatineCalculator> {
  int currentindex = 0;
  String result = "";
  double weight = 0;

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
                Text(
                  "   Creatine is a substance that is found naturally in muscle cells. It helps your muscles produce energy during heavy lifting or high-intensity exercise."
                  "Taking creatine as a supplement is very popular among athletes and bodybuilders in order to gain muscle, enhance strength and improve exercise performance.",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: Colors.deepPurpleAccent, letterSpacing: .5),
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
                const SizedBox(
                  height: 8.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        FocusManager.instance.primaryFocus?.unfocus();
                        weight = double.parse(weightController.value.text);
                      });

                      calculateWaterNeeds(weight);
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
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Your Daily Creatine Needs is :",
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
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    result,
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

  void calculateWaterNeeds(double weight) {
    double finalresult = weight / 15.0;

    String waterneed = finalresult.toStringAsFixed(2);
    setState(() {
      result = waterneed + " gr /day";
    });
  }
}
