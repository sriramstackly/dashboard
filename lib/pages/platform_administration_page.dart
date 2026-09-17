import 'package:flutter/material.dart';

class PlatformAdministrationPage extends StatelessWidget {
  const PlatformAdministrationPage({super.key});

  static const Color primaryBlue = Color(0xFF1769FF);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ======================================================
        // HEADER
        // ======================================================

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Platform Administration',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF8A93A5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Platform Administration',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                ],
              ),
            ),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.refresh,
                size: 16,
              ),
              label: const Text('Refresh'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF465267),
                side: const BorderSide(
                  color: Color(0xFFE0E4EC),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // ======================================================
        // OVERVIEW CARDS
        // ======================================================

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            int columns = 4;

            if (width < 900) {
              columns = 2;
            }

            if (width < 550) {
              columns = 1;
            }

            final cardWidth =
                (width - ((columns - 1) * 14)) / columns;

            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                SizedBox(
                  width: cardWidth,
                  child: _statCard(
                    title: 'ORGANIZATIONS',
                    value: '1,842',
                    subtitle: '↑ 4.2% this month',
                    icon: Icons.apartment_outlined,
                  ),
                ),

                SizedBox(
                  width: cardWidth,
                  child: _statCard(
                    title: 'TOTAL USERS',
                    value: '96,412',
                    subtitle: '↑ 1.8% this month',
                    icon: Icons.people_outline,
                  ),
                ),

                SizedBox(
                  width: cardWidth,
                  child: _statCard(
                    title: 'LICENSES ACTIVE',
                    value: '2,140',
                    subtitle: '27 expiring < 30 days',
                    icon: Icons.description_outlined,
                  ),
                ),

                SizedBox(
                  width: cardWidth,
                  child: _uptimeCard(),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 28),

        // ======================================================
        // SUPER ADMIN MANAGEMENT
        // ======================================================

        _sectionTitle('SUPER ADMIN MANAGEMENT'),

        const SizedBox(height: 14),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            int columns = 3;

            if (width < 850) {
              columns = 2;
            }

            if (width < 550) {
              columns = 1;
            }

            final cardWidth =
                (width - ((columns - 1) * 18)) / columns;

            final items = [
              _ManagementItem(
                'Super Admin Dashboard',
                'Platform status, KPIs, system health, and recent admin activity at a glance.',
                Icons.grid_view_outlined,
              ),

              _ManagementItem(
                'Global Dashboard',
                'Platform-wide KPIs across every organization, tenants by plan, onboarding trends.',
                Icons.public_outlined,
              ),

              _ManagementItem(
                'Platform Configuration',
                'Platform name, timezone, session limits, upload size, and environment defaults.',
                Icons.settings_outlined,
              ),

              _ManagementItem(
                'Settings',
                'Platform behavior toggles, regional defaults, security policy and notifications.',
                Icons.apps_outlined,
              ),

              _ManagementItem(
                'Platform Branding',
                'Logo, brand colors, login background and custom domain for the platform itself.',
                Icons.palette_outlined,
              ),

              _ManagementItem(
                'Feature Management',
                'Roll features out by plan tier, and track rollout percentage across tenants.',
                Icons.extension_outlined,
              ),

              _ManagementItem(
                'License Management',
                'Seat usage, renewal dates, and license status across every organization.',
                Icons.description_outlined,
              ),

              _ManagementItem(
                'Platform Health Overview',
                'Live status per service — auth, API gateway, database, queues, storage, AI engine.',
                Icons.monitor_heart_outlined,
              ),
            ];

            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                for (final item in items)
                  SizedBox(
                    width: cardWidth,
                    child: _managementCard(item),
                  ),
              ],
            );
          },
        ),

        const SizedBox(height: 30),

        // ======================================================
        // ORGANIZATION
        // ======================================================

        _sectionTitle('ORGANIZATION'),

        const SizedBox(height: 14),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final cardWidth =
                width < 650
                    ? width
                    : (width - 18) / 2;

            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                SizedBox(
                  width: cardWidth,
                  child: _managementCard(
                    const _ManagementItem(
                      'Company Setup',
                      'Business units, departments, branches, and legal entity details.',
                      Icons.business_outlined,
                    ),
                  ),
                ),

                SizedBox(
                  width: cardWidth,
                  child: _managementCard(
                    const _ManagementItem(
                      'User Management',
                      'Invite, deactivate and manage roles for every user across the organization.',
                      Icons.people_alt_outlined,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE5E9F2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF929BAC),
                  letterSpacing: 0.5,
                ),
              ),
              Icon(
                icon,
                size: 17,
                color: primaryBlue,
              ),
            ],
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF16A36A),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PLATFORM UPTIME
  // ============================================================

  Widget _uptimeCard() {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1769FF),
            Color(0xFF1045B8),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PLATFORM UPTIME',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),

              Icon(
                Icons.monitor_heart_outlined,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),

          Spacer(),

          Text(
            '99.98%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),

          SizedBox(height: 4),

          Text(
            'Healthy — all regions',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: Color(0xFF8A93A5),
        letterSpacing: 0.8,
      ),
    );
  }

  // ============================================================
  // MANAGEMENT CARD
  // ============================================================

  Widget _managementCard(
    _ManagementItem item,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 105,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1FF),
                borderRadius:
                    BorderRadius.circular(7),
              ),
              child: Icon(
                item.icon,
                color: primaryBlue,
                size: 17,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              item.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF202A3A),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              item.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10.5,
                height: 1.45,
                color: Color(0xFF8A94A6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DATA CLASS
// ============================================================

class _ManagementItem {
  final String title;
  final String description;
  final IconData icon;

  const _ManagementItem(
    this.title,
    this.description,
    this.icon,
  );
}