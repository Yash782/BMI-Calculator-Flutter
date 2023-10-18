import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var ageController = TextEditingController();
  var result = "";
  var comment = '';
  var tempResult = '';

  void calculateBmi(userWeight, userHeight) {
    var iWt = int.parse(userWeight);
    var iHt = int.parse(userHeight);

    var toMeter = iHt / 100;

    var bmi = iWt / (toMeter * toMeter);

    setState(() {
      tempResult = bmi.toString();
      result = "BMI = $tempResult";

      if (bmi > 25) {
        comment = "Over weight";
      } else if (bmi < 18) {
        comment = "Under weight";
      } else {
        comment = "Great Shape";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(),
                  labelText: "Height",
                  suffixText: "Cm"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: weightController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(),
                  labelText: "Weight",
                  suffixText: "Kg"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: ageController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(),
                labelText: "Age",
                suffixText: "Yrs",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  var userHeight = heightController.text.toString();
                  var userWeight = weightController.text.toString();
                  var userAge = ageController.text.toString();

                  if (userHeight.isNotEmpty &&
                      userWeight.isNotEmpty &&
                      userAge.isNotEmpty) {
                    calculateBmi(userWeight, userHeight);
                  } else {
                    setState(() {
                      result = "Please fill all the feilds";
                    });
                  }
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result.substring(0, 11),
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Text(comment,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
