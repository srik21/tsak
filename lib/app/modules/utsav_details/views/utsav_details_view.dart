import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/member_card.dart';
import '../../../../widgets/schedule_card.dart';
import '../../../../widgets/facility_grid_item.dart';
import '../controllers/utsav_details_controller.dart';

class UtsavDetailsView extends GetView<UtsavDetailsController> {
  const UtsavDetailsView({super.key});

  // --- Reusable Section Header ---
  Widget _buildSectionHeader({
    required String title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText,
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          if (actionText == null && onActionTap != null)
            Icon(Icons.chevron_right, color: Colors.grey.shade700),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Utsav Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainImage(),
            _buildDetailsHeader(),
            _buildActionButtons(),
            _buildEventStatsAndLocation(),
            _buildDescription(),
            _buildScheduleSection(),
            _buildFacilitiesSection(),
            _buildHostSection(),
            _buildCommitteeSection(),
            _buildDecorativeFooter(),
          ],
        ),
      ),
    );
  }

  // Section 1: Main Image
  Widget _buildMainImage() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        // Placeholder for the main colorful image (Deep Mahotsav)
        image: DecorationImage(
          image: NetworkImage(
              'https://placehold.co/600x200/FF5722/FFFFFF?text=Utsav+Image+Placeholder'),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.all(16),
    );
  }

  // Section 2: Name, Date, Privacy
  Widget _buildDetailsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Utsav Name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined,
                  size: 16, color: Colors.orange),
              const SizedBox(width: 8),
              const Text(
                '3 December 2024 at 4 Pm',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(width: 16),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock, size: 14, color: Colors.green.shade700),
                    const SizedBox(width: 4),
                    Text(
                      'Private',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section 3: Action Buttons
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          // Interested Button
          Expanded(
            flex: 4,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_fire_department,
                    color: Colors.deepOrange),
                label: const Text(
                  'Interested',
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Invite Button
          Expanded(
            flex: 4,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton.icon(
                onPressed: controller.onInviteTapped,
                icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                label: const Text(
                  'Invite',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // More Button
          Expanded(
            flex: 1,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section 4: Stats and Location
  Widget _buildEventStatsAndLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.people_alt_outlined, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              '37 going. 648 interested',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          const Text(
            'Rain Tree, Sankey road',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // Section 5: Description
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 8),
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s',
        style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        textAlign: TextAlign.justify,
      ),
    );
  }

  // Section 6: Schedule (KARYAKRAMAM)
  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(title: 'KARYAKRAMAM'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(
                () => Column(
              children: controller.scheduleList.map((schedule) {
                return ScheduleCard(
                  date: schedule.date,
                  title: schedule.title,
                  location: schedule.location,
                  status: schedule.status,
                );
              }).toList(),
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: TextStyle(
                  color: Colors.orange.shade800, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // Section 7: Facilities (Utsav Facilities)
  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Utsav Facilities',
          onActionTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Obx(
                () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.facilityList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // Adjust ratio for content height
              ),
              itemBuilder: (context, index) {
                final facility = controller.facilityList[index];
                return FacilityGridItem(
                  icon: controller.getFacilityIcon(facility.iconName),
                  title: facility.title,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Section 8: Host
  Widget _buildHostSection() {
    return Column(
      children: [
        _buildSectionHeader(title: 'Hosted By', actionText: 'See all'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Placeholder for Host Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange, width: 2),
                  // Placeholder for the Shri Ram Janmabhoomi logo
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://placehold.co/100x100/F97316/FFFFFF?text=Host+Logo'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                    child: Icon(Icons.account_balance,
                        color: Colors.orange, size: 40)),
              ),
              const SizedBox(height: 10),
              const Text(
                'Shri Ram Janmabhoomi Teerth Kshetra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Follow'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Section 9: Committee (Uses Reusable MemberCard)
  Widget _buildCommitteeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(title: 'Utsav Committee', actionText: 'See all'),
        SizedBox(
          height: 230, // Fixed height for horizontal list
          child: Obx(
                () => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.memberList.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final member = controller.memberList[index];
                return MemberCard(role: member.role, name: member.name);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Section 10: Decorative Footer
  Widget _buildDecorativeFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text block
          const Flexible(
            child: Text(
              'Utsavah Samskritih Jivanam',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF6E6E6E),
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Placeholder for the temple SVG/Image
          Icon(Icons.temple_buddhist, color: Colors.grey.shade400, size: 100),
        ],
      ),
    );
  }
}