import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String role;
  final String name;

  const MemberCard({
    super.key,
    required this.role,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the color for the role header
    final Color roleColor = role.toLowerCase() == 'committee'
        ? Colors.orange.shade800
        : role.toLowerCase() == 'volunteer'
        ? Colors.orange.shade800
        : Colors.orange.shade800;

    return Container(
      width: 140, // Fixed width for the cards in a horizontal list
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Role Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: roleColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                role,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          // Content Area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Placeholder for Member Image
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, bottom: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.shade100,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                    // Placeholder for the "Subramanyam Chary" cartoon image
                    image: const DecorationImage(
                      image: AssetImage('assets/placeholder_member.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(child: Icon(Icons.person, color: Colors.orange)),
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  role,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}