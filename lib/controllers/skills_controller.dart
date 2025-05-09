import 'package:get/get.dart';

class SkillsController extends GetxController {
  // Example state variable
  var skills = <String>[].obs;

  // Example method to add a skill
  void addSkill(String skill) {
    skills.add(skill);
  }
}
