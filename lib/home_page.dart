import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var result = "";
  String shree = "1234";

  @override
  Widget build(BuildContext context) {
    return Center(
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
          ElevatedButton(
            onPressed: () {
              var userHeight = heightController.text.toString();
              var userWeight = weightController.text.toString();

              if (userHeight.isNotEmpty && userWeight.isNotEmpty) {
                var iWt = int.parse(userWeight);
                var iHt = int.parse(userHeight);

                var toMeter = iHt / 100;

                var bmi = iWt / (toMeter * toMeter);

                setState(() {
                  result = "BMI = $bmi";
                });
              } else {
                setState(() {
                  result = "Please fill all the feilds";
                });
              }
            },
            child: const Text(
              "Calculate",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          )
        ],
      ),
    );
  }
}
