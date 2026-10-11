import 'package:flutter/material.dart';

/// ============================================================
/// PLATFORM HEALTH OVERVIEW PAGE
/// ============================================================
/// IMPORTANT: this page is shown INSIDE the Landing Page, which
/// already has the top bar, sidebar and a scroll view.
/// So this page must NOT use Scaffold / its own header /
/// Expanded / its own SingleChildScrollView.
class PlatformHealthOverviewPage extends StatelessWidget {
  const PlatformHealthOverviewPage({super.key});

  // Colors (same as the Landing Page)
  static const Color primaryBlue = Color(0xFF1769FF);
  static const Color greenColor = Color(0xFF16A36A);
  static const Color amberColor = Color(0xFFF28C00);
  static const Color redColor = Color(0xFFE0443E);
  static const Color titleColor = Color(0xFF172033);
  static const Color textStrong = Color(0xFF202A3A);
  static const Color textMuted = Color(0xFF6B7487);
  static const Color borderColor = Color(0xFFD5DBE7);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 600;
        final bool wide = constraints.maxWidth >= 900;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, mobile),
            const SizedBox(height: 22),

            _sectionLabel('HEALTH SUMMARY'),
            const SizedBox(height: 10),
            _buildHealthCards(constraints.maxWidth),
            const SizedBox(height: 24),

            // Services and incidents side by side on wide screens.
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _servicesBlock()),
                  const SizedBox(width: 16),
                  Expanded(flex: 2, child: _incidentsBlock()),
                ],
              )
            else ...[
              _servicesBlock(),
              const SizedBox(height: 24),
              _incidentsBlock(),
            ],
          ],
        );
      },
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context, bool mobile) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Platform Administration / Platform Health Overview',
          style: TextStyle(fontSize: 11, color: textMuted, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          'Platform Health Overview',
          style: TextStyle(
            fontSize: mobile ? 22 : 24,
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Live status of all monitored platform services',
          style: TextStyle(fontSize: 12.5, color: textMuted),
        ),
      ],
    );

    final refreshButton = OutlinedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Health status refreshed.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      icon: const Icon(Icons.refresh, size: 17),
      label: const Text('Refresh'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF354258),
        side: const BorderSide(color: Color(0xFFC9D0DD)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBlock,
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: refreshButton),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: titleBlock),
        const SizedBox(width: 16),
        refreshButton,
      ],
    );
  }

  // ============================================================
  // HEALTH CARDS
  // ============================================================

  Widget _buildHealthCards(double width) {
    // 4 across on big screens, 2 across on phones / tablets.
    final int columns = width >= 900 ? 4 : 2;
    final double itemWidth = (width - (columns - 1) * 14) / columns;

    final cards = [
      _healthCard(value: '5', label: 'HEALTHY', valueColor: greenColor),
      _healthCard(value: '1', label: 'DEGRADED', valueColor: amberColor),
      _healthCard(value: '0', label: 'FAILED', valueColor: redColor),
      _uptimeCard(),
    ];

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        for (final card in cards) SizedBox(width: itemWidth, child: card),
      ],
    );
  }

  Widget _healthCard({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: Color(0xFF5A6479),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uptimeCard() {
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1769FF), Color(0xFF2E82FF)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '99.98%',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Aggregate uptime (30d)',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MONITORED SERVICES
  // ============================================================

  Widget _servicesBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel('MONITORED SERVICES'),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            children: [
              _serviceItem(
                title: 'Auth Service',
                subtitle: 'JWT issuance · SSO · MFA',
                uptime: '99.99% uptime',
                color: greenColor,
              ),
              _serviceItem(
                title: 'API Gateway',
                subtitle: 'avg. response 118ms',
                uptime: '99.98% uptime',
                color: greenColor,
              ),
              _serviceItem(
                title: 'Database Cluster',
                subtitle: 'elevated replication lag – investigating',
                uptime: '99.91% uptime',
                color: amberColor,
              ),
              _serviceItem(
                title: 'Message Queue',
                subtitle: '0 dead-letter events',
                uptime: '100% uptime',
                color: greenColor,
              ),
              _serviceItem(
                title: 'Object Storage',
                subtitle: 'files & document uploads',
                uptime: '99.99% uptime',
                color: greenColor,
              ),
              _serviceItem(
                title: 'AI Engine',
                subtitle: 'Copilot & automation inference',
                uptime: '99.95% uptime',
                color: greenColor,
                last: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _serviceItem({
    required String title,
    required String subtitle,
    required String uptime,
    required Color color,
    bool last = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE3E8F0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 9,
            height: 9,
            margin: const EdgeInsets.only(top: 4, right: 12),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: textStrong,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            uptime,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textMuted,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVE INCIDENTS
  // ============================================================

  Widget _incidentsBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel('ACTIVE INCIDENTS'),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: amberColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.warning_amber_outlined,
                  size: 15,
                  color: amberColor,
                ),
              ),
              const SizedBox(width: 11),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Database Cluster — elevated replication lag',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: textStrong,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Read replicas are lagging ~2.4s behind primary. No '
                      'tenant-facing errors detected; monitoring for '
                      'further drift.',
                      style: TextStyle(
                        fontSize: 11.5,
                        height: 1.4,
                        color: textMuted,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Started 08:12 UTC · investigating',
                      style: TextStyle(fontSize: 10.5, color: Color(0xFF98A4B5)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SMALL HELPERS
  // ============================================================

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10.5,
        fontWeight: FontWeight.w800,
        color: textMuted,
        letterSpacing: 0.8,
      ),
    );
  }
}