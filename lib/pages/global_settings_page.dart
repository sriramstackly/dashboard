import 'package:flutter/material.dart';

/// ============================================================
/// GLOBAL SETTINGS PAGE
/// ============================================================
/// IMPORTANT: this page is shown INSIDE the Landing Page, which
/// already has the top bar, sidebar and a scroll view.
/// So this page must NOT use Scaffold / AppBar / Expanded /
/// its own SingleChildScrollView. It only returns a Column.
class GlobalSettingsPage extends StatefulWidget {
  const GlobalSettingsPage({super.key});

  @override
  State<GlobalSettingsPage> createState() => _GlobalSettingsPageState();
}

class _GlobalSettingsPageState extends State<GlobalSettingsPage> {
  // ============================================================
  // COLORS (same as the Landing Page)
  // ============================================================
  static const Color primaryBlue = Color(0xFF1769FF);
  static const Color titleColor = Color(0xFF172033);
  static const Color textStrong = Color(0xFF202A3A);
  static const Color textMuted = Color(0xFF6B7487);
  static const Color borderColor = Color(0xFFD5DBE7);
  static const Color softBlue = Color(0xFFEAF1FF);

  // ============================================================
  // SWITCH VALUES
  // ============================================================
  bool maintenanceMode = false;
  bool allowRegistration = true;
  bool autoApprove = true;
  bool auditLogging = true;
  bool mfa = true;

  bool emailNotification = false;
  bool smsNotification = false;
  bool pushNotification = false;

  bool maintenanceBanner = false;

  // ============================================================
  // DROPDOWN VALUES
  // ============================================================
  String language = 'English';
  String timezone = 'Asia/Kolkata (UTC+05:30)';
  String dateFormat = 'DD/MM/YYYY';
  String timeFormat = '24 Hours';
  String currency = 'INR';
  String theme = 'Light';

  // ============================================================
  // TEXT CONTROLLERS
  // ============================================================
  final TextEditingController passwordPolicyController =
      TextEditingController(text: 'Minimum 8 characters');
  final TextEditingController sessionTimeoutController =
      TextEditingController(text: '30 minutes');
  final TextEditingController fileUploadController =
      TextEditingController(text: '100 MB');

  @override
  void dispose() {
    passwordPolicyController.dispose();
    sessionTimeoutController.dispose();
    fileUploadController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 600;
        final bool wide = constraints.maxWidth >= 900;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(mobile),
            const SizedBox(height: 22),

            _sectionLabel('PLATFORM & REGIONAL'),
            const SizedBox(height: 10),
            _pair(wide, _platformBehaviorCard(), _regionalCard()),
            const SizedBox(height: 24),

            _sectionLabel('SECURITY & NOTIFICATIONS'),
            const SizedBox(height: 10),
            _pair(wide, _securityCard(), _notificationCard()),
            const SizedBox(height: 24),

            _sectionLabel('CONFIGURATION'),
            const SizedBox(height: 10),
            _pair(wide, _platformSettingsCard(), _infoCard()),
            const SizedBox(height: 24),

            _buildBottomButtons(mobile),
          ],
        );
      },
    );
  }

  // Two cards side by side on wide screens, stacked on small ones.
  Widget _pair(bool wide, Widget a, Widget b) {
    if (wide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: a),
          const SizedBox(width: 16),
          Expanded(child: b),
        ],
      );
    }
    return Column(children: [a, const SizedBox(height: 16), b]);
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(bool mobile) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Platform Administration / Global Settings',
          style: TextStyle(fontSize: 11, color: textMuted, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          'Global Settings',
          style: TextStyle(
            fontSize: mobile ? 22 : 24,
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Configure platform-wide settings and preferences',
          style: TextStyle(fontSize: 12.5, color: textMuted),
        ),
      ],
    );

    final refreshButton = OutlinedButton.icon(
      onPressed: () => _toast('Settings refreshed.'),
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
  // CARDS
  // ============================================================

  Widget _platformBehaviorCard() {
    return _section(
      icon: Icons.tune_outlined,
      title: 'Platform behavior',
      children: [
        _switchSetting(
          title: 'Maintenance mode',
          description: 'Temporarily disable platform access during maintenance',
          value: maintenanceMode,
          onChanged: (v) => setState(() => maintenanceMode = v),
        ),
        _switchSetting(
          title: 'Allow tenant self-signup',
          description: 'Allow users to create accounts without admin approval',
          value: allowRegistration,
          onChanged: (v) => setState(() => allowRegistration = v),
        ),
        _switchSetting(
          title: 'Auto approve requests',
          description: 'Automatically approve new organization requests',
          value: autoApprove,
          onChanged: (v) => setState(() => autoApprove = v),
        ),
        _switchSetting(
          title: 'Enable audit logging',
          description: 'Track administrative and system activities',
          value: auditLogging,
          isLast: true,
          onChanged: (v) => setState(() => auditLogging = v),
        ),
      ],
    );
  }

  Widget _regionalCard() {
    return _section(
      icon: Icons.language,
      title: 'Regional settings',
      children: [
        _dropdownField(
          label: 'Default language',
          value: language,
          items: const ['English', 'Tamil', 'Hindi'],
          onChanged: (v) => setState(() => language = v),
        ),
        _dropdownField(
          label: 'Time zone',
          value: timezone,
          items: const [
            'Asia/Kolkata (UTC+05:30)',
            'UTC',
            'America/New_York',
            'Europe/London',
          ],
          onChanged: (v) => setState(() => timezone = v),
        ),
        _dropdownField(
          label: 'Date format',
          value: dateFormat,
          items: const ['DD/MM/YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'],
          onChanged: (v) => setState(() => dateFormat = v),
        ),
        _dropdownField(
          label: 'Time format',
          value: timeFormat,
          items: const ['24 Hours', '12 Hours'],
          onChanged: (v) => setState(() => timeFormat = v),
        ),
        _dropdownField(
          label: 'Default currency',
          value: currency,
          items: const ['INR', 'USD', 'EUR', 'GBP'],
          isLast: true,
          onChanged: (v) => setState(() => currency = v),
        ),
      ],
    );
  }

  Widget _securityCard() {
    return _section(
      icon: Icons.shield_outlined,
      title: 'Security settings',
      children: [
        _textField(label: 'Password policy', controller: passwordPolicyController),
        _textField(label: 'Session timeout', controller: sessionTimeoutController),
        _switchSetting(
          title: 'Multi-factor authentication',
          description: 'Require MFA for administrative accounts',
          value: mfa,
          isLast: true,
          onChanged: (v) => setState(() => mfa = v),
        ),
      ],
    );
  }

  Widget _notificationCard() {
    return _section(
      icon: Icons.notifications_none_outlined,
      title: 'Notification settings',
      children: [
        _checkBoxSetting(
          title: 'Email notifications',
          value: emailNotification,
          onChanged: (v) => setState(() => emailNotification = v),
        ),
        _checkBoxSetting(
          title: 'SMS notifications',
          value: smsNotification,
          onChanged: (v) => setState(() => smsNotification = v),
        ),
        _checkBoxSetting(
          title: 'Push notifications',
          value: pushNotification,
          onChanged: (v) => setState(() => pushNotification = v),
        ),
      ],
    );
  }

  Widget _platformSettingsCard() {
    return _section(
      icon: Icons.settings_outlined,
      title: 'Platform settings',
      children: [
        _textField(label: 'Maximum file upload size', controller: fileUploadController),
        _dropdownField(
          label: 'Default theme',
          value: theme,
          items: const ['Light', 'Dark', 'System'],
          onChanged: (v) => setState(() => theme = v),
        ),
        _switchSetting(
          title: 'Maintenance banner',
          description: 'Show maintenance notification to users',
          value: maintenanceBanner,
          isLast: true,
          onChanged: (v) => setState(() => maintenanceBanner = v),
        ),
      ],
    );
  }

  Widget _infoCard() {
    return _section(
      icon: Icons.info_outline,
      title: 'Configuration information',
      children: [
        _infoRow('Last updated by', 'Super Administrator'),
        _infoRow('Last updated on', '09-10-2026 09:30', isLast: true),
      ],
    );
  }

  // ============================================================
  // BOTTOM BUTTONS (inside the page, not pinned to the screen)
  // ============================================================

  Widget _buildBottomButtons(bool mobile) {
    final discard = OutlinedButton(
      onPressed: _discardChanges,
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF354258),
        side: const BorderSide(color: Color(0xFFC9D0DD)),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
      child: const Text('Discard'),
    );

    final save = ElevatedButton.icon(
      onPressed: _saveSettings,
      icon: const Icon(Icons.save_outlined, size: 17),
      label: const Text('Save changes'),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: mobile
          ? Row(
              children: [
                Expanded(child: discard),
                const SizedBox(width: 10),
                Expanded(child: save),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [discard, const SizedBox(width: 10), save],
            ),
    );
  }

  // ============================================================
  // ACTIONS
  // ============================================================

  void _saveSettings() {
    FocusScope.of(context).unfocus();
    // TODO: send the settings to your real API here.
    _toast('Global settings saved successfully');
  }

  // Resets everything to the default values (does NOT leave the page).
  void _discardChanges() {
    FocusScope.of(context).unfocus();
    setState(() {
      maintenanceMode = false;
      allowRegistration = true;
      autoApprove = true;
      auditLogging = true;
      mfa = true;
      emailNotification = false;
      smsNotification = false;
      pushNotification = false;
      maintenanceBanner = false;

      language = 'English';
      timezone = 'Asia/Kolkata (UTC+05:30)';
      dateFormat = 'DD/MM/YYYY';
      timeFormat = '24 Hours';
      currency = 'INR';
      theme = 'Light';

      passwordPolicyController.text = 'Minimum 8 characters';
      sessionTimeoutController.text = '30 minutes';
      fileUploadController.text = '100 MB';
    });
    _toast('Changes discarded.');
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  // ============================================================
  // REUSABLE WIDGETS
  // ============================================================

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: borderColor),
    );
  }

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

  Widget _section({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: softBlue,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, color: primaryBlue, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: titleColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFE3E8F0), height: 1),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _switchSetting({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE3E8F0))),
      ),
      child: Row(
        children: [
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
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Switch(
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
                  ? primaryBlue
                  : const Color(0xFFC9D0DD),
            ),
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF354258),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: borderColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(Icons.expand_more, size: 18, color: textMuted),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(9),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: textStrong,
                ),
                items: [
                  for (final item in items)
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, overflow: TextOverflow.ellipsis),
                    ),
                ],
                onChanged: (v) {
                  if (v != null) onChanged(v);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField({
    required String label,
    required TextEditingController controller,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF354258),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 42,
            child: TextField(
              controller: controller,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: textStrong,
              ),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: primaryBlue, width: 1.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkBoxSetting({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Checkbox(
                value: value,
                onChanged: (v) => onChanged(v ?? false),
                activeColor: primaryBlue,
                side: const BorderSide(color: Color(0xFFB9C2CE), width: 1.2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: textStrong,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE3E8F0))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: textMuted),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: textStrong,
              ),
            ),
          ),
        ],
      ),
    );
  }
}