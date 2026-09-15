import 'package:flutter/material.dart';

import 'platform_administration_page.dart';
import 'hrms_service_page.dart';
import 'crm_service_page.dart';
import 'erp_service_page.dart';
import 'finance_accounting_service_page.dart';
import 'workflow_automation_service_page.dart';
import 'notification_service_page.dart';
import 'subscription_service_page.dart';
import 'revenue_service_page.dart';
import 'reporting_bi_service_page.dart';
import 'enterprise_ai_service_page.dart';
import 'calendar_services_page.dart';
import 'integration_service_page.dart';
import 'search_service_page.dart';
import 'security_compliance_service_page.dart';

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

  // ============================================================
  // EXPANSION STATES
  // ============================================================

  bool platformExpanded = true;
  bool hrmsExpanded = false;
  bool crmExpanded = false;
  bool erpExpanded = false;
  bool financeExpanded = false;
  bool workflowExpanded = false;
  bool documentExpanded = false;
  bool subscriptionExpanded = false;
  bool revenueExpanded = false;
  bool reportingExpanded = false;
  bool aiExpanded = false;
  bool notificationExpanded = false;
  bool calendarExpanded = false;
  bool integrationExpanded = false;
  bool searchExpanded = false;
  bool securityExpanded = false;

  // ============================================================
  // SELECTED MENU
  // ============================================================

  String selectedMenu = 'Dashboard';

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
  // SIDEBAR
  // ============================================================

  Widget _buildSidebar() {
    return Container(
      width: 285,
      color: sidebarColor,
      child: Column(
        children: [
          // ======================================================
          // FIXED LOGO
          // ======================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              22,
              24,
              20,
              20,
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.cloud_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 11),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OneCloud',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Enterprise Platform',
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

          // ======================================================
          // DASHBOARD
          // ======================================================

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: _sidebarSimpleItem(
              icon: Icons.dashboard_outlined,
              title: 'Dashboard',
              selected: selectedMenu == 'Dashboard',
              onTap: () {
                setState(() {
                  selectedMenu = 'Dashboard';
                });
              },
            ),
          ),

          const SizedBox(height: 17),

          // ======================================================
          // HEADING
          // ======================================================

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DOMAIN MICROSERVICES',
                style: TextStyle(
                  color: Color(0xFF61708F),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),

          const SizedBox(height: 9),

          // ======================================================
          // SERVICE CONTENT SCROLL
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
                  children: [
                    // ==================================================
                    // 1. PLATFORM ADMINISTRATION
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.admin_panel_settings_outlined,
                      title: 'Platform Administration',
                      expanded: platformExpanded,
                      onTap: () {
                        setState(() {
                          platformExpanded = !platformExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          platformExpanded = !platformExpanded;
                        });
                      },
                    ),
                    if (platformExpanded)
                      _buildSubItems([
                        'Global Settings',
                        'Platform Config',
                        'License Management',
                        'Feature Mgmt.',
                        'Resource Mgmt.',
                        'System Health',
                        'Tenant Templates',
                      ]),

                    // ==================================================
                    // 2. HRMS
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.people_outline,
                      title: 'HRMS Service',
                      expanded: hrmsExpanded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const HrmsServicePage(),
                          ),
                        );
                      },
                      onArrowTap: () {
                        setState(() {
                          hrmsExpanded = !hrmsExpanded;
                        });
                      },
                    ),

                    if (hrmsExpanded)
                      _buildSubItems([
                        'Employee Management',
                        'Attendance',
                        'Leave',
                        'Payroll',
                        'Recruitment',
                        'Performance',
                        'Learning',
                        'ESS / MSS',
                        'Asset Management',
                      ]),

                    // ==================================================
                    // 3. CRM
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.groups_outlined,
                      title: 'CRM Services',
                      expanded: crmExpanded,
                      onTap: () {
                        setState(() {
                          crmExpanded = !crmExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          crmExpanded = !crmExpanded;
                        });
                      },
                    ),

                    if (crmExpanded)
                      _buildSubItems([
                        'Leads',
                        'Opportunities',
                        'Accounts',
                        'Contacts',
                        'Activities',
                        'Pipeline',
                        'Quotations',
                        'Campaigns',
                        'Customer Support',
                      ]),

                    // ==================================================
                    // 4. ERP
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.business_center_outlined,
                      title: 'ERP Services',
                      expanded: erpExpanded,
                      onTap: () {
                        setState(() {
                          erpExpanded = !erpExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          erpExpanded = !erpExpanded;
                        });
                      },
                    ),

                    if (erpExpanded)
                      _buildSubItems([
                        'Inventory',
                        'Procurement',
                        'Production',
                        'Sales Orders',
                        'Dispatch',
                        'Asset Management',
                        'Maintenance',
                        'Vendors',
                      ]),

                    // ==================================================
                    // 5. FINANCE
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.account_balance_outlined,
                      title: 'Finance & Accounting Service',
                      expanded: financeExpanded,
                      onTap: () {
                        setState(() {
                          financeExpanded = !financeExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          financeExpanded = !financeExpanded;
                        });
                      },
                    ),

                    if (financeExpanded)
                      _buildSubItems([
                        'General Ledger',
                        'Accounts Payable',
                        'Accounts Receivable',
                        'Bank Management',
                        'Budgeting',
                        'Costing',
                        'Financial Reports',
                        'Reconciliation',
                        'Multi-Currency',
                      ]),

                    // ==================================================
                    // 6. WORKFLOW
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.account_tree_outlined,
                      title: 'Workflow & Automation Service',
                      expanded: workflowExpanded,
                      onTap: () {
                        setState(() {
                          workflowExpanded = !workflowExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          workflowExpanded = !workflowExpanded;
                        });
                      },
                    ),

                    if (workflowExpanded)
                      _buildSubItems([
                        'Workflow Builder',
                        'Approvals',
                        'Business Rules',
                        'Process Automation',
                        'Task Management',
                        'Triggers',
                        'SLAs & Escalations',
                        'Process Monitoring',
                        'Workflow Templates',
                      ]),

                    // ==================================================
                    // 7. DOCUMENT MANAGEMENT
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.description_outlined,
                      title: 'Document Management Service',
                      expanded: documentExpanded,
                      onTap: () {
                        setState(() {
                          documentExpanded = !documentExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          documentExpanded = !documentExpanded;
                        });
                      },
                    ),

                    if (documentExpanded)
                      _buildSubItems([
                        'Document Repository',
                        'Versioning',
                        'File Upload / Download',
                        'Access Control',
                        'Document Templates',
                        'Tagging & Search',
                        'Retention Policies',
                        'Audit Trails',
                        'OCR Integration',
                      ]),

                    // ==================================================
                    // 8. SUBSCRIPTION
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.subscriptions_outlined,
                      title: 'Subscription Service',
                      expanded: subscriptionExpanded,
                      onTap: () {
                        setState(() {
                          subscriptionExpanded = !subscriptionExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          subscriptionExpanded = !subscriptionExpanded;
                        });
                      },
                    ),

                    if (subscriptionExpanded)
                      _buildSubItems([
                        'Plans & Features',
                        'Tenant Subscriptions',
                        'Usage & Quotas',
                        'Payment Tracking',
                        'License Allocation',
                        'License Keys',
                        'Renewals',
                        'Trial Management',
                        'Billing Integration',
                      ]),

                    // ==================================================
                    // 9. REVENUE
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.monetization_on_outlined,
                      title: 'Revenue Service',
                      expanded: revenueExpanded,
                      onTap: () {
                        setState(() {
                          revenueExpanded = !revenueExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          revenueExpanded = !revenueExpanded;
                        });
                      },
                    ),

                    if (revenueExpanded)
                      _buildSubItems([
                        'Revenue Tracking',
                        'Usage Analytics',
                        'Forecasting',
                        'Revenue Reports',
                        'Revenue Recognition',
                        'Commission',
                        'Financial Analytics',
                        'Invoicing',
                        'Integration',
                      ]),

                    // ==================================================
                    // 10. REPORTING
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.analytics_outlined,
                      title: 'Reporting & BI Service',
                      expanded: reportingExpanded,
                      onTap: () {
                        setState(() {
                          reportingExpanded = !reportingExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          reportingExpanded = !reportingExpanded;
                        });
                      },
                    ),

                    if (reportingExpanded)
                      _buildSubItems([
                        'Standard Reports',
                        'Ad-hoc Reports',
                        'Data Exploration',
                        'BI Management',
                        'Data Export',
                        'Scheduled Reports',
                        'Data Visualization',
                        'Self-Service Analytics',
                      ]),

                    // ==================================================
                    // 11. ENTERPRISE AI
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.auto_awesome_outlined,
                      title: 'Enterprise AI Service',
                      expanded: aiExpanded,
                      onTap: () {
                        setState(() {
                          aiExpanded = !aiExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          aiExpanded = !aiExpanded;
                        });
                      },
                    ),

                    if (aiExpanded)
                      _buildSubItems([
                        'AI Models',
                        'AI Chat / Copilot',
                        'Document AI / OCR',
                        'Predictive Analytics',
                        'Recommendations',
                        'AI Workflows',
                        'Model Management',
                        'Prompt Engineering',
                        'AI Usage Logs',
                      ]),

                    // ==================================================
                    // 12. NOTIFICATION
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.notifications_none_outlined,
                      title: 'Notification Service',
                      expanded: notificationExpanded,
                      onTap: () {
                        setState(() {
                          notificationExpanded = !notificationExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          notificationExpanded = !notificationExpanded;
                        });
                      },
                    ),

                    if (notificationExpanded)
                      _buildSubItems([
                        'In-App Notifications',
                        'Email Notifications',
                        'SMS Notifications',
                        'Push Notifications',
                        'Templates',
                        'Preferences',
                        'Schedules',
                        'Delivery Tracking',
                        'Multi-Channel',
                      ]),

                    // ==================================================
                    // 13. CALENDAR
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.calendar_month_outlined,
                      title: 'Calendar Service',
                      expanded: calendarExpanded,
                      onTap: () {
                        setState(() {
                          calendarExpanded = !calendarExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          calendarExpanded = !calendarExpanded;
                        });
                      },
                    ),

                    if (calendarExpanded)
                      _buildSubItems([
                        'User Calendars',
                        'Team Calendars',
                        'Meeting Scheduler',
                        'Resource Booking',
                        'Reminders',
                        'Notifications',
                        'Google / Outlook',
                        'Availability',
                        'Event Notifications',
                        'Shared Calendars',
                      ]),

                    // ==================================================
                    // 14. INTEGRATION
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.integration_instructions_outlined,
                      title: 'Integration Service',
                      expanded: integrationExpanded,
                      onTap: () {
                        setState(() {
                          integrationExpanded = !integrationExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          integrationExpanded = !integrationExpanded;
                        });
                      },
                    ),

                    if (integrationExpanded)
                      _buildSubItems([
                        'API Management',
                        'Third-Party Integrations',
                        'Webhooks',
                        'Event Streaming',
                        'Data Transformation',
                        'ETL / Data Sync',
                        'Connectors',
                        'Integration Logs',
                      ]),

                    // ==================================================
                    // 15. SEARCH
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.search_outlined,
                      title: 'Search Service',
                      expanded: searchExpanded,
                      onTap: () {
                        setState(() {
                          searchExpanded = !searchExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          searchExpanded = !searchExpanded;
                        });
                      },
                    ),

                    if (searchExpanded)
                      _buildSubItems([
                        'Global Search',
                        'Index Management',
                        'Search Analytics',
                        'Autocomplete',
                        'Relevance Ranking',
                        'Saved Searches',
                        'Multi-Tenant Index',
                        'Synonyms',
                        'Suggestion Engine',
                      ]),

                    // ==================================================
                    // 16. SECURITY
                    // ==================================================

                    _sidebarExpandableItem(
                      icon: Icons.security_outlined,
                      title: 'Security & Compliance Service',
                      expanded: securityExpanded,
                      onTap: () {
                        setState(() {
                          securityExpanded = !securityExpanded;
                        });
                      },
                      onArrowTap: () {
                        setState(() {
                          securityExpanded = !securityExpanded;
                        });
                      },
                    ),

                    if (securityExpanded)
                      _buildSubItems([
                        'Audit Logs',
                        'Activity Tracking',
                        'Compliance Reports',
                        'Data Retention',
                        'Policy Management',
                        'Threat Detection',
                        'Vulnerability Management',
                        'Encryption & Key Management',
                        'Security Alerts',
                      ]),
                  ],
                ),
              ),
            ),
          ),

          // ======================================================
          // FIXED LOGOUT
          // ======================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              5,
              12,
              15,
            ),
            child: _sidebarSimpleItem(
              icon: Icons.logout_outlined,
              title: 'Logout',
              selected: false,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SUB ITEMS
  // ============================================================

  Widget _buildSubItems(List<String> items) {
    // NOTE: every key below must match, character-for-character, one of the
    // strings passed into a _buildSubItems([...]) call above. If a label is
    // spelled differently here than it is up there, subItemIcons[item]
    // returns null and that row silently renders with no icon — that was
    // the bug causing "half the icons are missing".
    final Map<String, IconData> subItemIcons = {
      // ==========================================================
      // 1. PLATFORM ADMINISTRATION
      // ==========================================================
      'Global Settings': Icons.settings_outlined,
      'Platform Config': Icons.tune_outlined,
      'License Management': Icons.vpn_key_outlined,
      'Feature Mgmt.': Icons.extension_outlined,
      'Resource Mgmt.': Icons.inventory_2_outlined,
      'System Health': Icons.health_and_safety_outlined,
      'Tenant Templates': Icons.dashboard_customize_outlined,

      // ==========================================================
      // 2. HRMS
      // ==========================================================
      'Employee Management': Icons.people_outline,
      'Attendance': Icons.access_time_outlined,
      'Leave': Icons.event_available_outlined,
      'Payroll': Icons.payments_outlined,
      'Recruitment': Icons.person_add_alt_outlined,
      'Performance': Icons.trending_up_outlined,
      'Learning': Icons.school_outlined,
      'ESS / MSS': Icons.account_circle_outlined,
      'Asset Management': Icons.inventory_2_outlined, // shared with ERP

      // ==========================================================
      // 3. CRM
      // ==========================================================
      'Leads': Icons.person_search_outlined,
      'Opportunities': Icons.lightbulb_outline,
      'Accounts': Icons.account_balance_outlined,
      'Contacts': Icons.contacts_outlined,
      'Activities': Icons.task_alt_outlined,
      'Pipeline': Icons.filter_alt_outlined,
      'Quotations': Icons.request_quote_outlined,
      'Campaigns': Icons.campaign_outlined,
      'Customer Support': Icons.support_agent_outlined,

      // ==========================================================
      // 4. ERP
      // ==========================================================
      'Inventory': Icons.inventory_2_outlined,
      'Procurement': Icons.shopping_cart_outlined,
      'Production': Icons.precision_manufacturing_outlined,
      'Sales Orders': Icons.point_of_sale_outlined,
      'Dispatch': Icons.local_shipping_outlined,
      // 'Asset Management' already defined above
      'Maintenance': Icons.build_outlined,
      'Vendors': Icons.storefront_outlined,

      // ==========================================================
      // 5. FINANCE & ACCOUNTING
      // ==========================================================
      'General Ledger': Icons.account_balance_wallet_outlined,
      'Accounts Payable': Icons.payments_outlined,
      'Accounts Receivable': Icons.receipt_long_outlined,
      'Bank Management': Icons.account_balance_outlined,
      'Budgeting': Icons.pie_chart_outline,
      'Costing': Icons.calculate_outlined,
      'Financial Reports': Icons.bar_chart_outlined,
      'Reconciliation': Icons.fact_check_outlined,
      'Multi-Currency': Icons.currency_exchange_outlined,

      // ==========================================================
      // 6. WORKFLOW & AUTOMATION
      // ==========================================================
      'Workflow Builder': Icons.account_tree_outlined,
      'Approvals': Icons.approval_outlined,
      'Business Rules': Icons.rule_outlined,
      'Process Automation': Icons.auto_awesome_outlined,
      'Task Management': Icons.task_alt_outlined,
      'Triggers': Icons.bolt_outlined,
      'SLAs & Escalations': Icons.timer_outlined,
      'Process Monitoring': Icons.monitor_heart_outlined,
      'Workflow Templates': Icons.dashboard_customize_outlined,

      // ==========================================================
      // 7. DOCUMENT MANAGEMENT
      // ==========================================================
      'Document Repository': Icons.folder_open_outlined,
      'Versioning': Icons.history_edu_outlined,
      'File Upload / Download': Icons.upload_file_outlined,
      'Access Control': Icons.lock_outline,
      'Document Templates': Icons.description_outlined,
      'Tagging & Search': Icons.label_outline,
      'Retention Policies': Icons.archive_outlined,
      'Audit Trails': Icons.fact_check_outlined,
      'OCR Integration': Icons.document_scanner_outlined,

      // ==========================================================
      // 8. SUBSCRIPTION
      // ==========================================================
      'Plans & Features': Icons.layers_outlined,
      'Tenant Subscriptions': Icons.card_membership_outlined,
      'Usage & Quotas': Icons.speed_outlined,
      'Payment Tracking': Icons.payment_outlined,
      'License Allocation': Icons.assignment_ind_outlined,
      'License Keys': Icons.vpn_key_outlined,
      'Renewals': Icons.autorenew_outlined,
      'Trial Management': Icons.hourglass_bottom_outlined,
      'Billing Integration': Icons.receipt_outlined,

      // ==========================================================
      // 9. REVENUE
      // ==========================================================
      'Revenue Tracking': Icons.trending_up_outlined,
      'Usage Analytics': Icons.analytics_outlined,
      'Forecasting': Icons.insights_outlined,
      'Revenue Reports': Icons.bar_chart_outlined,
      'Revenue Recognition': Icons.fact_check_outlined,
      'Commission': Icons.percent_outlined,
      'Financial Analytics': Icons.query_stats_outlined,
      'Invoicing': Icons.receipt_outlined,
      'Integration': Icons.integration_instructions_outlined,

      // ==========================================================
      // 10. REPORTING & BI
      // ==========================================================
      'Standard Reports': Icons.description_outlined,
      'Ad-hoc Reports': Icons.article_outlined,
      'Data Exploration': Icons.explore_outlined,
      'BI Management': Icons.dashboard_customize_outlined,
      'Data Export': Icons.file_download_outlined,
      'Scheduled Reports': Icons.schedule_outlined,
      'Data Visualization': Icons.pie_chart_outline,
      'Self-Service Analytics': Icons.analytics_outlined,

      // ==========================================================
      // 11. ENTERPRISE AI
      // ==========================================================
      'AI Models': Icons.model_training_outlined,
      'AI Chat / Copilot': Icons.smart_toy_outlined,
      'Document AI / OCR': Icons.document_scanner_outlined,
      'Predictive Analytics': Icons.query_stats_outlined,
      'Recommendations': Icons.recommend_outlined,
      'AI Workflows': Icons.auto_awesome_motion_outlined,
      'Model Management': Icons.settings_suggest_outlined,
      'Prompt Engineering': Icons.edit_note_outlined,
      'AI Usage Logs': Icons.list_alt_outlined,

      // ==========================================================
      // 12. NOTIFICATION
      // ==========================================================
      'In-App Notifications': Icons.notifications_outlined,
      'Email Notifications': Icons.email_outlined,
      'SMS Notifications': Icons.sms_outlined,
      'Push Notifications': Icons.notifications_active_outlined,
      'Templates': Icons.article_outlined,
      'Preferences': Icons.tune_outlined,
      'Schedules': Icons.schedule_outlined,
      'Delivery Tracking': Icons.local_shipping_outlined,
      'Multi-Channel': Icons.hub_outlined,

      // ==========================================================
      // 13. CALENDAR
      // ==========================================================
      'User Calendars': Icons.calendar_month_outlined,
      'Team Calendars': Icons.groups_outlined,
      'Meeting Scheduler': Icons.event_outlined,
      'Resource Booking': Icons.event_available_outlined,
      'Reminders': Icons.alarm_outlined,
      'Notifications': Icons.notifications_none_outlined,
      'Google / Outlook': Icons.sync_outlined,
      'Availability': Icons.access_time_outlined,
      'Event Notifications': Icons.notifications_active_outlined,
      'Shared Calendars': Icons.share_outlined,

      // ==========================================================
      // 14. INTEGRATION
      // ==========================================================
      'API Management': Icons.api_outlined,
      'Third-Party Integrations': Icons.integration_instructions_outlined,
      'Webhooks': Icons.webhook_outlined,
      'Event Streaming': Icons.stream_outlined,
      'Data Transformation': Icons.transform_outlined,
      'ETL / Data Sync': Icons.sync_alt_outlined,
      'Connectors': Icons.cable_outlined,
      'Integration Logs': Icons.list_alt_outlined,

      // ==========================================================
      // 15. SEARCH
      // ==========================================================
      'Global Search': Icons.search_outlined,
      'Index Management': Icons.storage_outlined,
      'Search Analytics': Icons.analytics_outlined,
      'Autocomplete': Icons.text_fields_outlined,
      'Relevance Ranking': Icons.sort_outlined,
      'Saved Searches': Icons.bookmark_outline,
      'Multi-Tenant Index': Icons.dns_outlined,
      'Synonyms': Icons.compare_arrows_outlined,
      'Suggestion Engine': Icons.tips_and_updates_outlined,

      // ==========================================================
      // 16. SECURITY & COMPLIANCE
      // ==========================================================
      'Audit Logs': Icons.fact_check_outlined,
      'Activity Tracking': Icons.timeline_outlined,
      'Compliance Reports': Icons.gavel_outlined,
      'Data Retention': Icons.archive_outlined,
      'Policy Management': Icons.policy_outlined,
      'Threat Detection': Icons.shield_outlined,
      'Vulnerability Management': Icons.bug_report_outlined,
      'Encryption & Key Management': Icons.enhanced_encryption_outlined,
      'Security Alerts': Icons.warning_amber_outlined,
    };

    return Column(
      children: items.map((item) {
        return _sidebarSubItem(
          item,
          selectedMenu == item,
          () {
            setState(() {
              selectedMenu = item;
            });
          },
          icon: subItemIcons[item],
        );
      }).toList(),
    );
  }

  // ============================================================
  // SIMPLE SIDEBAR ITEM (Dashboard / Logout — no expand arrow)
  // ============================================================

  Widget _sidebarSimpleItem({
    required IconData icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 46,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF163B7A)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? Colors.white
                  : const Color(0xFF8B9AB7),
              size: 21,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFFB2BCD0),
                  fontSize: 12,
                  fontWeight:
                      selected ? FontWeight.w700 : FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EXPANDABLE SIDEBAR ITEM
  // ============================================================

  Widget _sidebarExpandableItem({
    required IconData icon,
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required VoidCallback onArrowTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 46,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF8B9AB7),
              size: 21,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFB2BCD0),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ),

            InkWell(
              onTap: onArrowTap,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xFF71819F),
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // COLORED SIDEBAR ITEM
  // ============================================================

  Widget _sidebarItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 46,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 18,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFB2BCD0),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Color(0xFF71819F),
              size: 17,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SIDEBAR SUB ITEM
  // ============================================================

  Widget _sidebarSubItem(
    String title,
    bool selected,
    VoidCallback onTap, {
    IconData? icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(left: 28),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF163B7A)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            // Submenu Icon
            Icon(
              icon,
              color: selected
                  ? Colors.white
                  : const Color(0xFF71819F),
              size: 16,
            ),

            const SizedBox(width: 10),

            // Submenu Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF8795B0),
                  fontSize: 10.5,
                  fontWeight: selected
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MAIN AREA
  // ============================================================

  Widget _buildMainArea() {
    return Column(
      children: [
        // ======================================================
        // FIXED TOP BAR
        // ======================================================

        Container(
          color: const Color(0xFFF5F7FB),
          padding: const EdgeInsets.fromLTRB(
            28,
            22,
            28,
            15,
          ),
          child: _buildTopBar(),
        ),

        // ======================================================
        // FIXED WELCOME BANNER
        // ======================================================

        Container(
          color: const Color(0xFFF5F7FB),
          padding: const EdgeInsets.fromLTRB(
            28,
            8,
            28,
            0,
          ),
          child: _buildWelcomeBanner(),
        ),

        // ======================================================
        // ONLY THIS PART WILL SCROLL
        // ======================================================

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              28,
              22,
              28,
              35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStats(),

                const SizedBox(height: 27),

                _buildServicesHeader(),

                const SizedBox(height: 13),

                _buildServicesTable(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
  return Row(
    children: [

      // ==========================================
      // COLLAPSE ICON
      // ==========================================

      IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(
          minWidth: 32,
          minHeight: 32,
        ),
        icon: const Icon(
          Icons.keyboard_double_arrow_left,
          color: Color(0xFF71819F),
          size: 25,
        ),
      ),

      const SizedBox(width: 14),

      // ==========================================
      // SEARCH BAR
      // ==========================================

      Container(
        width: 350,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: const Color(0xFFE4E8F0),
          ),
        ),
        child: const Row(
          children: [
            SizedBox(width: 14),

            Icon(
              Icons.search,
              size: 19,
              color: Color(0xFF9BA5B7),
            ),

            SizedBox(width: 10),

            Text(
              'Search...',
              style: TextStyle(
                color: Color(0xFFA0A9BA),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),

      // ==========================================
      // NOTIFICATION - SEARCH BAR PAKKATHULA
      // ==========================================

      const SizedBox(width: 18),

      Container(
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

      // ==========================================
      // GAP
      // ==========================================

      const Spacer(),

      // ==========================================
      // ADMIN PROFILE - FAR RIGHT
      // ==========================================

      Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: const Text(
          'AD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      const SizedBox(width: 10),

      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Admin User',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202A3A),
            ),
          ),

          SizedBox(height: 2),

          Text(
            'Administrator',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF8A94A6),
            ),
          ),
        ],
      ),
    ],
  );
}



















































  // ============================================================
  // WELCOME BANNER
  // ============================================================
  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        10,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF1769FF),
            Color(0xFF2E82FF),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to OneCloud Enterprise Platform',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'A unified enterprise platform that connects domain microservices, business operations, automation, analytics, AI, and security in one powerful ecosystem.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.88),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    _welcomeChip(
                      Icons.apps_outlined,
                      '16 Domain Services',
                    ),
                    const SizedBox(width: 7),
                    _welcomeChip(
                      Icons.cloud_done_outlined,
                      'Cloud Ready',
                    ),
                    const SizedBox(width: 7),
                    _welcomeChip(
                      Icons.security_outlined,
                      'Secure Platform',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cloud_done_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WELCOME CHIP
  // ============================================================

  Widget _welcomeChip(
    IconData icon,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 13,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  Widget _buildStats() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E9F2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          if (width >= 950) {
            return Row(
              children: [
                Expanded(
                  child: _statCard(
                    icon: Icons.people_alt_outlined,
                    title: 'TOTAL USERS',
                    value: '12,480',
                    label: 'Active users',
                    change: '+12.5%',
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _statCard(
                    icon: Icons.cloud_outlined,
                    title: 'CLOUD SERVICES',
                    value: '248',
                    label: 'Running services',
                    change: '+8.2%',
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _statCard(
                    icon: Icons.bolt_outlined,
                    title: 'TOTAL REQUESTS',
                    value: '1.2M',
                    label: 'This month',
                    change: '+18.7%',
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _statCard(
                    icon: Icons.analytics_outlined,
                    title: 'SYSTEM UPTIME',
                    value: '99.9%',
                    label: 'Last 30 days',
                    change: '+0.3%',
                  ),
                ),
              ],
            );
          }

          return Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              SizedBox(
                width: (width - 14) / 2,
                child: _statCard(
                  icon: Icons.people_alt_outlined,
                  title: 'TOTAL USERS',
                  value: '12,480',
                  label: 'Active users',
                  change: '+12.5%',
                ),
              ),

              SizedBox(
                width: (width - 14) / 2,
                child: _statCard(
                  icon: Icons.cloud_outlined,
                  title: 'CLOUD SERVICES',
                  value: '248',
                  label: 'Running services',
                  change: '+8.2%',
                ),
              ),

              SizedBox(
                width: (width - 14) / 2,
                child: _statCard(
                  icon: Icons.bolt_outlined,
                  title: 'TOTAL REQUESTS',
                  value: '1.2M',
                  label: 'This month',
                  change: '+18.7%',
                ),
              ),

              SizedBox(
                width: (width - 14) / 2,
                child: _statCard(
                  icon: Icons.analytics_outlined,
                  title: 'SYSTEM UPTIME',
                  value: '99.9%',
                  label: 'Last 30 days',
                  change: '+0.3%',
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required String label,
    required String change,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 115,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFC),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: const Color(0xFFE8ECF3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: primaryBlue,
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF7A8499),
                    letterSpacing: 0.4,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 2),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8A93A5),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Text(
                      change,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF16A36A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICES HEADER
  // ============================================================

  Widget _buildServicesHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Active Cloud Cluster Services',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172033),
                ),
              ),

              SizedBox(height: 5),

              Text(
                'Monitor and manage your active enterprise domain services.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8791A3),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF8F1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.circle,
                size: 7,
                color: Color(0xFF16A36A),
              ),

              SizedBox(width: 7),

              Text(
                'All Systems Operational',
                style: TextStyle(
                  color: Color(0xFF168A59),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SERVICES TABLE
  // ============================================================

  Widget _buildServicesTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFE4E8F0),
        ),
      ),
      child: Column(
        children: [
          // ======================================================
          // TABLE HEADER
          // ======================================================

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAFC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'SERVICE',
                    style: _tableHeaderStyle,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    'STATUS',
                    style: _tableHeaderStyle,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    'REGION',
                    style: _tableHeaderStyle,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    'UPTIME',
                    style: _tableHeaderStyle,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    'REQUESTS',
                    style: _tableHeaderStyle,
                  ),
                ),
              ],
            ),
          ),

          // ======================================================
          // SERVICE ROWS
          // ======================================================

          _serviceRow(
            icon: Icons.settings_outlined,
            name: 'Platform Administration',
            description: 'Core platform services',
            region: 'Asia South',
            uptime: '99.99%',
            requests: '248K',
          ),

          _serviceRow(
            icon: Icons.people_outline,
            name: 'HRMS Service',
            description: 'Human resource management',
            region: 'Asia South',
            uptime: '99.98%',
            requests: '182K',
          ),

          _serviceRow(
            icon: Icons.groups_outlined,
            name: 'CRM Service',
            description: 'Customer relationship management',
            region: 'Asia South',
            uptime: '99.97%',
            requests: '316K',
          ),

          _serviceRow(
            icon: Icons.business_center_outlined,
            name: 'ERP Service',
            description: 'Enterprise resource planning',
            region: 'Asia South',
            uptime: '99.96%',
            requests: '195K',
          ),

          _serviceRow(
            icon: Icons.account_balance_outlined,
            name: 'Finance & Accounting',
            description: 'Financial operations',
            region: 'Asia South',
            uptime: '99.99%',
            requests: '124K',
          ),

          _serviceRow(
            icon: Icons.account_tree_outlined,
            name: 'Workflow & Automation',
            description: 'Business workflow automation',
            region: 'Asia South',
            uptime: '99.95%',
            requests: '98K',
          ),

          _serviceRow(
            icon: Icons.description_outlined,
            name: 'Document Management',
            description: 'Enterprise document services',
            region: 'Asia South',
            uptime: '99.94%',
            requests: '86K',
          ),

          _serviceRow(
            icon: Icons.card_membership_outlined,
            name: 'Subscription Service',
            description: 'Plans and subscription management',
            region: 'Asia South',
            uptime: '99.96%',
            requests: '74K',
          ),

          _serviceRow(
            icon: Icons.trending_up_outlined,
            name: 'Revenue Service',
            description: 'Revenue tracking and analytics',
            region: 'Asia South',
            uptime: '99.93%',
            requests: '69K',
          ),

          _serviceRow(
            icon: Icons.bar_chart_outlined,
            name: 'Reporting & BI',
            description: 'Business intelligence and reporting',
            region: 'Asia South',
            uptime: '99.95%',
            requests: '61K',
          ),

          _serviceRow(
            icon: Icons.auto_awesome_outlined,
            name: 'Enterprise AI',
            description: 'AI and intelligent automation',
            region: 'Asia South',
            uptime: '99.92%',
            requests: '76K',
          ),

          _serviceRow(
            icon: Icons.notifications_none_outlined,
            name: 'Notification Service',
            description: 'Multi-channel notifications',
            region: 'Asia South',
            uptime: '99.97%',
            requests: '54K',
          ),

          _serviceRow(
            icon: Icons.calendar_month_outlined,
            name: 'Calendar Service',
            description: 'Calendar and meeting management',
            region: 'Asia South',
            uptime: '99.96%',
            requests: '42K',
          ),

          _serviceRow(
            icon: Icons.integration_instructions_outlined,
            name: 'Integration Service',
            description: 'API and third-party integrations',
            region: 'Asia South',
            uptime: '99.94%',
            requests: '38K',
          ),

          _serviceRow(
            icon: Icons.search_outlined,
            name: 'Search Service',
            description: 'Global enterprise search',
            region: 'Asia South',
            uptime: '99.98%',
            requests: '91K',
          ),

          _serviceRow(
            icon: Icons.security_outlined,
            name: 'Security & Compliance',
            description: 'Security, audit and compliance',
            region: 'Asia South',
            uptime: '99.99%',
            requests: '47K',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICE ROW
  // ============================================================

  Widget _serviceRow({
    required IconData icon,
    required String name,
    required String description,
    required String region,
    required String uptime,
    required String requests,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFECEFF4),
            width: 0.7,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF1FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: primaryBlue,
                    size: 18,
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202A3A),
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8B95A7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: _statusBadge(),
          ),

          Expanded(
            flex: 2,
            child: Text(
              region,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF667085),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              uptime,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF168A59),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              requests,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF465267),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS BADGE
  // ============================================================

  Widget _statusBadge() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF8F1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: Color(0xFF16A36A),
            ),

            SizedBox(width: 6),

            Text(
              'Operational',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Color(0xFF168A59),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// TABLE HEADER STYLE
// ================================================================

const TextStyle _tableHeaderStyle = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w800,
  color: Color(0xFF7E899D),
  letterSpacing: 0.5,
);
