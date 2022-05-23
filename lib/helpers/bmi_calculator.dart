import 'package:bmi/constans/constans.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(bmi) {
    //this.bmi = bmi;
  }
  double calculateBmi() {
    double heightInMeter = height! / 100;

    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightmild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDecripsion() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightmild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;

      case normal:
        desc = "Low Risk (Healty Range)";
        break;
      case overweight:
        desc =
            "Moderate Risk of developing heart disease, High Blood pressure , stroke, diabetes mellitus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "Moderate Risk of developing heart disease, High Blood pressure , stroke, diabetes mellitus";
        break;

      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
