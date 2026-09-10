import 'package:flutter/material.dart';

class SecurityComplianceServicePage extends StatelessWidget {
  const SecurityComplianceServicePage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  @override
  Widget build(BuildContext context) {
    final modules = [
      _ModuleData(
        Icons.fact_check_outlined,
        'Audit Logs',
        'Track and maintain detailed system and user audit logs',
        const Color(0xFF1677FF),
      ),
      _ModuleData(
        Icons.track_changes_outlined,
        'Activity Tracking',
        'Monitor user activities and system operations',
        const Color(0xFF7C3AED),
      ),
      _ModuleData(
        Icons.assessment_outlined,
        'Compliance Reports',
        'Generate reports for regulatory and compliance requirements',
        const Color(0xFF059669),
      ),
      _ModuleData(
        Icons.storage_outlined,
        'Data Retention',
        'Manage data retention periods and storage policies',
        const Color(0xFFEA580C),
      ),
      _ModuleData(
        Icons.policy_outlined,
        'Policy Management',
        'Create and manage enterprise security and compliance policies',
        const Color(0xFF0891B2),
      ),
      _ModuleData(
        Icons.security_outlined,
        'Threat Detection',
        'Detect and monitor potential security threats',
        const Color(0xFFDB2777),
      ),
      _ModuleData(
        Icons.bug_report_outlined,
        'Vulnerability Management',
        'Identify, assess and manage security vulnerabilities',
        const Color(0xFF2563EB),
      ),
      _ModuleData(
        Icons.vpn_key_outlined,
        'Encryption & Key Management',
        'Manage encryption, security keys and protected data',
        const Color(0xFF9333EA),
      ),
      _ModuleData(
        Icons.warning_amber_outlined,
        'Security Alerts',
        'Monitor and respond to security incidents and alerts',
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
          'Security & Compliance Service',
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
                  'Security & Compliance Management',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage security, compliance, audit activities, threats and data protection.',
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