import 'package:flutter/material.dart';
import 'gt_instock_page.dart';
import 'platform_administration_page.dart';
import 'hrms_service_page.dart';
import 'crm_service_page.dart';
import 'erp_service_page.dart';
import 'finance_accounting_service_page.dart';
import 'workflow_automation_service_page.dart';
import 'document_management_service_page.dart';
import 'subscription_service_page.dart';
import 'revenue_service_page.dart';
import 'reporting_bi_service_page.dart';
import 'enterprise_ai_service_page.dart';
import 'notification_service_page.dart';
import 'calendar_services_page.dart';
import 'integration_service_page.dart';
import 'search_service_page.dart';
import 'security_compliance_service_page.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  // ================================================================
  // COLORS
  // ================================================================

  static const Color primary = Color(0xFF08A9D9);
  static const Color primaryDark = Color(0xFF078DB5);

  static const Color darkText = Color(0xFF17324D);
  static const Color bodyText = Color(0xFF64748B);
  static const Color mutedText = Color(0xFF94A3B8);

  static const Color background = Color(0xFFF6F9FC);
  static const Color cardBorder = Color(0xFFE4EDF3);

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ========================================================
            // LEFT SIDEBAR
            // ========================================================

            SizedBox(
              width: 280,
              child: _buildSidebar(context),
            ),

            // ========================================================
            // RIGHT CONTENT
            // ========================================================

            Expanded(
              child: Column(
                children: [
                  _buildTopBar(context),

                  Expanded(
                    child: _buildPageContent(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // TOP BAR
  // ================================================================

  static Widget _buildTopBar(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5EAF0),
          ),
        ),
      ),
      child: Row(
        children: [
          // SEARCH
          Expanded(
            child: Container(
              height: 42,
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: const Color(0xFFEEF1F5),
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 14),

                  Icon(
                    Icons.search_rounded,
                    color: Color(0xFF718096),
                    size: 21,
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      'Search employees, customers, documents...',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF7A8797),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // NOTIFICATION
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {
              _showMessage(
                context,
                'No new notifications',
              );
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: darkText,
              size: 23,
            ),
          ),

          const SizedBox(width: 7),

          // AI ICON
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF7FC),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFCDEBF3),
              ),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: primary,
              size: 18,
            ),
          ),

          const SizedBox(width: 12),

          // PROFILE
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF1976D2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'S',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(width: 9),

          const Text(
            'Sriram',
            style: TextStyle(
              color: darkText,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(width: 3),

          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF718096),
            size: 20,
          ),
        ],
      ),
    );
  }

  // ================================================================
  // SIDEBAR
  // ================================================================

  static Widget _buildSidebar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Color(0xFFE2E8F0),
          ),
        ),
      ),
      child: Column(
        children: [
          // ==========================================================
          // LOGO
          // ==========================================================

          Container(
            height: 86,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE5EAF0),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFE8F8FC),
                        Color(0xFFDDF5FB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.cloud_rounded,
                    color: Color(0xFF159BD3),
                    size: 28,
                  ),
                ),

                const SizedBox(width: 11),

                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OneCloud',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      'Enterprise Platform',
                      style: TextStyle(
                        color: mutedText,
                        fontSize: 9.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ==========================================================
          // SIDEBAR SERVICES
          // ==========================================================

          Expanded(
            child: ScrollConfiguration(
              behavior: const _NoScrollbarBehavior(),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  14,
                  10,
                  14,
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      12,
                      4,
                      12,
                      10,
                    ),
                    child: Text(
                      'SERVICES',
                      style: TextStyle(
                        color: Color(0xFF7A8797),
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),

                  // DASHBOARD
                  _sidebarItem(
                    context,
                    title: 'Dashboard',
                    icon: Icons.dashboard_rounded,
                    color: primary,
                    selected: true,
                    onTap: () {
                      // Already on Dashboard
                    },
                  ),

                 _sidebarItem(
                  context,
                  title: 'Platform Administration',
                icon: Icons.admin_panel_settings_outlined,
                color: const Color(0xFF64748B),
                onTap: () {
                 Navigator.push(
                context,
              MaterialPageRoute(
              builder: (context) => const PlatformAdministrationPage(),
              ),
            );
        },
      ),

                  _sidebarItem(
                  context,
                  title: 'HRMS Service',
                  icon: Icons.badge_outlined,
                  color: const Color(0xFF64748B),
                  onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                 builder: (context) => const HrmsServicePage(),
      ),
    );
  },
),
                  _sidebarItem(
  context,
  title: 'CRM Services',
  icon: Icons.groups_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CrmServicePage(),
      ),
    );
  },
),

                 _sidebarItem(
  context,
  title: 'ERP Service',
  icon: Icons.business_center_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ErpServicePage(),
      ),
    );
  },
),

                  _sidebarItem(
  context,
  title: 'Finance & Accounting Service',
  icon: Icons.account_balance_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const FinanceAccountingServicePage(),
      ),
    );
  },
),

                  _sidebarItem(
  context,
  title: 'Workflow & Automation Service',
  icon: Icons.account_tree_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const WorkflowAutomationServicePage(),
      ),
    );
  },
),

                _sidebarItem(
  context,
  title: 'Notification Service',
  icon: Icons.notifications_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationServicePage(),
      ),
    );
  },
),
                  _sidebarItem(
  context,
  title: 'Subscription Service',
  icon: Icons.subscriptions_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const SubscriptionServicePage(),
      ),
    );
  },
),

                  _sidebarItem(
  context,
  title: 'Revenue Service',
  icon: Icons.monetization_on_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RevenueServicePage(),
      ),
    );
  },
),

                  _sidebarItem(
  context,
  title: 'Reporting & BI Service',
  icon: Icons.analytics_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReportingBiServicePage(),
      ),
    );
  },
),

                  _sidebarItem(
  context,
  title: 'Enterprise AI Service',
  icon: Icons.smart_toy_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EnterpriseAiServicePage(),
      ),
    );
  },
),

                 _sidebarItem(
  context,
  title: 'Notification Service',
  icon: Icons.notifications_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationServicePage(),
      ),
    );
  },
),

_sidebarItem(
  context,
  title: 'Calendar Services',
  icon: Icons.calendar_month_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CalendarServicesPage(),
      ),
    );
  },
),

_sidebarItem(
  context,
  title: 'Integration Service',
  icon: Icons.integration_instructions_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IntegrationServicePage(),
      ),
    );
  },
),

_sidebarItem(
  context,
  title: 'Search Service',
  icon: Icons.search_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchServicePage(),
      ),
    );
  },
),

                 

                  _sidebarItem(
  context,
  title: 'Security & Compliance Service',
  icon: Icons.security_outlined,
  color: const Color(0xFF64748B),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const SecurityComplianceServicePage(),
      ),
    );
  },
),
                ],
              ),
            ),
          ),

          // ==========================================================
          // USER FOOTER
          // ==========================================================

          Container(
            padding: const EdgeInsets.fromLTRB(
              14,
              12,
              14,
              12,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFE5EAF0),
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1976D2),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'S',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sriram',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            'Administrator',
                            style: TextStyle(
                              color: mutedText,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 9),

                InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () {
                    _showMessage(
                      context,
                      'Logout clicked',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 8,
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: Color(0xFFD56A6A),
                          size: 18,
                        ),

                        SizedBox(width: 9),

                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFFD56A6A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // PAGE CONTENT
  // ================================================================

  static Widget _buildPageContent(BuildContext context) {
    return ScrollConfiguration(
      behavior: const _NoScrollbarBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          30,
          26,
          30,
          40,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1450,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(context),

                const SizedBox(height: 30),

                _buildBusinessOverview(),

                const SizedBox(height: 34),

                _buildEnterpriseModules(context),

                const SizedBox(height: 34),

                _buildQuickAccess(context),

                const SizedBox(height: 34),

                _buildSystemInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // WELCOME SECTION
  // ================================================================

  static Widget _buildWelcomeSection(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE7F8FC),
            Color(0xFFF5FCFE),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD3EDF5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1008A9D9),
            blurRadius: 25,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact =
              constraints.maxWidth < 700;

          if (compact) {
            return Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _welcomeLogo(),

                const SizedBox(height: 18),

                _welcomeText(),

                const SizedBox(height: 20),

                _dashboardHeroButton(context),
              ],
            );
          }

          return Row(
            children: [
              _welcomeLogo(),

              const SizedBox(width: 19),

              Expanded(
                child: _welcomeText(),
              ),

              const SizedBox(width: 20),

              _dashboardHeroButton(context),
            ],
          );
        },
      ),
    );
  }

  // ================================================================
  // LOGO
  // ================================================================

  static Widget _welcomeLogo() {
    return Container(
      width: 72,
      height: 72,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFDCEEF4),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x09000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Image.asset(
        'assets/onecloud_logo.png.png',
        fit: BoxFit.contain,
      ),
    );
  }

  // ================================================================
  // WELCOME TEXT
  // ================================================================

  static Widget _welcomeText() {
    return const Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Sriram!',
          style: TextStyle(
            color: darkText,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),

        SizedBox(height: 7),

        Text(
          'Manage your enterprise operations from one powerful cloud platform.',
          style: TextStyle(
            color: bodyText,
            fontSize: 12.5,
            height: 1.5,
          ),
        ),

        SizedBox(height: 11),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_done_rounded,
              size: 15,
              color: primary,
            ),

            SizedBox(width: 6),

            Text(
              'OneCloud Enterprise Platform',
              style: TextStyle(
                color: primaryDark,
                fontSize: 10.5,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ================================================================
  // DASHBOARD BUTTON
  // ================================================================

  static Widget _dashboardHeroButton(
    BuildContext context,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        _showMessage(
          context,
          'You are already on Dashboard',
        );
      },
      icon: const Icon(
        Icons.dashboard_rounded,
        size: 17,
      ),
      label: const Text(
        'Dashboard',
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w800,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 3,
        shadowColor: primary.withOpacity(0.25),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }

  // ================================================================
  // BUSINESS OVERVIEW
  // ================================================================

  static Widget _buildBusinessOverview() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Business Overview',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Monitor your organization at a glance.',
                    style: TextStyle(
                      color: bodyText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            _StatusPill(),
          ],
        ),

        const SizedBox(height: 17),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final columns =
                width >= 1150
                    ? 4
                    : width >= 700
                        ? 2
                        : 1;

            return GridView.count(
              crossAxisCount: columns,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio:
                  columns == 1 ? 4.0 : 2.15,
              children: [
                _statCard(
                  icon: Icons.groups_outlined,
                  title: 'Employees',
                  value: '248',
                  subtitle: 'Active employees',
                  iconColor:
                      const Color(0xFF1677FF),
                  iconBackground:
                      const Color(0xFFEAF2FF),
                ),

                _statCard(
                  icon: Icons.cloud_outlined,
                  title: 'Cloud Services',
                  value: '36',
                  subtitle: 'Running services',
                  iconColor: primary,
                  iconBackground:
                      const Color(0xFFE8F8FC),
                ),

                _statCard(
                  icon: Icons.groups_rounded,
                  title: 'Active Leads',
                  value: '128',
                  subtitle: 'CRM opportunities',
                  iconColor:
                      const Color(0xFF8B5CF6),
                  iconBackground:
                      const Color(0xFFF1ECFF),
                ),

                _statCard(
                  icon: Icons.inventory_2_outlined,
                  title: 'Stock Items',
                  value: '1,842',
                  subtitle: 'Items available',
                  iconColor:
                      const Color(0xFF10A36F),
                  iconBackground:
                      const Color(0xFFEAF9F2),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // ================================================================
  // ENTERPRISE MODULES
  // ================================================================

  static Widget _buildEnterpriseModules(
    BuildContext context,
  ) {
    final modules = <_ModuleData>[
      _ModuleData(
        Icons.admin_panel_settings_outlined,
        'Platform Administration',
        'Global platform management',
        const Color(0xFF1677FF),
      ),

      

      

      _ModuleData(
        Icons.badge_outlined,
        'HRMS Service',
        'Human resource management',
        const Color(0xFF10A36F),
      ),

      _ModuleData(
        Icons.people_alt_outlined,
        'CRM Service',
        'Customer relationship management',
        const Color(0xFF8B5CF6),
      ),

      _ModuleData(
        Icons.business_center_outlined,
        'ERP Service',
        'Enterprise resource planning',
        const Color(0xFFF59E0B),
      ),

      _ModuleData(
        Icons.account_balance_outlined,
        'Finance & Accounting',
        'Financial operations',
        const Color(0xFF0891B2),
      ),

      _ModuleData(
        Icons.account_tree_outlined,
        'Workflow & Automation',
        'Business process automation',
        const Color(0xFF6366F1),
      ),

      _ModuleData(
        Icons.folder_outlined,
        'Document Management',
        'Manage enterprise documents',
        const Color(0xFFEAB308),
      ),

      _ModuleData(
        Icons.card_membership_outlined,
        'Subscription Service',
        'Plans and subscriptions',
        const Color(0xFFEC4899),
      ),

      _ModuleData(
        Icons.payments_outlined,
        'Revenue Service',
        'Revenue management',
        const Color(0xFF2563EB),
      ),

      _ModuleData(
        Icons.analytics_outlined,
        'Reporting & BI',
        'Business intelligence',
        const Color(0xFF7C3AED),
      ),

      _ModuleData(
        Icons.auto_awesome_outlined,
        'Enterprise AI',
        'AI powered intelligence',
        const Color(0xFF059669),
      ),

      _ModuleData(
        Icons.notifications_outlined,
        'Notification Service',
        'Enterprise notifications',
        const Color(0xFFE11D48),
      ),

      _ModuleData(
        Icons.calendar_month_outlined,
        'Calendar',
        'Meetings and scheduling',
        const Color(0xFF0891B2),
      ),

      _ModuleData(
        Icons.integration_instructions_outlined,
        'Integration',
        'API and third party integrations',
        const Color(0xFFEA580C),
      ),

      _ModuleData(
        Icons.search_outlined,
        'Search Service',
        'Global enterprise search',
        const Color(0xFF6D28D9),
      ),

      _ModuleData(
        Icons.security_outlined,
        'Security & Compliance',
        'Security and compliance',
        const Color(0xFF1D4ED8),
      ),
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Enterprise Modules',
          style: TextStyle(
            color: darkText,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Access all OneCloud business services from one platform.',
          style: TextStyle(
            color: bodyText,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 17),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final columns =
                width >= 1200
                    ? 4
                    : width >= 800
                        ? 3
                        : width >= 500
                            ? 2
                            : 1;

            return GridView.builder(
              itemCount: modules.length,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    columns == 1 ? 3.1 : 1.55,
              ),
              itemBuilder: (context, index) {
                final module = modules[index];

                return _moduleCard(
                  icon: module.icon,
                  title: module.title,
                  subtitle: module.subtitle,
                  color: module.color,
                  onTap: () {
                    _showMessage(
                      context,
                      '${module.title} selected',
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  // ================================================================
  // QUICK ACCESS
  // ================================================================

  static Widget _buildQuickAccess(
    BuildContext context,
  ) {
    final items = <_ModuleData>[
      _ModuleData(
        Icons.cloud_outlined,
        'Cloud Services',
        'Manage cloud resources',
        primary,
      ),

      _ModuleData(
        Icons.groups_outlined,
        'Employees',
        'Manage workforce',
        const Color(0xFF1677FF),
      ),

      _ModuleData(
        Icons.groups_rounded,
        'CRM',
        'Manage customer leads',
        const Color(0xFF8B5CF6),
      ),

      _ModuleData(
        Icons.inventory_2_outlined,
        'GT InStock',
        'Manage inventory',
        const Color(0xFF10A36F),
      ),

      _ModuleData(
        Icons.bar_chart_rounded,
        'Reports',
        'View business reports',
        const Color(0xFFF59E0B),
      ),
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Access',
          style: TextStyle(
            color: darkText,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Access your frequently used business modules.',
          style: TextStyle(
            color: bodyText,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 17),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final columns =
                width >= 1200
                    ? 5
                    : width >= 800
                        ? 3
                        : width >= 500
                            ? 2
                            : 1;

            return GridView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    columns == 1 ? 3.2 : 1.25,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                return _quickAccessCard(
                  icon: item.icon,
                  title: item.title,
                  subtitle: item.subtitle,
                  color: item.color,
                  onTap: () {
                    if (item.title == 'GT InStock') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const StockPage(),
                        ),
                      );
                    } else {
                      _showMessage(
                        context,
                        '${item.title} selected',
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  // ================================================================
  // SYSTEM INFORMATION
  // ================================================================

  static Widget _buildSystemInformation() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'System Information',
          style: TextStyle(
            color: darkText,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 16),

        LayoutBuilder(
          builder: (context, constraints) {
            final cards = [
              _InfoData(
                Icons.check_circle_outline_rounded,
                'System Status',
                'All systems operational',
                const Color(0xFF10A36F),
                const Color(0xFFEAF9F2),
              ),

              _InfoData(
                Icons.access_time_rounded,
                'Last Updated',
                'Today, 08:30 AM',
                primary,
                const Color(0xFFEAF8FC),
              ),
            ];

            if (constraints.maxWidth < 700) {
              return Column(
                children: [
                  _infoCard(
                    data: cards[0],
                  ),

                  const SizedBox(height: 14),

                  _infoCard(
                    data: cards[1],
                  ),
                ],
              );
            }

            return Row(
              children: [
                Expanded(
                  child: _infoCard(
                    data: cards[0],
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _infoCard(
                    data: cards[1],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // ================================================================
  // SIDEBAR ITEM
  // ================================================================

  static Widget _sidebarItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    bool selected = false,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Material(
        color: selected
            ? const Color(0xFFEAF7FC)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          hoverColor: const Color(0xFFF4F9FC),
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
            ),
            child: Row(
              children: [
                // ACTIVE INDICATOR
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  width: selected ? 3 : 0,
                  height: 22,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                SizedBox(
                  width: selected ? 8 : 0,
                ),

                Icon(
                  icon,
                  size: 21,
                  color: selected
                      ? primary
                      : color,
                ),

                const SizedBox(width: 13),

                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected
                          ? primary
                          : const Color(
                              0xFF4B5563,
                            ),
                      fontSize: 12.5,
                      fontWeight: selected
                          ? FontWeight.w800
                          : FontWeight.w500,
                    ),
                  ),
                ),

                if (selected)
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: primary,
                    size: 18,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // STAT CARD
  // ================================================================

  static Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color iconColor,
    required Color iconBackground,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: cardBorder,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 13,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 25,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: bodyText,
                    fontSize: 10.5,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 22,
                    fontWeight:
                        FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  subtitle,
                  overflow:
                      TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: mutedText,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // MODULE CARD
  // ================================================================

  static Widget _moduleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        splashColor:
            color.withOpacity(0.08),
        hoverColor:
            color.withOpacity(0.025),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(17),
            border: Border.all(
              color: cardBorder,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 13,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(
                    0.10,
                  ),
                  borderRadius:
                      BorderRadius.circular(13),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: darkText,
                        fontSize: 12,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: bodyText,
                        fontSize: 9,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 7),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // QUICK ACCESS CARD
  // ================================================================

  static Widget _quickAccessCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        splashColor:
            color.withOpacity(0.08),
        hoverColor:
            color.withOpacity(0.025),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(17),
            border: Border.all(
              color: cardBorder,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 13,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(
                    0.10,
                  ),
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 26,
                ),
              ),

              const SizedBox(height: 11),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: darkText,
                  fontSize: 12.5,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,
                style: const TextStyle(
                  color: bodyText,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // INFO CARD
  // ================================================================

  static Widget _infoCard({
    required _InfoData data,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(16),
        border: Border.all(
          color: cardBorder,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: data.background,
              borderRadius:
                  BorderRadius.circular(11),
            ),
            child: Icon(
              data.icon,
              color: data.color,
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: bodyText,
                    fontSize: 10,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  data.value,
                  overflow:
                      TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // SNACKBAR
  // ================================================================

  static void _showMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior:
              SnackBarBehavior.floating,
          margin:
              const EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),
          content: Text(message),
          duration:
              const Duration(seconds: 1),
        ),
      );
  }
}

// ================================================================
// MODULE DATA
// ================================================================

class _ModuleData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _ModuleData(
    this.icon,
    this.title,
    this.subtitle,
    this.color,
  );
}

// ================================================================
// INFO DATA
// ================================================================

class _InfoData {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final Color background;

  const _InfoData(
    this.icon,
    this.title,
    this.value,
    this.color,
    this.background,
  );
}

// ================================================================
// STATUS PILL
// ================================================================

class _StatusPill extends StatelessWidget {
  const _StatusPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF9F1),
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFCBEEDB),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 7,
            color: Color(0xFF16A36A),
          ),

          SizedBox(width: 6),

          Text(
            'All Systems Operational',
            style: TextStyle(
              color: Color(0xFF16805A),
              fontSize: 9.5,
              fontWeight:
                  FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// REMOVE SCROLLBAR
// ================================================================

class _NoScrollbarBehavior
    extends ScrollBehavior {
  const _NoScrollbarBehavior();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}