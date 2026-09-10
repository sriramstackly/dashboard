import 'package:flutter/material.dart';

class DocumentManagementServicePage extends StatelessWidget {
  const DocumentManagementServicePage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF17324D);
  static const Color lightText = Color(0xFF64748B);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  @override
  Widget build(BuildContext context) {
    final List<_DocumentModule> modules = [
      _DocumentModule(
        icon: Icons.folder_outlined,
        title: 'Document Repository',
        description: 'Store and organize documents',
      ),
      _DocumentModule(
        icon: Icons.history_outlined,
        title: 'Versioning',
        description: 'Manage document versions',
      ),
      _DocumentModule(
        icon: Icons.cloud_upload_outlined,
        title: 'File Upload / Download',
        description: 'Upload and download files',
      ),
      _DocumentModule(
        icon: Icons.lock_outline,
        title: 'Access Control',
        description: 'Manage document permissions',
      ),
      _DocumentModule(
        icon: Icons.description_outlined,
        title: 'Document Templates',
        description: 'Create and manage templates',
      ),
      _DocumentModule(
        icon: Icons.label_outline,
        title: 'Tagging & Search',
        description: 'Tag and quickly find documents',
      ),
      _DocumentModule(
        icon: Icons.policy_outlined,
        title: 'Retention Policies',
        description: 'Manage document retention rules',
      ),
      _DocumentModule(
        icon: Icons.fact_check_outlined,
        title: 'Audit Trails',
        description: 'Track document activities',
      ),
      _DocumentModule(
        icon: Icons.document_scanner_outlined,
        title: 'OCR Integration',
        description: 'Extract text from documents',
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
          'Document Management Service',
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
                      Icons.folder_copy_outlined,
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
                          'Document Management',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Store, manage, secure, search and track documents across the organization.',
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
              'Document Management Modules',
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
                '© 2026 OneCloud | Document Management Service',
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
    _DocumentModule module,
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

class _DocumentModule {
  final IconData icon;
  final String title;
  final String description;

  _DocumentModule({
    required this.icon,
    required this.title,
    required this.description,
  });
}