import 'package:get/get.dart';
import 'package:DeveloperFolio/controllers/skills_controller.dart';

class SkillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillsController>(() => SkillsController());
  }
}
