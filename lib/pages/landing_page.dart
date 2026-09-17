import 'package:flutter/material.dart';
import 'platform_administration_page.dart';
import 'global_dashboard_page.dart';


/// ============================================================
/// ASSET SETUP (READ THIS FIRST)
/// ============================================================
/// This file expects an image asset for the logo/avatar:
///   assets/images/image(1).jpg
///
/// 1. Create the folder `assets/images/` in your project root and
///    drop your file in there as `image(1).jpg`.
/// 2. In pubspec.yaml add:
///
///    flutter:
///      uses-material-design: true
///      assets:
///        - assets/icons/image(1).jpg
///
/// 3. Run `flutter pub get`.
///
/// If the asset is missing, every place that uses it below falls back
/// to a plain icon automatically (via `errorBuilder`), so the app will
/// never crash — it'll just show the fallback icon until you add the
/// file.
const String kLogoAssetPath = 'assets/images/image(1).jpg';
const String kAvatarAssetPath = 'assets/images/image(1).jpg';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color sidebarColor = Color(0xFF07153D);
  static const Color primaryBlue = Color(0xFF1769FF);
  static const Color greenColor = Color(0xFF16A36A);
  static const Color amberColor = Color(0xFFB98900);
  static const Color redColor = Color(0xFFE0443E);

  // ============================================================
  // SELECTED MENU / LANGUAGE
  // ============================================================

  String selectedMenu = 'Super Admin Dashboard';
  String selectedLanguage = 'English';

  // ============================================================
  // SIDEBAR MENU DATA
  // ============================================================

  final List<_SidebarMenuData> superAdminMenu = const [
    _SidebarMenuData('Super Admin Dashboard', Icons.grid_view_outlined),
  ];

  // "Platform Administration" main heading — expandable, with its
  // own overview page (PlatformAdministrationPage) AND a set of
  // submenu items that each navigate to their own page. See
  // _pageForSelectedMenu() below for the page routing.
  static final _SidebarGroupData platformAdminGroup = _SidebarGroupData(
    title: 'Platform Administration',
    icon: Icons.admin_panel_settings_outlined,
    children: const [
      _SidebarMenuData('Global Dashboard', Icons.public_outlined),
      _SidebarMenuData('Platform Configuration', Icons.settings_outlined),
      _SidebarMenuData('Platform Branding', Icons.palette_outlined),
      _SidebarMenuData('Feature Management', Icons.extension_outlined),
      _SidebarMenuData('License Management', Icons.description_outlined),
      _SidebarMenuData('Settings', Icons.apps_outlined),
    ],
  );

  // "HRMS Service" main heading — expandable, with its own overview
  // page plus submenu items that each navigate to their own page.
  // See _pageForSelectedMenu() below for the page routing.
  static final _SidebarGroupData hrmsGroup = _SidebarGroupData(
    title: 'HRMS Service',
    icon: Icons.groups_2_outlined,
    children: const [
      _SidebarMenuData('Employee Mgmt.', Icons.badge_outlined),
      _SidebarMenuData('Attendance', Icons.event_available_outlined),
      _SidebarMenuData('Leave', Icons.beach_access_outlined),
      _SidebarMenuData('Payroll', Icons.payments_outlined),
      _SidebarMenuData('Recruitment', Icons.person_search_outlined),
      _SidebarMenuData('Performance', Icons.trending_up_outlined),
      _SidebarMenuData('Learning', Icons.school_outlined),
      _SidebarMenuData('ESS / MSS', Icons.how_to_reg_outlined),
      _SidebarMenuData('Asset Mgmt.', Icons.inventory_2_outlined),
    ],
  );

  final List<_SidebarMenuData> organizationMenu = const [
    _SidebarMenuData('Company Setup', Icons.business_outlined),
    _SidebarMenuData('User Management', Icons.people_alt_outlined),
  ];

  // ------------------------------------------------------------
  // DOMAIN MICROSERVICES (expandable groups, heading + sub-headings)
  // ------------------------------------------------------------
  // One group per domain box in the microservices diagram, from
  // "Platform Administration Service" through to
  // "Security & Compliance Service", each with a heading icon and
  // an icon per sub-item.
  //
  // NOTE: a couple of the rarer icon names below were added in
  // fairly recent Flutter SDKs (e.g. groups_2_outlined,
  // currency_exchange_outlined). If any icon shows as an "undefined
  // name" error on your Flutter version, just swap it for any other
  // `Icons.xxx_outlined` constant — nothing else needs to change.
  static final List<_SidebarGroupData> domainGroups = [
    _SidebarGroupData(
      title: 'CRM Service',
      icon: Icons.handshake_outlined,
      children: const [
        _SidebarMenuData('Leads', Icons.person_add_alt_outlined),
        _SidebarMenuData('Opportunities', Icons.trending_up_outlined),
        _SidebarMenuData('Contacts', Icons.contacts_outlined),
        _SidebarMenuData('Activities', Icons.checklist_outlined),
        _SidebarMenuData('Pipeline', Icons.timeline_outlined),
        _SidebarMenuData('Quotations', Icons.request_quote_outlined),
        _SidebarMenuData('Campaigns', Icons.campaign_outlined),
        _SidebarMenuData('Customer Support', Icons.support_agent_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'ERP Service',
      icon: Icons.precision_manufacturing_outlined,
      children: const [
        _SidebarMenuData('Inventory', Icons.inventory_2_outlined),
        _SidebarMenuData('Production', Icons.factory_outlined),
        _SidebarMenuData('Sales Orders', Icons.shopping_cart_outlined),
        _SidebarMenuData('Purchasing', Icons.shopping_bag_outlined),
        _SidebarMenuData('Asset Mgmt.', Icons.devices_other_outlined),
        _SidebarMenuData('Dispatch', Icons.local_shipping_outlined),
        _SidebarMenuData('Maintenance', Icons.build_outlined),
        _SidebarMenuData('Vendors', Icons.storefront_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Finance & Accounting Service',
      icon: Icons.account_balance_outlined,
      children: const [
        _SidebarMenuData('General Ledger', Icons.menu_book_outlined),
        _SidebarMenuData('Accounts Payable', Icons.payment_outlined),
        _SidebarMenuData('Accounts Receivable', Icons.receipt_long_outlined),
        _SidebarMenuData('Tax Mgmt.', Icons.percent_outlined),
        _SidebarMenuData('Budgeting', Icons.pie_chart_outline),
        _SidebarMenuData('Costing', Icons.calculate_outlined),
        _SidebarMenuData('Financial Reports', Icons.bar_chart_outlined),
        _SidebarMenuData('Reconciliation', Icons.compare_arrows_outlined),
        _SidebarMenuData('Multi-Currency', Icons.currency_exchange_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Workflow & Automation Service',
      icon: Icons.account_tree_outlined,
      children: const [
        _SidebarMenuData('Workflow Builder', Icons.schema_outlined),
        _SidebarMenuData('Approvals', Icons.fact_check_outlined),
        _SidebarMenuData('Business Rules', Icons.rule_outlined),
        _SidebarMenuData('Process Automation', Icons.settings_outlined),
        _SidebarMenuData('Task Mgmt.', Icons.task_alt_outlined),
        _SidebarMenuData('Triggers', Icons.bolt_outlined),
        _SidebarMenuData('SLAs & Escalations', Icons.alarm_outlined),
        _SidebarMenuData('Process Monitoring', Icons.monitor_outlined),
        _SidebarMenuData('Workflow Analytics', Icons.insights_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Document Management Service',
      icon: Icons.folder_outlined,
      children: const [
        _SidebarMenuData('Document Repository', Icons.folder_copy_outlined),
        _SidebarMenuData('Versioning', Icons.history_outlined),
        _SidebarMenuData('File Upload/Download', Icons.upload_file_outlined),
        _SidebarMenuData('Access Control', Icons.lock_outline),
        _SidebarMenuData('Document Templates', Icons.description_outlined),
        _SidebarMenuData('Tagging & Search', Icons.label_outlined),
        _SidebarMenuData('Retention Policies', Icons.policy_outlined),
        _SidebarMenuData('Audit Trails', Icons.fact_check_outlined),
        _SidebarMenuData('OCR Integration', Icons.document_scanner_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Subscription Service',
      icon: Icons.subscriptions_outlined,
      children: const [
        _SidebarMenuData('Plans & Features', Icons.list_alt_outlined),
        _SidebarMenuData('Tenant Subscriptions', Icons.card_membership_outlined),
        _SidebarMenuData('Usage & Quotas', Icons.speed_outlined),
        _SidebarMenuData('Payment Terms', Icons.receipt_outlined),
        _SidebarMenuData('License Allocation', Icons.assignment_ind_outlined),
        _SidebarMenuData('License Keys', Icons.vpn_key_outlined),
        _SidebarMenuData('Renewals', Icons.autorenew),
        _SidebarMenuData('Trial Mgmt.', Icons.hourglass_empty_outlined),
        _SidebarMenuData('Billing Integration', Icons.integration_instructions_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Revenue Service',
      icon: Icons.attach_money_outlined,
      children: const [
        _SidebarMenuData('Revenue Tracking', Icons.show_chart_outlined),
        _SidebarMenuData('Forecasting', Icons.query_stats_outlined),
        _SidebarMenuData('Revenue Reports', Icons.summarize_outlined),
        _SidebarMenuData('Commission Mgmt.', Icons.percent_outlined),
        _SidebarMenuData('Revenue Recognition', Icons.fact_check_outlined),
        _SidebarMenuData('Financial Analytics', Icons.analytics_outlined),
        _SidebarMenuData('Invoicing', Icons.receipt_long_outlined),
        _SidebarMenuData('Integration', Icons.hub_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Reporting & BI Service',
      icon: Icons.insert_chart_outlined,
      children: const [
        _SidebarMenuData('Standard Reports', Icons.description_outlined),
        _SidebarMenuData('Ad-hoc Reports', Icons.dashboard_customize_outlined),
        _SidebarMenuData('Data Exploration', Icons.explore_outlined),
        _SidebarMenuData('BI Mgmt.', Icons.leaderboard_outlined),
        _SidebarMenuData('Data Export', Icons.ios_share_outlined),
        _SidebarMenuData('Scheduled Reports', Icons.schedule_outlined),
        _SidebarMenuData('Data Visualization', Icons.bar_chart_outlined),
        _SidebarMenuData('Self-Service Analytics', Icons.query_stats_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Enterprise AI Service',
      icon: Icons.smart_toy_outlined,
      children: const [
        _SidebarMenuData('AI Models', Icons.psychology_outlined),
        _SidebarMenuData('AI Chat/Copilot', Icons.chat_outlined),
        _SidebarMenuData('Document AI/OCR', Icons.document_scanner_outlined),
        _SidebarMenuData('Predictive Analytics', Icons.insights_outlined),
        _SidebarMenuData('Recommendations', Icons.recommend_outlined),
        _SidebarMenuData('AI Workflows', Icons.account_tree_outlined),
        _SidebarMenuData('Model Mgmt.', Icons.tune_outlined),
        _SidebarMenuData('Prompt Engineering', Icons.edit_note_outlined),
        _SidebarMenuData('AI Usage Logs', Icons.history_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Notification Service',
      icon: Icons.notifications_none_outlined,
      children: const [
        _SidebarMenuData('In-App Notifications', Icons.notifications_active_outlined),
        _SidebarMenuData('Email Notifications', Icons.email_outlined),
        _SidebarMenuData('SMS Notifications', Icons.sms_outlined),
        _SidebarMenuData('Push Notifications', Icons.campaign_outlined),
        _SidebarMenuData('Templates', Icons.description_outlined),
        _SidebarMenuData('Preferences', Icons.tune_outlined),
        _SidebarMenuData('Schedules', Icons.schedule_outlined),
        _SidebarMenuData('Delivery Tracking', Icons.track_changes_outlined),
        _SidebarMenuData('Multi-Channel', Icons.hub_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Calendar Service',
      icon: Icons.calendar_month_outlined,
      children: const [
        _SidebarMenuData('User Calendars', Icons.event_outlined),
        _SidebarMenuData('Team Calendars', Icons.groups_outlined),
        _SidebarMenuData('Meeting Scheduler', Icons.event_available_outlined),
        _SidebarMenuData('Resource Booking', Icons.meeting_room_outlined),
        _SidebarMenuData('Reminders', Icons.alarm_outlined),
        _SidebarMenuData('Availability', Icons.access_time_outlined),
        _SidebarMenuData('Event Notifications', Icons.notifications_none_outlined),
        _SidebarMenuData('Shared Calendars', Icons.share_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Integration Service',
      icon: Icons.hub_outlined,
      children: const [
        _SidebarMenuData('API Mgmt.', Icons.api_outlined),
        _SidebarMenuData('Third-Party Integrations', Icons.extension_outlined),
        _SidebarMenuData('Webhooks', Icons.link_outlined),
        _SidebarMenuData('Event Streaming', Icons.sync_alt_outlined),
        _SidebarMenuData('Data Transformation', Icons.transform_outlined),
        _SidebarMenuData('Connectors (Google, Outlook)', Icons.settings_input_component_outlined),
        _SidebarMenuData('Data Sync (ERP, Bank, Payment)', Icons.sync_outlined),
        _SidebarMenuData('Integration Logs', Icons.history_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Search Service',
      icon: Icons.search_outlined,
      children: const [
        _SidebarMenuData('Global Search', Icons.travel_explore_outlined),
        _SidebarMenuData('Index Mgmt.', Icons.storage_outlined),
        _SidebarMenuData('Search Analytics', Icons.query_stats_outlined),
        _SidebarMenuData('Autocomplete', Icons.auto_awesome_outlined),
        _SidebarMenuData('Relevance Ranking', Icons.sort_outlined),
        _SidebarMenuData('Saved Searches', Icons.bookmark_outlined),
        _SidebarMenuData('Multi-Tenant Index', Icons.dns_outlined),
        _SidebarMenuData('Synonyms', Icons.compare_arrows_outlined),
        _SidebarMenuData('Suggestion Engine', Icons.lightbulb_outlined),
      ],
    ),
    _SidebarGroupData(
      title: 'Security & Compliance Service',
      icon: Icons.shield_outlined,
      children: const [
        _SidebarMenuData('Audit Logs', Icons.fact_check_outlined),
        _SidebarMenuData('Activity Tracking', Icons.timeline_outlined),
        _SidebarMenuData('Compliance Reports', Icons.gavel_outlined),
        _SidebarMenuData('Data Retention', Icons.archive_outlined),
        _SidebarMenuData('Policy Mgmt.', Icons.policy_outlined),
        _SidebarMenuData('Threat Detection', Icons.warning_amber_outlined),
        _SidebarMenuData('Vulnerability Mgmt.', Icons.bug_report_outlined),
        _SidebarMenuData('Encryption & Key Mgmt.', Icons.enhanced_encryption_outlined),
        _SidebarMenuData('Security Alerts', Icons.notification_important_outlined),
      ],
    ),
  ];

  // Tracks which expandable sidebar groups are currently open.
  final Set<String> expandedGroups = {};

  // ============================================================
  // DASHBOARD DATA (would normally come from an API)
  // ============================================================

  bool isRefreshing = false;

  final List<Map<String, String>> securityAlerts = const [
    {
      'title': '27 licenses expiring within 30 days',
      'subtitle': 'Review renewals before Sep 22.',
      'level': 'warning',
    },
    {
      'title': '3 organizations awaiting activation approval',
      'subtitle': 'Submitted via self-signup, pending review.',
      'level': 'info',
    },
    {
      'title': 'Unusual login pattern detected',
      'subtitle': 'Delta Retail Group — 3 logins from new locations.',
      'level': 'danger',
    },
  ];

  final List<Map<String, String>> recentLogins = const [
    {
      'title': 'Ana Ferreira signed in from Lisbon, PT',
      'subtitle': '18 minutes ago',
      'status': 'ok',
    },
    {
      'title': 'Unrecognized device signed in to Delta Retail Group',
      'subtitle': '52 minutes ago',
      'status': 'warning',
    },
    {
      'title': 'sriram (Super Admin) signed in',
      'subtitle': '3 hours ago',
      'status': 'ok',
    },
    {
      'title': 'sriram (Super Admin) signed in',
      'subtitle': '3 hours ago',
      'status': 'ok',
    },
    {
      'title': '5 failed attempts on account j.mehta@acmecorp.com — locked',
      'subtitle': '5 hours ago',
      'status': 'danger',
    },
  ];

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: _buildMainArea(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SIDEBAR  (matches the Stackly reference screenshot)
  // ============================================================

  Widget _buildSidebar() {
    return Container(
      width: 260,
      color: sidebarColor,
      child: Column(
        children: [
          // ======================================================
          // LOGO
          // ======================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 26, 20, 16),
            child: Row(
              children: [
                _logoMark(),
                const SizedBox(width: 10),
                const Text(
                  'STACKLY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          // ======================================================
          // "PLATFORM ADMINISTRATION" BADGE
          // ======================================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: primaryBlue.withOpacity(0.4),
                  ),
                ),
                child: const Text(
                  'PLATFORM ADMINISTRATION',
                  style: TextStyle(
                    color: Color(0xFF6FA0FF),
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 22),

          // ======================================================
          // SCROLLABLE MENU
          // ======================================================

          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 4,
              radius: const Radius.circular(10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 8,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sidebarSectionLabel('SUPER ADMIN MANAGEMENT'),
                    const SizedBox(height: 8),
                    for (final item in superAdminMenu)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: _sidebarMenuItem(item),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: _sidebarGroupItem(platformAdminGroup),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: _sidebarGroupItem(hrmsGroup),
                    ),

                    const SizedBox(height: 20),

                    _sidebarSectionLabel('DOMAIN MICROSERVICES'),
                    const SizedBox(height: 8),
                    for (final group in domainGroups)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: _sidebarGroupItem(group),
                      ),

                    const SizedBox(height: 20),

                    _sidebarSectionLabel('ORGANIZATION'),
                    const SizedBox(height: 8),
                    for (final item in organizationMenu)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: _sidebarMenuItem(item),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // ======================================================
          // BOTTOM: LANGUAGE / LOGOUT / PROFILE
          // ======================================================

          _buildSidebarFooter(),
        ],
      ),
    );
  }

  // ============================================================
  // LOGO MARK (uses asset, falls back to icon automatically)
  // ============================================================

  Widget _logoMark() {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        kLogoAssetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Asset not added to the project yet — show a fallback icon
          // instead of crashing.
          return const Icon(
            Icons.cloud_outlined,
            color: Colors.white,
            size: 20,
          );
        },
      ),
    );
  }

  Widget _sidebarSectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF61708F),
          fontSize: 9.5,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _sidebarMenuItem(_SidebarMenuData item) {
    final bool selected = selectedMenu == item.title;
    return InkWell(
      onTap: () {
        setState(() => selectedMenu = item.title);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(minHeight: 42),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 18,
              color: selected ? Colors.white : const Color(0xFF8B9AB7),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFB2BCD0),
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EXPANDABLE SIDEBAR GROUP (heading + sub-headings, with icons)
  // e.g. "HRMS Service" -> Employee Mgmt., Attendance, Leave, ...
  // ============================================================

  Widget _sidebarGroupItem(_SidebarGroupData group) {
    final bool expanded = expandedGroups.contains(group.title);
    // Group is "active" if the heading itself or any of its
    // children is the currently selected menu item.
    final bool groupActive = selectedMenu == group.title ||
        group.children.any((c) => c.title == selectedMenu);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------- Heading row ----------------
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              selectedMenu = group.title;
              if (expanded) {
                expandedGroups.remove(group.title);
              } else {
                expandedGroups.add(group.title);
              }
            });
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 42),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: selectedMenu == group.title
                  ? primaryBlue.withOpacity(0.12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  group.icon,
                  size: 18,
                  color: groupActive ? Colors.white : const Color(0xFF8B9AB7),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    group.title,
                    style: TextStyle(
                      color: groupActive ? Colors.white : const Color(0xFFB2BCD0),
                      fontSize: 12,
                      fontWeight: groupActive ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  size: 18,
                  color: const Color(0xFF71819F),
                ),
              ],
            ),
          ),
        ),

        // ---------------- Sub-heading list ----------------
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 180),
          crossFadeState:
              expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final child in group.children)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: _sidebarSubMenuItem(child),
                  ),
              ],
            ),
          ),
          secondChild: const SizedBox(width: double.infinity, height: 0),
        ),
      ],
    );
  }

  // Sub-heading row: indented, with its own icon (instead of a bullet).
  Widget _sidebarSubMenuItem(_SidebarMenuData item) {
    final bool selected = selectedMenu == item.title;
    return InkWell(
      onTap: () {
        setState(() => selectedMenu = item.title);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(minHeight: 36),
        padding: const EdgeInsets.only(left: 34, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: selected ? primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 15,
              color: selected ? Colors.white : const Color(0xFF7C8AA6),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFA6B0C6),
                  fontSize: 11.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SIDEBAR FOOTER: LANGUAGE, LOGOUT, PROFILE
  // ============================================================

  Widget _buildSidebarFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF16223F), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Language selector
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: _showLanguagePicker,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.language, size: 18, color: Color(0xFF8B9AB7)),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Text(
                      'Language',
                      style: TextStyle(
                        color: Color(0xFFB2BCD0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    selectedLanguage,
                    style: const TextStyle(
                      color: Color(0xFF71819F),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.expand_more, size: 16, color: Color(0xFF71819F)),
                ],
              ),
            ),
          ),

          // Logout
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => _confirmLogout(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.logout_outlined, size: 18, color: Color(0xFF8B9AB7)),
                  SizedBox(width: 11),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: Color(0xFFB2BCD0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Profile card
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: _showProfileMenu,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1E4A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _profileAvatar(),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sriram',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Super Admin',
                          style: TextStyle(
                            color: Color(0xFF8D9BB8),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileAvatar() {
    return Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
        color: primaryBlue,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        kAvatarAssetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text(
              'RK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final languages = ['English', 'Hindi', 'Tamil', 'Spanish'];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Select language',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                ),
              ),
              for (final lang in languages)
                ListTile(
                  title: Text(lang),
                  trailing: selectedLanguage == lang
                      ? const Icon(Icons.check, color: primaryBlue)
                      : null,
                  onTap: () {
                    setState(() => selectedLanguage = lang);
                    Navigator.of(context).pop();
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _showProfileMenu() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening profile settings…'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // TODO: navigate to your real profile/account page.
  }

  // ============================================================
  // LOGOUT FUNCTIONALITY
  // ============================================================

  Future<void> _confirmLogout(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text(
            'Log out?',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          content: const Text(
            'You will be signed out of the OneCloud Enterprise Platform. '
            'Any unsaved changes may be lost.',
            style: TextStyle(fontSize: 13, color: Color(0xFF667085)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      _performLogout(context);
    }
  }

  void _performLogout(BuildContext context) {
    setState(() {
      selectedMenu = 'Super Admin Dashboard';
    });

    // TODO: hook this up to your real auth/session logic, e.g.:
    // await AuthService.instance.signOut();
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (_) => const LoginPage()),
    //   (route) => false,
    // );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have been logged out.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ============================================================
  // PAGE ROUTING
  // ============================================================
  // Maps a sidebar selection to the page that should be shown.
  // - 'Global Dashboard' and 'Platform Administration' already have
  //   real page widgets (GlobalDashboardPage / PlatformAdministrationPage).
  // - The other "Platform Administration" submenu items don't have
  //   dedicated page files yet, so they render a labelled placeholder
  //   for now. Replace `_placeholderPage(...)` in each case below
  //   with your own page widget (e.g. `const PlatformConfigPage()`)
  //   once it exists, exactly the way GlobalDashboardPage is wired.
  Widget? _pageForSelectedMenu() {
    switch (selectedMenu) {
      case 'Global Dashboard':
        return const GlobalDashboardPage();
      case 'Platform Administration':
        return const PlatformAdministrationPage();
      case 'HRMS Service':
        return _placeholderPage(
          title: 'HRMS Service',
          icon: Icons.groups_2_outlined,
          description:
              'HRMS overview — employee headcount, attendance summary, leave and payroll status at a glance.',
        );
      case 'Employee Mgmt.':
        return _placeholderPage(
          title: 'Employee Management',
          icon: Icons.badge_outlined,
          description: 'Manage employee profiles, roles and org structure here.',
        );
      case 'Attendance':
        return _placeholderPage(
          title: 'Attendance',
          icon: Icons.event_available_outlined,
          description: 'Track clock-ins, shifts and attendance records here.',
        );
      case 'Leave':
        return _placeholderPage(
          title: 'Leave',
          icon: Icons.beach_access_outlined,
          description: 'Manage leave requests, balances and approval workflows here.',
        );
      case 'Payroll':
        return _placeholderPage(
          title: 'Payroll',
          icon: Icons.payments_outlined,
          description: 'Run payroll cycles, payslips and salary adjustments here.',
        );
      case 'Recruitment':
        return _placeholderPage(
          title: 'Recruitment',
          icon: Icons.person_search_outlined,
          description: 'Manage job postings, candidates and hiring pipelines here.',
        );
      case 'Performance':
        return _placeholderPage(
          title: 'Performance',
          icon: Icons.trending_up_outlined,
          description: 'Track goals, reviews and performance ratings here.',
        );
      case 'Learning':
        return _placeholderPage(
          title: 'Learning',
          icon: Icons.school_outlined,
          description: 'Assign and track training courses and certifications here.',
        );
      case 'ESS / MSS':
        return _placeholderPage(
          title: 'ESS / MSS',
          icon: Icons.how_to_reg_outlined,
          description: 'Employee & manager self-service portals live here.',
        );
      case 'Asset Mgmt.':
        return _placeholderPage(
          title: 'Asset Management',
          icon: Icons.inventory_2_outlined,
          description: 'Track company assets issued to employees here.',
        );
      case 'Platform Configuration':
        return _placeholderPage(
          title: 'Platform Configuration',
          icon: Icons.settings_outlined,
          description:
              'Manage global platform configuration here. Swap this out for your PlatformConfigurationPage widget.',
        );
      case 'Platform Branding':
        return _placeholderPage(
          title: 'Platform Branding',
          icon: Icons.palette_outlined,
          description:
              'Customize platform branding — logos, colors and themes — here.',
        );
      case 'Feature Management':
        return _placeholderPage(
          title: 'Feature Management',
          icon: Icons.extension_outlined,
          description: 'Enable or disable platform features and flags here.',
        );
      case 'License Management':
        return _placeholderPage(
          title: 'License Management',
          icon: Icons.description_outlined,
          description:
              'Manage licenses, renewals and seat allocation here.',
        );
      case 'Settings':
        return _placeholderPage(
          title: 'Settings',
          icon: Icons.apps_outlined,
          description: 'General application settings live here.',
        );
      default:
        // No dedicated page for this selection — fall back to the
        // default Super Admin Dashboard content.
        return null;
    }
  }

  // Simple placeholder page used for submenu items that don't have a
  // dedicated page widget yet. Replace calls to this with a real page
  // as you build each one out.
  Widget _placeholderPage({
    required String title,
    required IconData icon,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 30, color: primaryBlue),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172033),
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Color(0xFF8791A3)),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN AREA
  // ============================================================

  Widget _buildMainArea() {
  return Column(
    children: [
      Container(
        color: const Color(0xFFF5F7FB),
        padding: const EdgeInsets.fromLTRB(28, 22, 28, 15),
        child: _buildTopBar(),
      ),

      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(28, 4, 28, 35),

          // ==================================================
          // ROUTED PAGE / DASHBOARD CONTENT
          // ==================================================

          child: _pageForSelectedMenu() ?? Column(








                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDashboardHeader(),

                    const SizedBox(height: 22),

                    _sectionLabel('PLATFORM OVERVIEW'),

                    const SizedBox(height: 10),

                    _buildPlatformOverview(),

                    const SizedBox(height: 24),

                    _sectionLabel('SYSTEM STATUS'),

                    const SizedBox(height: 10),

                    _buildSystemStatus(),

                    const SizedBox(height: 24),

                    _sectionLabel('RESOURCE UTILIZATION'),

                    const SizedBox(height: 10),

                    _buildResourceUtilization(),

                    const SizedBox(height: 24),

                    _sectionLabel('QUICK NAVIGATION'),

                    const SizedBox(height: 10),

                    _buildQuickNavigation(),

                    const SizedBox(height: 24),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        final bool wide =
                            constraints.maxWidth >= 900;

                        final alerts =
                            _buildSecurityAlertsCard();

                        final activity =
                            _buildRecentActivityCard();

                        if (wide) {
                          return Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: alerts,
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: activity,
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            alerts,

                            const SizedBox(height: 16),

                            activity,
                          ],
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    ],
  );
}





















  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: Color(0xFF8A93A5),
        letterSpacing: 0.8,
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          icon: const Icon(
            Icons.keyboard_double_arrow_left,
            color: Color(0xFF71819F),
            size: 25,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: const Color(0xFFE4E8F0)),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 14),
                  Icon(Icons.search, size: 19, color: Color(0xFF9BA5B7)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search tenants, users, settings, audit logs...',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xFFA0A9BA), fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 18),
        InkWell(
          borderRadius: BorderRadius.circular(9),
          onTap: () {
            setState(() => selectedMenu = 'Notifications');
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.notifications_none_outlined,
              color: Color(0xFF4F6180),
              size: 21,
            ),
          ),
        ),
        const SizedBox(width: 18),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: primaryBlue,
            borderRadius: BorderRadius.circular(50),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            kAvatarAssetPath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text(
                  'RK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'sriram',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF202A3A)),
            ),
            SizedBox(height: 2),
            Text(
              'Super Admin',
              style: TextStyle(fontSize: 10, color: Color(0xFF8A94A6)),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // DASHBOARD HEADER
  // ============================================================

  Widget _buildDashboardHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Platform Administration / Dashboard',
                style: TextStyle(fontSize: 11, color: Color(0xFF8A93A5), fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              const Text(
                'Super Admin Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF172033)),
              ),
              const SizedBox(height: 4),
              const Text(
                'Welcome back, Super Admin',
                style: TextStyle(fontSize: 12.5, color: Color(0xFF8791A3)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: _handleRefresh,
              icon: isRefreshing
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.refresh, size: 17),
              label: const Text('Refresh'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF465267),
                side: const BorderSide(color: Color(0xFFE0E4EC)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: _handleExportReport,
              icon: const Icon(Icons.file_download_outlined, size: 17),
              label: const Text('Export report'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleRefresh() {
    setState(() => isRefreshing = true);
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() => isRefreshing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dashboard refreshed.'), behavior: SnackBarBehavior.floating),
      );
    });
  }

  void _handleExportReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preparing report export…'), behavior: SnackBarBehavior.floating),
    );
    // TODO: hook this up to your real export/report-generation logic.
  }

  // ============================================================
  // PLATFORM OVERVIEW
  // ============================================================

  Widget _buildPlatformOverview() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final cards = [
          _overviewCard(
            icon: Icons.people_alt_outlined,
            label: 'TOTAL USERS',
            value: '96,412',
            footnote: '↑ 1.8% this month',
            footnoteColor: greenColor,
          ),
          _overviewCard(
            icon: Icons.wifi_tethering_outlined,
            label: 'ACTIVE USERS',
            value: '78,930',
            footnote: '● 4,215 online now',
            footnoteColor: greenColor,
          ),
          _overviewCard(
            icon: Icons.apartment_outlined,
            label: 'ORGANIZATIONS',
            value: '1,842',
            footnote: '↑ 4.2% this month',
            footnoteColor: greenColor,
          ),
          _overviewCard(
            icon: Icons.badge_outlined,
            label: 'LICENSES ACTIVE',
            value: '2,140',
            footnote: '27 expiring < 30 days',
            footnoteColor: Colors.white70,
            highlighted: true,
          ),
        ];

        if (width >= 950) {
          return Row(
            children: [
              for (int i = 0; i < cards.length; i++) ...[
                Expanded(child: cards[i]),
                if (i != cards.length - 1) const SizedBox(width: 14),
              ],
            ],
          );
        }

        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            for (final card in cards) SizedBox(width: (width - 14) / 2, child: card),
          ],
        );
      },
    );
  }

  Widget _overviewCard({
    required IconData icon,
    required String label,
    required String value,
    required String footnote,
    required Color footnoteColor,
    bool highlighted = false,
  }) {
    return InkWell(
      onTap: () {
        if (label == 'LICENSES ACTIVE') {
          setState(() => selectedMenu = 'License Management');
        }
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        constraints: const BoxConstraints(minHeight: 108),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: highlighted
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1769FF), Color(0xFF2E82FF)],
                )
              : null,
          color: highlighted ? null : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: highlighted ? null : Border.all(color: const Color(0xFFE5E9F2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.025),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                    color: highlighted ? Colors.white70 : const Color(0xFF7A8499),
                  ),
                ),
                Icon(icon, size: 17, color: highlighted ? Colors.white : primaryBlue),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: highlighted ? Colors.white : const Color(0xFF172033),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              footnote,
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: footnoteColor),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SYSTEM STATUS
  // ============================================================

  Widget _buildSystemStatus() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E9F2)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final items = [
            _statusItem('SERVER STATUS', 'Healthy', greenColor),
            _statusItem('DATABASE', 'Connected', greenColor),
            _statusItem('API GATEWAY', 'Running', greenColor),
            _statusItem('STORAGE', '68% used', amberColor),
          ];
          final wide = constraints.maxWidth >= 750;
          if (wide) {
            return Row(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  Expanded(child: items[i]),
                  if (i != items.length - 1) const SizedBox(width: 14),
                ],
              ],
            );
          }
          return Wrap(
            spacing: 20,
            runSpacing: 14,
            children: [
              for (final item in items)
                SizedBox(width: (constraints.maxWidth - 20) / 2, child: item),
            ],
          );
        },
      ),
    );
  }

  Widget _statusItem(String label, String value, Color dotColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9.5,
            fontWeight: FontWeight.w800,
            color: Color(0xFF9BA5B7),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.circle, size: 9, color: dotColor),
            const SizedBox(width: 7),
            Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF202A3A)),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // RESOURCE UTILIZATION
  // ============================================================

  Widget _buildResourceUtilization() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E9F2)),
      ),
      child: Column(
        children: [
          _resourceBar('CPU usage', 0.42, primaryBlue),
          const SizedBox(height: 16),
          _resourceBar('Memory usage', 0.57, const Color(0xFF7C5CFF)),
          const SizedBox(height: 16),
          _resourceBar('Storage', 0.68, amberColor),
        ],
      ),
    );
  }

  Widget _resourceBar(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF465267))),
            Text(
              '${(value * 100).round()}%',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF202A3A)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: const Color(0xFFEEF1F6),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // QUICK NAVIGATION
  // ============================================================

  Widget _buildQuickNavigation() {
    final items = [
      ('User Management', 'Manage accounts & roles', Icons.people_alt_outlined, 'User Management'),
      ('Platform Settings', 'Global configuration', Icons.settings_outlined, 'Platform Configuration'),
      ('License Management', 'Renewals & seat usage', Icons.badge_outlined, 'License Management'),
      ('Audit Logs', 'Track admin actions', Icons.fact_check_outlined, 'Audit Logs'),
      ('Notifications', 'Notification centre', Icons.notifications_none_outlined, 'Notifications'),
      ('Backup & Recovery', 'Snapshots & restore', Icons.settings_backup_restore_outlined, 'Backup & Recovery'),
      ('Reports', 'Platform analytics', Icons.bar_chart_outlined, 'Reports'),
      ('Security Center', 'Threats & policies', Icons.shield_outlined, 'Security Center'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int columns = 4;
        if (width < 950) columns = 3;
        if (width < 700) columns = 2;
        final itemWidth = (width - (columns - 1) * 14) / columns;

        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            for (final item in items)
              SizedBox(
                width: itemWidth,
                child: _quickNavItem(
                  title: item.$1,
                  subtitle: item.$2,
                  icon: item.$3,
                  targetMenu: item.$4,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _quickNavItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required String targetMenu,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() => selectedMenu = targetMenu);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening $title…'),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 900),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E9F2)),
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
              child: Icon(icon, color: primaryBlue, size: 19),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF202A3A)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 10, color: Color(0xFF8B95A7)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SECURITY ALERTS CARD
  // ============================================================

  Widget _buildSecurityAlertsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Security alerts',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF172033)),
          ),
          const SizedBox(height: 12),
          for (final alert in securityAlerts)
            _alertRow(title: alert['title']!, subtitle: alert['subtitle']!, level: alert['level']!),
          const SizedBox(height: 4),
          Center(
            child: TextButton(
              onPressed: () {
                setState(() => selectedMenu = 'Security Alerts');
              },
              child: const Text(
                'View all alerts',
                style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: primaryBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alertRow({required String title, required String subtitle, required String level}) {
    Color color;
    IconData icon;
    switch (level) {
      case 'danger':
        color = redColor;
        icon = Icons.lock_outline;
        break;
      case 'warning':
        color = amberColor;
        icon = Icons.warning_amber_outlined;
        break;
      default:
        color = primaryBlue;
        icon = Icons.info_outline;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 15, color: color),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF202A3A))),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 10.5, color: Color(0xFF8B95A7))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RECENT LOGIN ACTIVITY CARD
  // ============================================================

  Widget _buildRecentActivityCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent login activities',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF172033)),
              ),
              const Text('Last 24 hours', style: TextStyle(fontSize: 10.5, color: Color(0xFF8B95A7))),
            ],
          ),
          const SizedBox(height: 12),
          for (final entry in recentLogins)
            _activityRow(title: entry['title']!, subtitle: entry['subtitle']!, status: entry['status']!),
        ],
      ),
    );
  }

  Widget _activityRow({required String title, required String subtitle, required String status}) {
    Color color;
    IconData icon;
    switch (status) {
      case 'danger':
        color = redColor;
        icon = Icons.error_outline;
        break;
      case 'warning':
        color = amberColor;
        icon = Icons.warning_amber_outlined;
        break;
      default:
        color = greenColor;
        icon = Icons.check_circle_outline;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: Color(0xFF202A3A))),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF8B95A7))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple data holder for a sidebar menu entry.
class _SidebarMenuData {
  final String title;
  final IconData icon;
  const _SidebarMenuData(this.title, this.icon);
}

/// Data holder for an expandable sidebar group (a heading with an
/// icon plus a list of sub-heading items, each with its own icon).
/// Used for "HRMS Service".
class _SidebarGroupData {
  final String title;
  final IconData icon;
  final List<_SidebarMenuData> children;
  const _SidebarGroupData({
    required this.title,
    required this.icon,
    required this.children,
  });
}
