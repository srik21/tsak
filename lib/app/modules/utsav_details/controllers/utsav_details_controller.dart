import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Needed for IconData
import '../models/utsav_details_model.dart';

class UtsavDetailsController extends GetxController {
  // Observables for state management
  final memberList = <Member>[].obs;
  final scheduleList = <Schedule>[].obs;
  final facilityList = <Facility>[].obs;

  // Convert facility string name to actual IconData
  IconData getFacilityIcon(String iconName) {
    switch (iconName) {
      case 'water':
        return Icons.local_drink_outlined;
      case 'wheelchair_car':
        return Icons.accessible_sharp;
      default:
        return Icons.info_outline;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize dummy data (simulating a network fetch)
    _loadData();
  }

  void _loadData() {
    // Committee/Member Data
    memberList.assignAll([
      Member(role: 'Committee', name: 'Subramanyam Chary'),
      Member(role: 'Volunteer', name: 'Subramanyam Chary'),
      Member(role: 'Member', name: 'Subramanyam Chary'),
      Member(role: 'Volunteer', name: 'Ravi Teja'),
    ]);

    // Schedule Data
    scheduleList.assignAll([
      Schedule(
        date: DateTime.now().add(const Duration(days: 1, hours: 4)),
        title: 'Deep Mahotsav, 2024',
        location: 'Ganga dwar ghat.',
      ),
      Schedule(
        date: DateTime.now().add(const Duration(days: 2, hours: 4)),
        title: 'Deep Mahotsav, 2024',
        location: 'Ganga dwar ghat.',
      ),
      Schedule(
        date: DateTime.now().add(const Duration(days: 3, hours: 4)),
        title: 'Deep Mahotsav, 2024',
        location: 'Dashashwamedh ghat.',
        status: 'Cancelled',
      ),
      Schedule(
        date: DateTime.now(),
        title: 'Deep Mahotsav, 2024',
        location: 'Ganga dwar ghat.',
        status: 'Ongoing Now',
      ),
    ]);

    // Facility Data
    facilityList.assignAll([
      Facility(title: 'Drinking Water', iconName: 'water'),
      Facility(title: 'Wheelchair Accessible Car Park', iconName: 'wheelchair_car'),
      Facility(title: 'Wheelchair Accessible Car Park', iconName: 'wheelchair_car'),
      Facility(title: 'Wheelchair Accessible Car Park', iconName: 'wheelchair_car'),
      Facility(title: 'First Aid', iconName: 'info_outline'),
    ]);
  }

  void onInviteTapped() {
    Get.snackbar(
      'Action',
      'Invite functionality triggered!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}