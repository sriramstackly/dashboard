import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'global_settings_page.dart';

class PlatformAdministrationPage extends StatelessWidget {
  const PlatformAdministrationPage({super.key});

  // ============================================================
  // COLORS
  // ============================================================

  static const Color pageBackground = Color(0xFFF2F3F6);
  static const Color headerBackground = Color(0xFFF7F8FA);

  static const Color bannerBlue = Color(0xFF1769E8);
  static const Color bannerLightBlue = Color(0xFF5BB9E7);

  static const Color darkText = Color(0xFF303743);
  static const Color normalText = Color(0xFF555E6B);
  static const Color lightText = Color(0xFF8A929D);

  static const Color cardColor = Colors.white;
  static const Color cardBorder = Color(0xFFE1E4E9);

  static const Color checkBackground = Color(0xFFE1E5EA);
  static const Color checkColor = Color(0xFF4A535F);

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  18,
                  8,
                  18,
                  30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroBanner(),

                    const SizedBox(height: 20),

                    const Text(
                      'Available Modules',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),

                    const SizedBox(height: 13),

                    _buildModuleGrid(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TOP HEADER
  // ============================================================

  Widget _buildTopHeader(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      color: headerBackground,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // BACK BUTTON
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: Color(0xFF343A43),
              ),
            ),
          ),

          const SizedBox(width: 20),

          // SETTINGS ICON
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
              color: bannerBlue,
            ),
          ),

          const SizedBox(width: 10),

          // TITLE
          const Expanded(
            child: Text(
              'Platform Administration Service',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HERO BANNER
  // ============================================================

  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      height: 112,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            bannerBlue,
            bannerLightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        children: [
          // CLOUD ICON
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.cloud_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),

          const SizedBox(width: 16),

          // TEXT
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Platform Administration Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Domain microservice workspace',
                  style: TextStyle(
                    color: Color(0xFFDCEEFF),
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MODULE GRID
  // ============================================================

  Widget _buildModuleGrid(BuildContext context) {
    final List<String> modules = [
      'Global Settings',
      'Platform Config',
      'License Mgmt.',
      'Feature Mgmt.',
      'Resource Mgmt.',
      'System Health',
      'Tenant Templates',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 3;

        if (constraints.maxWidth < 700) {
          columns = 2;
        }

        if (constraints.maxWidth < 450) {
          columns = 1;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: modules.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 14,
            mainAxisSpacing: 11,
            mainAxisExtent: 48,
          ),
          itemBuilder: (context, index) {
            return _buildModuleCard(
              context,
              modules[index],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // MODULE CARD
  // ============================================================

  Widget _buildModuleCard(
    BuildContext context,
    String title,
  ) {
    final bool isGlobalSettings = title == 'Global Settings';

    return InkWell(
      onTap: () {
        if (isGlobalSettings) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GlobalSettingsPage(),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(9),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: cardBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.018),
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            // CHECK CIRCLE
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                color: checkBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 11,
                color: checkColor,
              ),
            ),

            const SizedBox(width: 10),

            // MODULE NAME
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: normalText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // ARROW
            if (isGlobalSettings)
              const Icon(
                Icons.chevron_right,
                size: 17,
                color: lightText,
              ),
          ],
        ),
      ),
    );
  }
}
