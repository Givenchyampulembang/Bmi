import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double calculateBmi() {
    double heightinMeter = height! / 100;

    final h = (heightinMeter * heightinMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = UnderweightSevere;
    } else if (bmi! < 17) {
      category = UnderweightModerate;
    } else if (bmi! < 18.5) {
      category = UnderweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeskelasI;
    } else if (bmi! < 40) {
      category = obeskelasII;
    } else if (bmi! >= 40) {
      category = obeskelasIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case UnderweightSevere:
      case UnderweightModerate:
      case UnderweightMild:
        desc = " Possible nutritional deficiency and osteoporosis ";
        break;
      case normal:
        desc = " Low risk (healthy range) ";
        break;
      case overweight:
        desc =
            " Modarete risk or developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeskelasI:
      case obeskelasII:
      case obeskelasIII:
        desc =
            " Modarete risk or developing heart disease, high blood pressure, stroke, diabetes mellitus. ";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
