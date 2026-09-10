
import 'package:flutter/material.dart';

class PlatformAdministrationPage extends StatelessWidget {
  const PlatformAdministrationPage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  final List<Map<String, dynamic>> services = const [
    {
      'title': 'Global Settings',
      'icon': Icons.settings_outlined,
      'description':
          'Manage global platform settings and configurations.',
    },
    {
      'title': 'Platform Config',
      'icon': Icons.tune_outlined,
      'description':
          'Configure core platform-level parameters.',
    },
    {
      'title': 'License Mgmt.',
      'icon': Icons.key_outlined,
      'description':
          'Manage platform licenses and subscriptions.',
    },
    {
      'title': 'Feature Mgmt.',
      'icon': Icons.extension_outlined,
      'description':
          'Enable and manage platform features.',
    },
    {
      'title': 'Resource Mgmt.',
      'icon': Icons.storage_outlined,
      'description':
          'Monitor and manage platform resources.',
    },
    {
      'title': 'System Health',
      'icon': Icons.monitor_heart_outlined,
      'description':
          'Monitor system health and operational status.',
    },
    {
      'title': 'Tenant Templates',
      'icon': Icons.domain_outlined,
      'description':
          'Create and manage tenant configuration templates.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ================= APP BAR =================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: darkText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Platform Administration Service',
          style: TextStyle(
            color: darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ================= BODY =================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                ),
              ),

              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,

                    decoration: BoxDecoration(
                      color: primaryColor.withValues(
                        alpha: 0.10,
                      ),
                      borderRadius:
                          BorderRadius.circular(14),
                    ),

                    child: const Icon(
                      Icons.admin_panel_settings_outlined,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Platform Administration',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'Manage global platform configuration, resources, licenses and system health.',
                          style: TextStyle(
                            fontSize: 14,
                            color: lightText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ================= SECTION TITLE =================

            const Text(
              'Administration Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Select a service to manage the platform.',
              style: TextStyle(
                fontSize: 14,
                color: lightText,
              ),
            ),

            const SizedBox(height: 20),

            // ================= SERVICE CARDS =================

            LayoutBuilder(
              builder: (context, constraints) {
                int columns = 1;

                if (constraints.maxWidth >= 1100) {
                  columns = 3;
                } else if (constraints.maxWidth >= 650) {
                  columns = 2;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),

                  itemCount: services.length,

                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.8,
                  ),

                  itemBuilder: (context, index) {
                    final service = services[index];

                    return _ServiceCard(
                      title: service['title'],
                      description: service['description'],
                      icon: service['icon'],

                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              '${service['title']} selected',
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      // ================= FOOTER =================

      bottomNavigationBar: Container(
        height: 42,
        alignment: Alignment.center,
        color: primaryColor,

        child: const Text(
          '© 2026 OneCloud | Platform Administration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ======================================================
// SERVICE CARD
// ======================================================

class _ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF08A9D9);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: const Color(0xFFE2E8F0),
          ),

          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            // ================= ICON =================

            Container(
              width: 50,
              height: 50,

              decoration: BoxDecoration(
                color: primaryColor.withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: primaryColor,
                size: 25,
              ),
            ),

            const SizedBox(width: 16),

            // ================= TEXT =================

            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17324D),
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // ================= ARROW =================

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}

