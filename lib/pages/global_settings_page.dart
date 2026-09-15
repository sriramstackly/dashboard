import 'package:flutter/material.dart';

class GlobalSettingsPage extends StatelessWidget {
  const GlobalSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F6),

      // ==========================================================
      // HEADER
      // ==========================================================

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF343A43),
          ),
        ),

        title: Row(
          children: [
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                color: const Color(0xFFE3EEFF),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.settings_outlined,
                size: 16,
                color: Color(0xFF1769E8),
              ),
            ),

            const SizedBox(width: 10),

            const Text(
              'Global Settings',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF303743),
              ),
            ),
          ],
        ),
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Global Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF303743),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Manage global platform configuration and settings.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF8A929D),
              ),
            ),

            const SizedBox(height: 20),

            // ======================================================
            // LANGUAGE
            // ======================================================

            _buildSettingCard(
              icon: Icons.language_outlined,
              title: 'Platform Language',
              subtitle: 'Configure the default platform language',
              value: 'English',
            ),

            const SizedBox(height: 12),

            // ======================================================
            // TIME ZONE
            // ======================================================

            _buildSettingCard(
              icon: Icons.access_time_outlined,
              title: 'Time Zone',
              subtitle: 'Configure the default platform time zone',
              value: 'IST',
            ),

            const SizedBox(height: 12),

            // ======================================================
            // DATE FORMAT
            // ======================================================

            _buildSettingCard(
              icon: Icons.calendar_today_outlined,
              title: 'Date Format',
              subtitle: 'Configure the platform date format',
              value: 'DD/MM/YYYY',
            ),

            const SizedBox(height: 12),

            // ======================================================
            // NOTIFICATIONS
            // ======================================================

            _buildSettingCard(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Manage global notification settings',
              value: 'Enabled',
            ),

            const SizedBox(height: 12),

            // ======================================================
            // SECURITY
            // ======================================================

            _buildSettingCard(
              icon: Icons.security_outlined,
              title: 'Security',
              subtitle: 'Manage global security configuration',
              value: 'Active',
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SETTING CARD
  // ============================================================

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFFE1E4E9),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),

      child: Row(
        children: [
          // ======================================================
          // ICON
          // ======================================================

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE3EEFF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1769E8),
            ),
          ),

          const SizedBox(width: 14),

          // ======================================================
          // TEXT
          // ======================================================

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF303743),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A929D),
                  ),
                ),
              ],
            ),
          ),

          // ======================================================
          // VALUE
          // ======================================================

          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF555E6B),
            ),
          ),

          const SizedBox(width: 5),

          const Icon(
            Icons.chevron_right,
            size: 18,
            color: Color(0xFF8A929D),
          ),
        ],
      ),
    );
  }
}
