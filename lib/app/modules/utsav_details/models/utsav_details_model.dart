class Member {
  final String role;
  final String name;
  Member({required this.role, required this.name});
}

class Schedule {
  final DateTime date;
  final String title;
  final String location;
  final String? status;
  Schedule({
    required this.date,
    required this.title,
    required this.location,
    this.status,
  });
}

class Facility {
  final String title;
  final String iconName; // Using a string name for simplicity
  Facility({required this.title, required this.iconName});
}