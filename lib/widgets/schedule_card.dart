import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  final DateTime date;
  final String title;
  final String location;
  final String? status; // e.g., 'Ongoing Now', 'Cancelled', null

  const ScheduleCard({
    super.key,
    required this.date,
    required this.title,
    required this.location,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color? statusColor;
    Widget? statusWidget;
    String dateText;

    // 1. Determine Date Text
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    final DateFormat formatter = DateFormat('d MMMM yyyy');

    if (date.day == today.day && date.month == today.month && date.year == today.year) {
      dateText = 'Today at ${DateFormat('h:mm a').format(date)}';
    } else if (date.day == tomorrow.day && date.month == tomorrow.month && date.year == tomorrow.year) {
      dateText = 'Tomorrow at ${DateFormat('h:mm a').format(date)}';
    } else {
      dateText = formatter.format(date);
    }

    // 2. Determine Status Widget and Color
    if (status != null) {
      if (status == 'Ongoing Now') {
        statusColor = Colors.orange;
        statusWidget = Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            status!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      } else if (status == 'Cancelled') {
        statusColor = Colors.red.shade800;
        statusWidget = Text(
          status!,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and Date/Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: statusColor ?? Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    dateText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: statusColor ?? Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (statusWidget != null) statusWidget,
                    if (status == null) const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}