import 'package:flutter/material.dart';

class NotificationServicePage extends StatelessWidget {
  const NotificationServicePage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  @override
  Widget build(BuildContext context) {
    final modules = [
      _ModuleData(
        Icons.notifications_outlined,
        'In-App Notifications',
        'Manage notifications displayed inside the application',
        const Color(0xFF1677FF),
      ),
      _ModuleData(
        Icons.email_outlined,
        'Email Notifications',
        'Send and manage automated email notifications',
        const Color(0xFF7C3AED),
      ),
      _ModuleData(
        Icons.sms_outlined,
        'SMS Notifications',
        'Send transactional and alert notifications through SMS',
        const Color(0xFF059669),
      ),
      _ModuleData(
        Icons.phone_android_outlined,
        'Push Notifications',
        'Deliver real-time notifications to mobile and web devices',
        const Color(0xFFEA580C),
      ),
      _ModuleData(
        Icons.article_outlined,
        'Templates',
        'Create and manage reusable notification templates',
        const Color(0xFF0891B2),
      ),
      _ModuleData(
        Icons.tune_outlined,
        'Preferences',
        'Manage user notification preferences and channels',
        const Color(0xFFDB2777),
      ),
      _ModuleData(
        Icons.schedule_outlined,
        'Schedules',
        'Schedule notifications for specific dates and times',
        const Color(0xFF2563EB),
      ),
      _ModuleData(
        Icons.track_changes_outlined,
        'Delivery Tracking',
        'Track notification delivery status and engagement',
        const Color(0xFF9333EA),
      ),
      _ModuleData(
        Icons.hub_outlined,
        'Multi-Channel',
        'Manage notifications across multiple communication channels',
        const Color(0xFF16A34A),
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: darkText,
        title: const Text(
          'Notification Service',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: darkText,
          ),
        ),
        iconTheme: const IconThemeData(
          color: darkText,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;

          if (constraints.maxWidth >= 1100) {
            crossAxisCount = 3;
          } else if (constraints.maxWidth >= 700) {
            crossAxisCount = 2;
          } else {
            crossAxisCount = 1;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notification Management',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage notifications, communication channels, templates and delivery tracking.',
                  style: TextStyle(
                    fontSize: 15,
                    color: lightText,
                  ),
                ),
                const SizedBox(height: 28),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: modules.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.55,
                  ),
                  itemBuilder: (context, index) {
                    final module = modules[index];

                    return _moduleCard(
                      context,
                      module,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _moduleCard(
    BuildContext context,
    _ModuleData module,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${module.title} selected',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: module.color.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                module.icon,
                color: module.color,
                size: 27,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    module.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: lightText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ModuleData(
    this.icon,
    this.title,
    this.description,
    this.color,
  );
}