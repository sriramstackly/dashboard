import 'package:flutter/material.dart';

class HrmsServicePage extends StatelessWidget {
  const HrmsServicePage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  @override
  Widget build(BuildContext context) {
    final List<_HrmsModule> modules = [
      _HrmsModule(
        icon: Icons.badge_outlined,
        title: 'Employee Management',
        description: 'Manage employee information',
      ),
      _HrmsModule(
        icon: Icons.access_time_outlined,
        title: 'Attendance',
        description: 'Track employee attendance',
      ),
      _HrmsModule(
        icon: Icons.event_available_outlined,
        title: 'Leave Management',
        description: 'Manage employee leaves',
      ),
      _HrmsModule(
        icon: Icons.payments_outlined,
        title: 'Payroll',
        description: 'Manage salary and payroll',
      ),
      _HrmsModule(
        icon: Icons.person_search_outlined,
        title: 'Recruitment',
        description: 'Manage hiring and recruitment',
      ),
      _HrmsModule(
        icon: Icons.trending_up_outlined,
        title: 'Performance',
        description: 'Track employee performance',
      ),
      _HrmsModule(
        icon: Icons.school_outlined,
        title: 'Learning',
        description: 'Manage training and learning',
      ),
      _HrmsModule(
        icon: Icons.groups_outlined,
        title: 'ESS / MSS',
        description: 'Employee and manager self service',
      ),
      _HrmsModule(
        icon: Icons.inventory_2_outlined,
        title: 'Asset Management',
        description: 'Manage employee assets',
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: darkText,
        ),
        title: const Text(
          'HRMS Service',
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.people_alt_outlined,
                      size: 40,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(width: 20),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Human Resource Management System',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Manage employees, attendance, payroll, recruitment and other HR operations.',
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

            const Text(
              'HRMS Modules',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 16),

            // Responsive Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;

                if (constraints.maxWidth >= 1100) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth >= 650) {
                  crossAxisCount = 2;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: modules.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.8,
                  ),
                  itemBuilder: (context, index) {
                    final module = modules[index];

                    return _moduleCard(
                      context,
                      module,
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            // Footer
            const Center(
              child: Text(
                '© 2026 OneCloud | HRMS Service',
                style: TextStyle(
                  color: lightText,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _moduleCard(
    BuildContext context,
    _HrmsModule module,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${module.title} selected'),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                module.icon,
                size: 30,
                color: primaryColor,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    module.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: lightText,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: lightText,
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// HRMS MODULE DATA
// ===============================

class _HrmsModule {
  final IconData icon;
  final String title;
  final String description;

  _HrmsModule({
    required this.icon,
    required this.title,
    required this.description,
  });
}