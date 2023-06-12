import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpinionController extends GetxController {
  TextEditingController opnion = TextEditingController();
  RxList<bool> filledStars = List.generate(5, (_) => false).obs;

  void toggleStar(int index) {
    filledStars[index] = !filledStars[index];
  }
}
