import 'dart:math';

import 'package:bmi/constans/constans.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int wight = 50;
  int age = 20;

  double calculateBMI() {
    double heightInMeter = height / 100;

    final h = (heightInMeter * heightInMeter);
    final bmi = wight / h;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: BmiCard(
                    Child: GenderIconText(
                      icon: Icons.male,
                      title: 'Laki-Laki',
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    Child: GenderIconText(
                      icon: Icons.female,
                      title: 'Perempuan',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: BmiCard(
                Child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      Child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wight",
                            style: labelTextStyle,
                          ),
                          Text(
                            "$wight",
                            style: numberTextStyle,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  wight += 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 104, 102, 187),
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              SizedBox(width: 10),
                              RawMaterialButton(
                                onPressed: () {
                                  wight -= 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 104, 102, 187),
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BmiCard(
                      Child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: labelTextStyle,
                          ),
                          Text(
                            "$age",
                            style: numberTextStyle,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  age += 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 104, 102, 187),
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              SizedBox(width: 10),
                              RawMaterialButton(
                                onPressed: () {
                                  age -= 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 104, 102, 187),
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(calculateBMI());
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return BmiResultScreen(
                    bmi: calculateBMI(),
                  );
                }),
              );
            },
            child: Container(
              height: 80,
              color: Color(0xffec3c66),
              child: Center(
                child: Text(
                  "Hitung BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.Child,
  }) : super(key: key);

  final Widget? Child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff272a4e),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(15),
        child: Child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
