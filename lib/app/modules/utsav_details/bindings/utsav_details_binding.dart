import 'package:get/get.dart';
import '../controllers/utsav_details_controller.dart';

class UtsavDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtsavDetailsController>(
          () => UtsavDetailsController(),
    );
  }
}