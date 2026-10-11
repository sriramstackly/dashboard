import 'package:flutter/material.dart';

class FeatureManagementPage extends StatefulWidget {
  const FeatureManagementPage({super.key});

  @override
  State<FeatureManagementPage> createState() =>
      _FeatureManagementPageState();
}

class _FeatureManagementPageState
    extends State<FeatureManagementPage> {
  String selectedModule = 'All Modules';
  String selectedLicense = 'All License Plans';
  String selectedStatus = 'All Status';

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, dynamic>> features = [
    {
      'name': 'User Management',
      'module': 'Identity',
      'license': 'Enterprise',
      'enabled': true,
    },
    {
      'name': 'Workflow Engine',
      'module': 'Workflow',
      'license': 'Enterprise',
      'enabled': true,
    },
    {
      'name': 'AI Assistant',
      'module': 'AI Services',
      'license': 'Premium',
      'enabled': false,
    },
    {
      'name': 'Reports',
      'module': 'Analytics',
      'license': 'Standard',
      'enabled': true,
    },
    {
      'name': 'API Access',
      'module': 'Integration',
      'license': 'Enterprise',
      'enabled': true,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 700;

        return Container(
          color: const Color(0xFFF5F6F8),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              mobile ? 10 : 18,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _buildPageHeader(),

                SizedBox(
                  height: mobile ? 10 : 16,
                ),

                _buildStatistics(mobile),

                SizedBox(
                  height: mobile ? 10 : 16,
                ),

                _buildFeatureContent(mobile),

                const SizedBox(height: 15),

                _buildExportButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // PAGE HEADER
  // ============================================================

  Widget _buildPageHeader() {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: const [
              Text(
                'Platform Administration / Feature Management',
                style: TextStyle(
                  fontSize: 8,
                  color: Color(0xFF7A8490),
                ),
              ),

              SizedBox(height: 3),

              Text(
                'Feature Management',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),

              SizedBox(height: 2),

              Text(
                'Control platform feature availability, configuration, and access across the enterprise.',
                style: TextStyle(
                  fontSize: 8,
                  color: Color(0xFF748094),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE0E5EA),
            ),
            borderRadius:
                BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.refresh,
            size: 14,
            color: Color(0xFF647080),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  Widget _buildStatistics(bool mobile) {
    if (mobile) {
      return Column(
        children: [
          _statCard(
            title: 'Total Features',
            value: '65',
            percentage: '↑ +4.2%',
            subtitle: 'this month',
            icon: Icons.tune,
            iconColor:
                const Color(0xFF263269),
            percentageColor:
                const Color(0xFF14945C),
          ),

          const SizedBox(height: 7),

          _statCard(
            title: 'Enabled',
            value: '52',
            percentage: '↑ +3.6%',
            subtitle: 'this month',
            icon:
                Icons.check_circle_outline,
            iconColor:
                const Color(0xFF159447),
            percentageColor:
                const Color(0xFF14945C),
          ),

          const SizedBox(height: 7),

          _statCard(
            title: 'Disabled',
            value: '13',
            percentage: '↓ -7.1%',
            subtitle: 'this month',
            icon: Icons.error_outline,
            iconColor:
                const Color(0xFFE64646),
            percentageColor:
                const Color(0xFFE64646),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _statCard(
            title: 'Total Features',
            value: '65',
            percentage: '↑ +4.2%',
            subtitle: 'this month',
            icon: Icons.tune,
            iconColor:
                const Color(0xFF263269),
            percentageColor:
                const Color(0xFF14945C),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            title: 'Enabled',
            value: '52',
            percentage: '↑ +3.6%',
            subtitle: 'this month',
            icon:
                Icons.check_circle_outline,
            iconColor:
                const Color(0xFF159447),
            percentageColor:
                const Color(0xFF14945C),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            title: 'Disabled',
            value: '13',
            percentage: '↓ -7.1%',
            subtitle: 'this month',
            icon: Icons.error_outline,
            iconColor:
                const Color(0xFFE64646),
            percentageColor:
                const Color(0xFFE64646),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required String percentage,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color percentageColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFE0E5EA),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight:
                        FontWeight.w600,
                    color:
                        Color(0xFF687386),
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.w700,
                    color:
                        Color(0xFF172033),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      percentage,
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            percentageColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      subtitle,
                      style:
                          const TextStyle(
                        fontSize: 6.5,
                        color:
                            Color(0xFF8A94A3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Icon(
            icon,
            size: 16,
            color: iconColor,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FEATURE CONTENT
  // ============================================================

  Widget _buildFeatureContent(bool mobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFDCE2E8),
        ),
      ),
      child: Column(
        children: [
          _buildSearch(mobile),

          const SizedBox(height: 7),

          if (mobile)
            _buildMobileFeatures()
          else
            _buildDesktopFeatures(),
        ],
      ),
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearch(bool mobile) {
    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(
              color: const Color(0xFFE0E5EA),
            ),
            borderRadius:
                BorderRadius.circular(6),
          ),
          child: TextField(
            controller:
                searchController,
            style: const TextStyle(
              fontSize: 8,
            ),
            decoration:
                const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                size: 13,
                color:
                    Color(0xFF718096),
              ),
              hintText:
                  'Search features...',
              hintStyle: TextStyle(
                fontSize: 8,
                color:
                    Color(0xFF8A94A3),
              ),
              contentPadding:
                  EdgeInsets.symmetric(
                vertical: 8,
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        if (mobile)
          Row(
            children: [
              Expanded(
                child: _filterButton(
                  selectedModule,
                  [
                    'All Modules',
                    'Identity',
                    'Workflow',
                    'Analytics',
                    'Integration',
                  ],
                  (value) {
                    setState(() {
                      selectedModule =
                          value;
                    });
                  },
                ),
              ),

              const SizedBox(width: 4),

              Expanded(
                child: _filterButton(
                  selectedLicense,
                  [
                    'All License Plans',
                    'Enterprise',
                    'Premium',
                    'Standard',
                  ],
                  (value) {
                    setState(() {
                      selectedLicense =
                          value;
                    });
                  },
                ),
              ),

              const SizedBox(width: 4),

              Expanded(
                child: _filterButton(
                  selectedStatus,
                  [
                    'All Status',
                    'Enabled',
                    'Disabled',
                  ],
                  (value) {
                    setState(() {
                      selectedStatus =
                          value;
                    });
                  },
                ),
              ),
            ],
          )
        else
          Row(
            children: [
              _filterButton(
                selectedModule,
                [
                  'All Modules',
                  'Identity',
                  'Workflow',
                  'Analytics',
                  'Integration',
                ],
                (value) {
                  setState(() {
                    selectedModule =
                        value;
                  });
                },
              ),

              const SizedBox(width: 5),

              _filterButton(
                selectedLicense,
                [
                  'All License Plans',
                  'Enterprise',
                  'Premium',
                  'Standard',
                ],
                (value) {
                  setState(() {
                    selectedLicense =
                        value;
                  });
                },
              ),

              const SizedBox(width: 5),

              _filterButton(
                selectedStatus,
                [
                  'All Status',
                  'Enabled',
                  'Disabled',
                ],
                (value) {
                  setState(() {
                    selectedStatus =
                        value;
                  });
                },
              ),

              const Spacer(),

              TextButton(
                onPressed: () {
                  setState(() {
                    selectedModule =
                        'All Modules';
                    selectedLicense =
                        'All License Plans';
                    selectedStatus =
                        'All Status';
                    searchController
                        .clear();
                  });
                },
                child: const Text(
                  'Clear Filters',
                  style: TextStyle(
                    fontSize: 7,
                    color:
                        Color(0xFF293269),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  // ============================================================
  // FILTER
  // ============================================================

  Widget _filterButton(
    String value,
    List<String> items,
    ValueChanged<String> onChanged,
  ) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFDCE2E8),
        ),
        borderRadius:
            BorderRadius.circular(5),
      ),
      child:
          DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          padding:
              const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 11,
            color: Color(0xFF687386),
          ),
          style: const TextStyle(
            fontSize: 7,
            color:
                Color(0xFF202631),
          ),
          items: items.map(
            (item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  overflow:
                      TextOverflow.ellipsis,
                ),
              );
            },
          ).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE FEATURES
  // ============================================================

  Widget _buildMobileFeatures() {
    return Column(
      children: [
        ...features.map(
          (feature) =>
              _mobileFeatureCard(feature),
        ),

        const SizedBox(height: 5),

        _mobilePagination(),
      ],
    );
  }

  // ============================================================
  // MOBILE FEATURE CARD
  // ============================================================

  Widget _mobileFeatureCard(
    Map<String, dynamic> feature,
  ) {
    final bool enabled =
        feature['enabled'] as bool;

    return Container(
      width: double.infinity,
      margin:
          const EdgeInsets.only(
        bottom: 6,
      ),
      padding:
          const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFE1E5EA),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      feature['name'],
                      style:
                          const TextStyle(
                        fontSize: 8,
                        fontWeight:
                            FontWeight.w700,
                        color:
                            Color(0xFF202631),
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      '${feature['module']} · ${feature['license']}',
                      style:
                          const TextStyle(
                        fontSize: 6.5,
                        color:
                            Color(0xFF7A8491),
                      ),
                    ),
                  ],
                ),
              ),

              _statusBadge(enabled),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: _smallAction(
                  Icons.tune,
                  'Configure',
                  () {},
                ),
              ),

              const SizedBox(width: 4),

              Expanded(
                child: _smallAction(
                  Icons.bar_chart_outlined,
                  'Usage',
                  () {},
                ),
              ),

              const SizedBox(width: 4),

              Expanded(
                child: _enableButton(
                  feature,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTION BUTTON
  // ============================================================

  Widget _smallAction(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return SizedBox(
      height: 25,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 9,
        ),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 6.5,
          ),
        ),
        style:
            OutlinedButton.styleFrom(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          foregroundColor:
              const Color(0xFF303946),
          side: const BorderSide(
            color: Color(0xFFD5DCE4),
          ),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ENABLE / DISABLE
  // ============================================================

  Widget _enableButton(
    Map<String, dynamic> feature,
  ) {
    final bool enabled =
        feature['enabled'] as bool;

    return SizedBox(
      height: 25,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            feature['enabled'] =
                !feature['enabled'];
          });
        },
        style:
            OutlinedButton.styleFrom(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          foregroundColor: enabled
              ? const Color(0xFFE64646)
              : const Color(0xFF14945C),
          side: BorderSide(
            color: enabled
                ? const Color(0xFFFF9A9A)
                : const Color(0xFF69C99A),
          ),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(4),
          ),
        ),
        child: Text(
          enabled ? 'Disable' : 'Enable',
          style: const TextStyle(
            fontSize: 6.5,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STATUS
  // ============================================================

  Widget _statusBadge(
    bool enabled,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: enabled
            ? const Color(0xFFE7F8EF)
            : const Color(0xFFFFEAEA),
        borderRadius:
            BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          Container(
            width: 4,
            height: 4,
            decoration:
                BoxDecoration(
              color: enabled
                  ? const Color(
                      0xFF18A957,
                    )
                  : const Color(
                      0xFFE74A4A,
                    ),
              shape:
                  BoxShape.circle,
            ),
          ),

          const SizedBox(width: 3),

          Text(
            enabled
                ? 'Enabled'
                : 'Disabled',
            style: TextStyle(
              fontSize: 6,
              color: enabled
                  ? const Color(
                      0xFF168A4C,
                    )
                  : const Color(
                      0xFFD93F3F,
                    ),
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DESKTOP FEATURES
  // ============================================================

  Widget _buildDesktopFeatures() {
    return Column(
      children: [
        Container(
          height: 35,
          color:
              const Color(0xFF272E68),
          padding:
              const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: const Row(
            children: [
              Expanded(
                flex: 2,
                child: _HeaderText(
                  'FEATURE NAME',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'MODULE',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'LICENSE',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'STATUS',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'CONFIGURE',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'USAGE',
                ),
              ),
              Expanded(
                child: _HeaderText(
                  'ACTION',
                ),
              ),
            ],
          ),
        ),

        ...features.map(
          (feature) =>
              _desktopFeatureRow(
            feature,
          ),
        ),

        _desktopPagination(),
      ],
    );
  }

  Widget _desktopFeatureRow(
    Map<String, dynamic> feature,
  ) {
    final bool enabled =
        feature['enabled'] as bool;

    return Container(
      height: 48,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration:
          const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8EBEF),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              feature['name'],
              style:
                  const TextStyle(
                fontSize: 7.5,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(
              feature['module'],
              style:
                  const TextStyle(
                fontSize: 7,
              ),
            ),
          ),

          Expanded(
            child: Text(
              feature['license'],
              style:
                  const TextStyle(
                fontSize: 7,
              ),
            ),
          ),

          Expanded(
            child:
                _statusBadge(enabled),
          ),

          Expanded(
            child: _smallAction(
              Icons.tune,
              'Configure',
              () {},
            ),
          ),

          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Usage',
                style:
                    TextStyle(
                  fontSize: 7,
                  color:
                      Color(0xFF293269),
                ),
              ),
            ),
          ),

          Expanded(
            child: _enableButton(
              feature,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PAGINATION
  // ============================================================

  Widget _mobilePagination() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        _pageButton('‹'),
        _pageButton(
          '1',
          selected: true,
        ),
        _pageButton('2'),
        _pageButton('3'),
        const Text(
          '...',
          style: TextStyle(
            fontSize: 7,
            color: Color(0xFF687386),
          ),
        ),
        _pageButton('13'),
        _pageButton('›'),
      ],
    );
  }

  Widget _desktopPagination() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end,
        children: [
          const Text(
            'Showing 1-5 of 65 features',
            style: TextStyle(
              fontSize: 7,
              color: Color(0xFF738094),
            ),
          ),

          const SizedBox(width: 12),

          _pageButton('‹'),
          _pageButton(
            '1',
            selected: true,
          ),
          _pageButton('2'),
          _pageButton('3'),
          _pageButton('›'),
        ],
      ),
    );
  }

  Widget _pageButton(
    String text, {
    bool selected = false,
  }) {
    return Container(
      width: 21,
      height: 21,
      margin:
          const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF252D67)
            : Colors.white,
        borderRadius:
            BorderRadius.circular(4),
        border: selected
            ? null
            : Border.all(
                color:
                    const Color(0xFFE0E5EA),
              ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 7,
            color: selected
                ? Colors.white
                : const Color(
                    0xFF374151,
                  ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // EXPORT
  // ============================================================

  Widget _buildExportButton() {
    return SizedBox(
      width: double.infinity,
      height: 32,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            const SnackBar(
              content: Text(
                'Feature report exported',
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.download_outlined,
          size: 12,
        ),
        label: const Text(
          'Export Report',
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
          ),
        ),
        style:
            ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFF1726D8),
          foregroundColor:
              Colors.white,
          elevation: 0,
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

// ================================================================
// DESKTOP HEADER TEXT
// ================================================================

class _HeaderText extends StatelessWidget {
  final String text;

  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 6.5,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.2,
      ),
    );
  }
}