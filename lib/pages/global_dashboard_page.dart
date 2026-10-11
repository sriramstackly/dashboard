import 'package:flutter/material.dart';

class GlobalDashboardPage extends StatelessWidget {
  const GlobalDashboardPage({super.key});

  static const Color primaryBlue = Color(0xFF1769FF);
  static const Color greenColor = Color(0xFF16A36A);
  static const Color amberColor = Color(0xFFB98900);

  // Below this width the page uses the phone layout.
  static const double phoneWidth = 550;

  // Text colors (dark enough to read easily)
  static const Color textStrong = Color(0xFF172033);
  static const Color textMedium = Color(0xFF354258);
  static const Color textSoft = Color(0xFF5F6B80);
  static const Color borderColor = Color(0xFFD5DBE7);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =====================================================
        // HEADER
        // Phone: small path text, title, round refresh icon.
        // Bigger screens: also show the description + Refresh word.
        // =====================================================

        LayoutBuilder(
          builder: (context, constraints) {
            final bool phone = constraints.maxWidth < phoneWidth;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Platform Administration / Global Dashboard',
                        style: TextStyle(
                          fontSize: 11,
                          color: textSoft,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Global Dashboard',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: textStrong,
                        ),
                      ),
                      if (!phone) ...[
                        const SizedBox(height: 5),
                        const Text(
                          'Track performance, engagement, and growth across all your social platforms in one place.',
                          style: TextStyle(
                            fontSize: 12,
                            color: textSoft,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                if (phone)
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: textMedium,
                      side: const BorderSide(color: Color(0xFFC9D0DD)),
                      minimumSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Icon(Icons.refresh, size: 18),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('Refresh'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: textMedium,
                      side: const BorderSide(color: Color(0xFFC9D0DD)),
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
            );
          },
        ),

        const SizedBox(height: 24),

        _sectionTitle('PLATFORM OVERVIEW'),

        const SizedBox(height: 10),

        // =====================================================
        // OVERVIEW CARDS  (4 across on desktop, 2 x 2 on phone)
        // =====================================================

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final bool phone = width < phoneWidth;

            final cards = [
              _statCard(
                title: 'TOTAL TENANTS',
                value: '132',
                change: '↑ 4% this month',
                icon: Icons.people_alt_outlined,
                color: primaryBlue,
                compact: phone,
              ),
              _statCard(
                title: 'TOTAL USERS',
                value: '48,920',
                change: '↑ 15% this month',
                icon: Icons.verified_user_outlined,
                color: primaryBlue,
                compact: phone,
              ),
              _statCard(
                title: 'ACTIVE SUBSCRIPTIONS',
                value: '1,233',
                change: '↑ 10% this month',
                icon: Icons.card_membership_outlined,
                color: primaryBlue,
                compact: phone,
              ),
              _statCard(
                title: 'ACTIVE SESSIONS',
                value: '789',
                change: '↑ 6% this month',
                icon: Icons.trending_up,
                color: primaryBlue,
                compact: phone,
              ),
            ];

            if (width >= 850) {
              return Row(
                children: [
                  for (int i = 0; i < cards.length; i++) ...[
                    Expanded(child: cards[i]),
                    if (i != cards.length - 1) const SizedBox(width: 14),
                  ],
                ],
              );
            }

            // 2 across (tablet and phone).
            // floorToDouble() removes tiny rounding leftovers that
            // can cause "overflowed by 0.xxx pixels".
            final double gap = phone ? 12 : 14;
            final double cardWidth = ((width - gap) / 2).floorToDouble();

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final card in cards)
                  SizedBox(
                    width: cardWidth,
                    child: card,
                  ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        // =====================================================
        // QUICK NAVIGATION  (4 across on desktop, 2 x 2 on phone)
        // =====================================================

        _sectionTitle('QUICK NAVIGATION'),

        const SizedBox(height: 10),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final bool phone = width < phoneWidth;

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
              final double gap = phone ? 12 : 14;
              final double itemWidth = ((width - gap) / 2).floorToDouble();

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final item in items)
                    SizedBox(
                      width: itemWidth,
                      child: _quickCard(
                        item.$1,
                        item.$2,
                        item.$3,
                        compact: phone,
                      ),
                    ),
                ],
              );
            }

            return Row(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  Expanded(
                    child: _quickCard(
                      items[i].$1,
                      items[i].$2,
                      items[i].$3,
                    ),
                  ),
                  if (i != items.length - 1) const SizedBox(width: 14),
                ],
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        // =====================================================
        // HEALTH + SYSTEM HEALTH  (one under the other on phone)
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
        fontSize: 10.5,
        fontWeight: FontWeight.w800,
        color: textSoft,
        letterSpacing: 0.8,
      ),
    );
  }

  // ===========================================================
  // CARD TITLE ROW  (title on the left, extra widget on the right)
  // The title is inside Expanded, so it can never push the row
  // past the card edge.
  // ===========================================================

  Widget _cardHeader(String title, Widget trailing) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: textStrong,
            ),
          ),
        ),
        const SizedBox(width: 8),
        trailing,
      ],
    );
  }

  // ===========================================================
  // STAT CARD
  // compact = true on phones (smaller icon and text so the
  // 2 x 2 grid fits without overflow)
  // ===========================================================

  Widget _statCard({
    required String title,
    required String value,
    required String change,
    required IconData icon,
    required Color color,
    bool compact = false,
  }) {
    final double iconBox = compact ? 26 : 30;

    return Container(
      constraints: BoxConstraints(
        minHeight: compact ? 100 : 105,
      ),
      padding: EdgeInsets.all(compact ? 14 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expanded = long titles wrap instead of overflowing
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: compact ? 9.5 : 10,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF5A6479),
                    letterSpacing: compact ? 0.2 : 0.4,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: iconBox,
                height: iconBox,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: compact ? 14 : 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: compact ? 22 : 23,
              fontWeight: FontWeight.w800,
              color: textStrong,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10.5,
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
  // compact = true on phones: icon on top, then title, then
  // the small line under it (like the reference photo).
  // ===========================================================

  Widget _quickCard(
    String title,
    String subtitle,
    IconData icon, {
    bool compact = false,
  }) {
    final iconBox = Container(
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
    );

    final titleText = Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF202A3A),
      ),
    );

    final subtitleText = Text(
      subtitle,
      maxLines: compact ? 2 : 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 10.5,
        color: textSoft,
      ),
    );

    if (compact) {
      return Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 112),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconBox,
            const SizedBox(height: 12),
            titleText,
            const SizedBox(height: 3),
            subtitleText,
          ],
        ),
      );
    }

    return Container(
      constraints: const BoxConstraints(
        minHeight: 88,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          iconBox,
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleText,
                const SizedBox(height: 3),
                subtitleText,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader(
            'Platform Health Status',
            _smallDropdown('Last 7 Days'),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: textMedium,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 10.5,
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
            backgroundColor: const Color(0xFFE3E8F0),
            valueColor: AlwaysStoppedAnimation<Color>(color),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader(
            'System Health',
            _smallDropdown('Last 7 Days'),
          ),

          const SizedBox(height: 18),

          // Wrap = the three labels move to a new line on narrow
          // screens instead of running off the card.
          Wrap(
            spacing: 14,
            runSpacing: 6,
            children: [
              _legend(
                'Operational',
                const Color(0xFF6D4BC3),
              ),
              _legend(
                'Degraded',
                primaryBlue,
              ),
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

          const SizedBox(height: 8),

          // Dates under the chart (sample dates - replace with real ones)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DateLabel('May 12'),
              _DateLabel('May 14'),
              _DateLabel('May 16'),
              _DateLabel('May 18'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legend(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 8,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            color: textSoft,
          ),
        ),
      ],
    );
  }

  Widget _smallDropdown(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            color: textSoft,
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          size: 15,
          color: textSoft,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader(
            'Security alerts',
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all alerts',
                style: TextStyle(
                  fontSize: 10.5,
                  color: primaryBlue,
                ),
              ),
            ),
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
        color: color.withValues(alpha: 0.06),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202A3A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: textSoft,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              fontSize: 10,
              color: textSoft,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader(
            'Recent activities',
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  fontSize: 10.5,
                  color: primaryBlue,
                ),
              ),
            ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.circle,
              size: 8,
              color: color,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202A3A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: textSoft,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              fontSize: 10,
              color: textSoft,
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
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }
}

// =============================================================
// SMALL DATE TEXT UNDER THE CHART
// =============================================================

class _DateLabel extends StatelessWidget {
  final String text;
  const _DateLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        color: Color(0xFF5F6B80),
      ),
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
      ..color = const Color(0xFFE3E8F0)
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

    // Lines now run across the full width, like the photo.
    final purplePoints = [
      const Offset(0.00, 0.48),
      const Offset(0.17, 0.40),
      const Offset(0.33, 0.43),
      const Offset(0.50, 0.30),
      const Offset(0.67, 0.30),
      const Offset(0.83, 0.37),
      const Offset(1.00, 0.27),
    ];

    final bluePoints = [
      const Offset(0.00, 0.72),
      const Offset(0.17, 0.64),
      const Offset(0.33, 0.62),
      const Offset(0.50, 0.53),
      const Offset(0.67, 0.61),
      const Offset(0.83, 0.64),
      const Offset(1.00, 0.51),
    ];

    final greenPoints = [
      const Offset(0.00, 0.91),
      const Offset(0.17, 0.87),
      const Offset(0.33, 0.87),
      const Offset(0.50, 0.81),
      const Offset(0.67, 0.81),
      const Offset(0.83, 0.81),
      const Offset(1.00, 0.80),
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