import 'package:flutter/material.dart';

class GlobalDashboardPage extends StatelessWidget {
  const GlobalDashboardPage({super.key});

  static const Color primaryBlue = Color(0xFF1769FF);
  static const Color greenColor = Color(0xFF16A36A);
  static const Color amberColor = Color(0xFFB98900);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =====================================================
        // HEADER
        // =====================================================

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Global Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Track performance, engagement, and growth across all your social platforms in one place.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8791A3),
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
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        _sectionTitle('PLATFORM OVERVIEW'),

        const SizedBox(height: 10),

        // =====================================================
        // OVERVIEW CARDS
        // =====================================================

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final cards = [
              _statCard(
                title: 'TOTAL TENANTS',
                value: '132',
                change: '↑ 4% this month',
                icon: Icons.people_alt_outlined,
                color: primaryBlue,
              ),
              _statCard(
                title: 'TOTAL USERS',
                value: '48,920',
                change: '↑ 15% this month',
                icon: Icons.verified_user_outlined,
                color: primaryBlue,
              ),
              _statCard(
                title: 'ACTIVE SUBSCRIPTIONS',
                value: '1,233',
                change: '↑ 10% this month',
                icon: Icons.card_membership_outlined,
                color: primaryBlue,
              ),
              _statCard(
                title: 'ACTIVE SESSIONS',
                value: '789',
                change: '↑ 6% this month',
                icon: Icons.trending_up,
                color: primaryBlue,
              ),
            ];

            if (width >= 850) {
              return Row(
                children: [
                  for (int i = 0; i < cards.length; i++) ...[
                    Expanded(child: cards[i]),
                    if (i != cards.length - 1)
                      const SizedBox(width: 14),
                  ],
                ],
              );
            }

            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                for (final card in cards)
                  SizedBox(
                    width: (width - 14) / 2,
                    child: card,
                  ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        // =====================================================
        // QUICK NAVIGATION
        // =====================================================

        _sectionTitle('QUICK NAVIGATION'),

        const SizedBox(height: 10),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final itemWidth = (width - 42) / 4;

            final items = [
              (
                'Manage Tenants',
                'Manage accounts & users',
                Icons.people_alt_outlined,
              ),
              (
                'Platform Settings',
                'Global configuration',
                Icons.settings_outlined,
              ),
              (
                'Generate Report',
                'Reports & data usage',
                Icons.description_outlined,
              ),
              (
                'System Monitoring',
                'Track system activities',
                Icons.analytics_outlined,
              ),
            ];

            if (width < 800) {
              return Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  for (final item in items)
                    SizedBox(
                      width: (width - 14) / 2,
                      child: _quickCard(
                        item.$1,
                        item.$2,
                        item.$3,
                      ),
                    ),
                ],
              );
            }

            return Row(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  SizedBox(
                    width: itemWidth,
                    child: _quickCard(
                      items[i].$1,
                      items[i].$2,
                      items[i].$3,
                    ),
                  ),
                  if (i != items.length - 1)
                    const SizedBox(width: 14),
                ],
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        // =====================================================
        // HEALTH + SYSTEM HEALTH
        // =====================================================

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 850) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _platformHealthCard(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _systemHealthCard(),
                  ),
                ],
              );
            }

            return Column(
              children: [
                _platformHealthCard(),
                const SizedBox(height: 16),
                _systemHealthCard(),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        // =====================================================
        // SECURITY + RECENT ACTIVITIES
        // =====================================================

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 850) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _securityAlertsCard(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _recentActivitiesCard(),
                  ),
                ],
              );
            }

            return Column(
              children: [
                _securityAlertsCard(),
                const SizedBox(height: 16),
                _recentActivitiesCard(),
              ],
            );
          },
        ),
      ],
    );
  }

  // ===========================================================
  // SECTION TITLE
  // ===========================================================

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

  // ===========================================================
  // STAT CARD
  // ===========================================================

  Widget _statCard({
    required String title,
    required String value,
    required String change,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 105,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
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
                  color: Color(0xFF7A8499),
                  letterSpacing: 0.4,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172033),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: greenColor,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // QUICK CARD
  // ===========================================================

  Widget _quickCard(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 88,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E9F2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: primaryBlue,
              size: 19,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202A3A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: Color(0xFF8B95A7),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // PLATFORM HEALTH
  // ===========================================================

  Widget _platformHealthCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Platform Health Status',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),
              _smallDropdown('Last 7 Days'),
            ],
          ),
          const SizedBox(height: 18),

          _healthBar(
            'CPU Usage',
            0.37,
            '37%',
            amberColor,
          ),

          const SizedBox(height: 17),

          _healthBar(
            'Memory Utilization',
            0.54,
            '54%',
            greenColor,
          ),

          const SizedBox(height: 17),

          _healthBar(
            'Disk I/O',
            0.32,
            '32%',
            greenColor,
          ),

          const SizedBox(height: 17),

          _healthBar(
            'Network Bandwidth',
            0.78,
            '78%',
            amberColor,
          ),
        ],
      ),
    );
  }

  Widget _healthBar(
    String title,
    double value,
    String percentage,
    Color color,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF465267),
              ),
            ),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 7,
            backgroundColor:
                const Color(0xFFEEF1F6),
            valueColor:
                AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  // ===========================================================
  // SYSTEM HEALTH
  // ===========================================================

  Widget _systemHealthCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'System Health',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),
              _smallDropdown('Last 7 Days'),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              _legend(
                'Operational',
                const Color(0xFF6D4BC3),
              ),
              const SizedBox(width: 14),
              _legend(
                'Degraded',
                primaryBlue,
              ),
              const SizedBox(width: 14),
              _legend(
                'Down',
                greenColor,
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 150,
            child: CustomPaint(
              painter: _SystemHealthPainter(),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(String text, Color color) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 7,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF8B95A7),
          ),
        ),
      ],
    );
  }

  Widget _smallDropdown(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF8B95A7),
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          size: 14,
          color: Color(0xFF8B95A7),
        ),
      ],
    );
  }

  // ===========================================================
  // SECURITY ALERTS
  // ===========================================================

  Widget _securityAlertsCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Security alerts',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View all alerts',
                  style: TextStyle(
                    fontSize: 10,
                    color: primaryBlue,
                  ),
                ),
              ),
            ],
          ),

          _alertItem(
            'High CPU Usage',
            'Production cluster CPU usage is high',
            '1 hour ago',
            amberColor,
          ),

          _alertItem(
            'Storage Threshold',
            'Storage utilization reached 80%',
            '2 hours ago',
            primaryBlue,
          ),

          _alertItem(
            'New Tenant Registration',
            'Tenant registration is pending',
            '2 hours ago',
            amberColor,
          ),
        ],
      ),
    );
  }

  Widget _alertItem(
    String title,
    String subtitle,
    String time,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: color.withOpacity(0.045),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202A3A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: Color(0xFF8B95A7),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 8.5,
              color: Color(0xFF9BA5B7),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // RECENT ACTIVITIES
  // ===========================================================

  Widget _recentActivitiesCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent activities',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 10,
                    color: primaryBlue,
                  ),
                ),
              ),
            ],
          ),

          _activityItem(
            'New Tenant Created',
            'by Admin users',
            '10 min ago',
            amberColor,
          ),

          _activityItem(
            'License Updated',
            'by Admin users',
            '1 hour ago',
            amberColor,
          ),

          _activityItem(
            'User Added',
            'Super admin granted access to monitoring module',
            '2 hours ago',
            primaryBlue,
          ),

          _activityItem(
            'Backup Completed',
            'Daily automated backup completed successfully',
            'Yesterday',
            greenColor,
          ),
        ],
      ),
    );
  }

  Widget _activityItem(
    String title,
    String subtitle,
    String time,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: color,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202A3A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: Color(0xFF8B95A7),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 8.5,
              color: Color(0xFF9BA5B7),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // WHITE CARD
  // ===========================================================

  Widget _whiteCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E9F2),
        ),
      ),
      child: child,
    );
  }
}

// =============================================================
// SIMPLE LINE CHART PAINTER
// =============================================================

class _SystemHealthPainter extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final gridPaint = Paint()
      ..color = const Color(0xFFEFF2F6)
      ..strokeWidth = 1;

    for (int i = 0; i < 5; i++) {
      final y = size.height * i / 4;

      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    final purplePaint = Paint()
      ..color = const Color(0xFF6D4BC3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final bluePaint = Paint()
      ..color = const Color(0xFF1769FF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final greenPaint = Paint()
      ..color = const Color(0xFF16A36A)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final purplePoints = [
      const Offset(0.00, 0.48),
      const Offset(0.14, 0.40),
      const Offset(0.28, 0.43),
      const Offset(0.42, 0.30),
      const Offset(0.56, 0.30),
      const Offset(0.70, 0.37),
      const Offset(0.86, 0.27),
    ];

    final bluePoints = [
      const Offset(0.00, 0.72),
      const Offset(0.14, 0.64),
      const Offset(0.28, 0.62),
      const Offset(0.42, 0.53),
      const Offset(0.56, 0.61),
      const Offset(0.70, 0.64),
      const Offset(0.86, 0.51),
    ];

    final greenPoints = [
      const Offset(0.00, 0.91),
      const Offset(0.14, 0.87),
      const Offset(0.28, 0.87),
      const Offset(0.42, 0.81),
      const Offset(0.56, 0.81),
      const Offset(0.70, 0.81),
      const Offset(0.86, 0.80),
    ];

    _drawLine(
      canvas,
      size,
      purplePoints,
      purplePaint,
    );

    _drawLine(
      canvas,
      size,
      bluePoints,
      bluePaint,
    );

    _drawLine(
      canvas,
      size,
      greenPoints,
      greenPaint,
    );
  }

  void _drawLine(
    Canvas canvas,
    Size size,
    List<Offset> points,
    Paint paint,
  ) {
    final path = Path();

    for (int i = 0; i < points.length; i++) {
      final point = Offset(
        points[i].dx * size.width,
        points[i].dy * size.height,
      );

      if (i == 0) {
        path.moveTo(
          point.dx,
          point.dy,
        );
      } else {
        path.lineTo(
          point.dx,
          point.dy,
        );
      }

      canvas.drawCircle(
        point,
        3,
        Paint()
          ..color = paint.color
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(
    CustomPainter oldDelegate,
  ) {
    return false;
  }
}