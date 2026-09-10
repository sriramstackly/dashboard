import 'package:flutter/material.dart';

class WorkflowAutomationServicePage extends StatelessWidget {
  const WorkflowAutomationServicePage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  @override
  Widget build(BuildContext context) {
    final List<_WorkflowModule> modules = [
      _WorkflowModule(
        icon: Icons.account_tree_outlined,
        title: 'Workflow Builder',
        description: 'Design and configure workflows',
      ),
      _WorkflowModule(
        icon: Icons.approval_outlined,
        title: 'Approvals',
        description: 'Manage approval processes',
      ),
      _WorkflowModule(
        icon: Icons.rule_outlined,
        title: 'Business Rules',
        description: 'Configure business rules',
      ),
      _WorkflowModule(
        icon: Icons.auto_mode_outlined,
        title: 'Process Automation',
        description: 'Automate business processes',
      ),
      _WorkflowModule(
        icon: Icons.task_alt_outlined,
        title: 'Task Management',
        description: 'Create and manage workflow tasks',
      ),
      _WorkflowModule(
        icon: Icons.flash_on_outlined,
        title: 'Triggers',
        description: 'Configure workflow triggers',
      ),
      _WorkflowModule(
        icon: Icons.warning_amber_outlined,
        title: 'SLA & Escalations',
        description: 'Manage SLAs and escalations',
      ),
      _WorkflowModule(
        icon: Icons.monitor_outlined,
        title: 'Process Monitoring',
        description: 'Monitor workflow processes',
      ),
      _WorkflowModule(
        icon: Icons.library_books_outlined,
        title: 'Workflow Templates',
        description: 'Create and manage templates',
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
          'Workflow & Automation Service',
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
                      Icons.account_tree_outlined,
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
                          'Workflow & Automation',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Design, automate, monitor and manage business workflows and processes.',
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
              'Workflow & Automation Modules',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 16),

            // Modules Grid
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
                    return _moduleCard(
                      context,
                      modules[index],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                '© 2026 OneCloud | Workflow & Automation Service',
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
    _WorkflowModule module,
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

class _WorkflowModule {
  final IconData icon;
  final String title;
  final String description;

  _WorkflowModule({
    required this.icon,
    required this.title,
    required this.description,
  });
}