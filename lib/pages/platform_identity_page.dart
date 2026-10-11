import 'package:flutter/material.dart';

class PlatformIdentityPage extends StatefulWidget {
  const PlatformIdentityPage({super.key});

  @override
  State<PlatformIdentityPage> createState() =>
      _PlatformIdentityPageState();
}

class _PlatformIdentityPageState
    extends State<PlatformIdentityPage> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController platformNameController =
      TextEditingController(
    text: 'Java Enterprise Suite',
  );

  final TextEditingController companyNameController =
      TextEditingController(
    text: 'Oracle Corporation',
  );

  final TextEditingController taglineController =
      TextEditingController(
    text: 'Empowering Enterprise Intelligence',
  );

  final TextEditingController welcomeMessageController =
      TextEditingController(
    text:
        'Welcome to Java Enterprise Suite.\nPlease authenticate to continue.',
  );

  final TextEditingController footerController =
      TextEditingController(
    text: 'System Maintained by IT Dept.',
  );

  final TextEditingController copyrightController =
      TextEditingController(
    text:
        '© 2024 platform branding. All rights reserved.',
  );

  final TextEditingController primaryColorController =
      TextEditingController(
    text: '#1976D2',
  );

  final TextEditingController secondaryColorController =
      TextEditingController(
    text: '#FFFFFF',
  );

  final TextEditingController accentColorController =
      TextEditingController(
    text: '#4CAF50',
  );

  bool lightMode = true;

  // ============================================================
  // COLORS
  // ============================================================

  static const Color blue =
      Color(0xFF1976D2);

  static const Color darkText =
      Color(0xFF202631);

  static const Color greyText =
      Color(0xFF66717D);

  static const Color borderColor =
      Color(0xFFDCE2E8);

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    platformNameController.dispose();
    companyNameController.dispose();
    taglineController.dispose();
    welcomeMessageController.dispose();
    footerController.dispose();
    copyrightController.dispose();
    primaryColorController.dispose();
    secondaryColorController.dispose();
    accentColorController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile =
            constraints.maxWidth < 800;

        if (mobile) {
          return _mobileLayout();
        }

        return _desktopLayout();
      },
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        _pageHeader(),

        const SizedBox(height: 12),

        _platformIdentityCard(),

        const SizedBox(height: 10),

        _visualAssetsCard(),

        const SizedBox(height: 10),

        _loginBackgroundCard(),

        const SizedBox(height: 10),

        _welcomeMessageCard(),

        const SizedBox(height: 10),

        _securityRulesCard(),

        const SizedBox(height: 10),

        _themeConfigurationCard(),

        const SizedBox(height: 14),

        _bottomButtons(),
      ],
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _desktopLayout() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        _pageHeader(),

        const SizedBox(height: 14),

        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _platformIdentityCard(),

                  const SizedBox(height: 12),

                  _visualAssetsCard(),

                  const SizedBox(height: 12),

                  _themeConfigurationCard(),
                ],
              ),
            ),

            const SizedBox(width: 14),

            SizedBox(
              width: 292,
              child: Column(
                children: [
                  _loginBackgroundCard(),

                  const SizedBox(height: 12),

                  _welcomeMessageCard(),

                  const SizedBox(height: 12),

                  _securityRulesCard(),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        _bottomButtons(),
      ],
    );
  }

  // ============================================================
  // PAGE HEADER
  // ============================================================

  Widget _pageHeader() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: const [
        Text(
          'Platform Administration / Platform Identity',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF7A8490),
          ),
        ),

        SizedBox(height: 4),

        Text(
          'Platform Identity',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: darkText,
          ),
        ),

        SizedBox(height: 3),

        Text(
          'Manage platform identity, branding, login appearance and theme.',
          style: TextStyle(
            fontSize: 10,
            color: greyText,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PLATFORM IDENTITY
  // ============================================================

  Widget _platformIdentityCard() {
    return _sectionCard(
      title: 'Platform Identity',
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3F5),
          borderRadius:
              BorderRadius.circular(5),
        ),
        child: const Text(
          'Basic Info',
          style: TextStyle(
            fontSize: 8,
            color: greyText,
          ),
        ),
      ),
      child: Column(
        children: [
          _textField(
            label: 'Platform Name',
            controller:
                platformNameController,
          ),

          const SizedBox(height: 10),

          _textField(
            label: 'Company Name',
            controller:
                companyNameController,
          ),

          const SizedBox(height: 10),

          _textField(
            label: 'Tagline',
            controller:
                taglineController,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // VISUAL ASSETS
  // ============================================================

  Widget _visualAssetsCard() {
    return _sectionCard(
      title: 'Visual Assets',
      trailing: const Text(
        'PNG, SVG up to 5MB.',
        style: TextStyle(
          fontSize: 8,
          color: Color(0xFF9299A2),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _companyLogo(),

          const SizedBox(height: 12),

          _favicon(),

          const SizedBox(height: 12),

          _emailHeaderLogo(),

          const SizedBox(height: 12),

          _textField(
            label: 'Footer Text',
            controller:
                footerController,
          ),

          const SizedBox(height: 10),

          _textField(
            label: 'Copyright Text',
            controller:
                copyrightController,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMPANY LOGO
  // ============================================================

  Widget _companyLogo() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Company Logo',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4C5663),
          ),
        ),

        const SizedBox(height: 6),

        Container(
          width: double.infinity,
          height: 105,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(
              color: borderColor,
            ),
            borderRadius:
                BorderRadius.circular(6),
          ),
          child: Center(
            child: Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                const Icon(
                  Icons.business,
                  size: 27,
                  color: blue,
                ),

                const SizedBox(width: 7),

                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SYNERGY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(0xFF176CB7),
                      ),
                    ),

                    Text(
                      'ENTERPRISE SOFTWARE',
                      style: TextStyle(
                        fontSize: 5,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FAVICON
  // ============================================================

  Widget _favicon() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Favicon',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4C5663),
          ),
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius:
                    BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.star_border,
                size: 18,
                color: blue,
              ),
            ),

            const SizedBox(width: 10),

            OutlinedButton(
              onPressed: () {},

              style:
                  OutlinedButton.styleFrom(
                minimumSize:
                    const Size(105, 36),
                side:
                    const BorderSide(
                  color: borderColor,
                ),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    5,
                  ),
                ),
              ),

              child: const Text(
                'Upload Favicon',
                style: TextStyle(
                  fontSize: 8,
                  color: darkText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // EMAIL HEADER LOGO
  // ============================================================

  Widget _emailHeaderLogo() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Email Header Logo',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4C5663),
          ),
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 36,
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment:
                    Alignment.centerLeft,
                decoration: BoxDecoration(
                  color:
                      const Color(0xFFF9FAFB),
                  border: Border.all(
                    color: borderColor,
                  ),
                  borderRadius:
                      BorderRadius.circular(5),
                ),
                child: const Text(
                  'No file chosen',
                  style: TextStyle(
                    fontSize: 8,
                    color: greyText,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            OutlinedButton(
              onPressed: () {},

              style:
                  OutlinedButton.styleFrom(
                minimumSize:
                    const Size(65, 36),
                side:
                    const BorderSide(
                  color: borderColor,
                ),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    5,
                  ),
                ),
              ),

              child: const Text(
                'Upload',
                style: TextStyle(
                  fontSize: 8,
                  color: darkText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // LOGIN BACKGROUND
  // ============================================================

  Widget _loginBackgroundCard() {
    return _sectionCard(
      title: 'Login Background',
      trailing: TextButton(
        onPressed: () {},

        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize:
              const Size(70, 25),
        ),

        child: const Text(
          'Change Image',
          style: TextStyle(
            fontSize: 8,
            color: blue,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Preview',
            style: TextStyle(
              fontSize: 8,
              color: greyText,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: 145,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(7),

              gradient:
                  const LinearGradient(
                begin:
                    Alignment.topLeft,
                end:
                    Alignment.bottomRight,
                colors: [
                  Color(0xFF18355A),
                  Color(0xFF4D98B3),
                  Color(0xFFDCEFF2),
                ],
              ),
            ),

            child: Center(
              child: Container(
                width: 100,
                height: 78,

                padding:
                    const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(.93),
                  borderRadius:
                      BorderRadius.circular(4),
                ),

                child: Column(
                  children: [
                    Container(
                      height: 10,
                      color:
                          const Color(
                        0xFFE1E4E7,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Container(
                      height: 11,
                      color:
                          const Color(
                        0xFFE1E4E7,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Container(
                      height: 11,
                      color:
                          const Color(
                        0xFFE1E4E7,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Container(
                      height: 15,
                      color:
                          const Color(
                        0xFF171C4C,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WELCOME MESSAGE
  // ============================================================

  Widget _welcomeMessageCard() {
    return _sectionCard(
      title: 'Welcome Message',
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome message',
            style: TextStyle(
              fontSize: 8,
              color: greyText,
            ),
          ),

          const SizedBox(height: 5),

          TextField(
            controller:
                welcomeMessageController,

            maxLines: 4,

            style: const TextStyle(
              fontSize: 9,
              color: darkText,
            ),

            decoration:
                InputDecoration(
              contentPadding:
                  const EdgeInsets.all(9),

              border:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                  6,
                ),
                borderSide:
                    const BorderSide(
                  color: borderColor,
                ),
              ),

              enabledBorder:
                  const OutlineInputBorder(
                borderSide:
                    BorderSide(
                  color: borderColor,
                ),
              ),

              counterText: '66/250',
              counterStyle:
                  const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECURITY & RULES
  // ============================================================

  Widget _securityRulesCard() {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color:
            const Color(0xFFEFF3F7),

        borderRadius:
            BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFFDDE4EB),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.security_outlined,
                size: 16,
                color: greyText,
              ),

              SizedBox(width: 6),

              Text(
                'Security & Rules',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      FontWeight.w600,
                  color: greyText,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Text(
            'VALIDATION RULES',
            style: TextStyle(
              fontSize: 8,
              fontWeight:
                  FontWeight.w700,
              color: darkText,
            ),
          ),

          const SizedBox(height: 8),

          _rule(
            'Images: PNG, JPG, SVG max 5MB.\nBackground max 10MB.',
          ),

          _rule(
            'Text fields max 100 chars;\nMessages max 250 chars.',
          ),

          _rule(
            'Colors must be valid hex values.',
          ),

          const SizedBox(height: 7),

          const Divider(
            color: Color(0xFFD7DEE6),
          ),

          const SizedBox(height: 7),

          const Text(
            'SECURITY HANDLING',
            style: TextStyle(
              fontSize: 8,
              fontWeight:
                  FontWeight.w700,
              color: darkText,
            ),
          ),

          const SizedBox(height: 8),

          _rule(
            'Super Admin (RBAC) access only.',
            icon: Icons.lock_outline,
          ),

          _rule(
            'All changes logged to Audit Trail.',
            icon: Icons.history_outlined,
          ),
        ],
      ),
    );
  }

  Widget _rule(
    String text, {
    IconData icon =
        Icons.check_circle_outline,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 8,
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Icon(
            icon,
            size: 12,
            color: greyText,
          ),

          const SizedBox(width: 7),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 8,
                height: 1.35,
                color: greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // THEME CONFIGURATION
  // ============================================================

  Widget _themeConfigurationCard() {
    return _sectionCard(
      title: 'Theme Configuration',

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Expanded(
                child: _themeButton(
                  'Light mode',
                  lightMode,
                  () {
                    setState(() {
                      lightMode = true;
                    });
                  },
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _themeButton(
                  'Dark mode',
                  !lightMode,
                  () {
                    setState(() {
                      lightMode = false;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _colorInput(
            'Primary Color',
            primaryColorController,
            const Color(0xFF1976D2),
          ),

          const SizedBox(height: 8),

          _colorInput(
            'Secondary Color',
            secondaryColorController,
            Colors.white,
          ),

          const SizedBox(height: 8),

          _colorInput(
            'Accent Color',
            accentColorController,
            const Color(0xFF4CAF50),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // THEME BUTTON
  // ============================================================

  Widget _themeButton(
    String title,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 32,

        alignment:
            Alignment.center,

        decoration: BoxDecoration(
          color: selected
              ? Colors.white
              : const Color(0xFFF1F3F5),

          borderRadius:
              BorderRadius.circular(5),

          border: Border.all(
            color: selected
                ? blue
                : borderColor,
          ),
        ),

        child: Text(
          title,
          style: TextStyle(
            fontSize: 8,
            fontWeight:
                FontWeight.w600,
            color: selected
                ? blue
                : greyText,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COLOR INPUT
  // ============================================================

  Widget _colorInput(
    String label,
    TextEditingController controller,
    Color color,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 82,

          child: Text(
            label,
            style: const TextStyle(
              fontSize: 8,
              color: greyText,
            ),
          ),
        ),

        Container(
          width: 26,
          height: 26,

          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(4),

            border: Border.all(
              color: borderColor,
            ),
          ),
        ),

        const SizedBox(width: 7),

        Expanded(
          child: SizedBox(
            height: 28,

            child: TextField(
              controller: controller,

              style:
                  const TextStyle(
                fontSize: 8,
              ),

              decoration:
                  InputDecoration(
                contentPadding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 8,
                ),

                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius
                          .circular(5),

                  borderSide:
                      const BorderSide(
                    color: borderColor,
                  ),
                ),

                enabledBorder:
                    const OutlineInputBorder(
                  borderSide:
                      BorderSide(
                    color: borderColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BOTTOM BUTTONS
  // ============================================================

  Widget _bottomButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 38,

            child: OutlinedButton(
              onPressed: () {},

              style:
                  OutlinedButton.styleFrom(
                side:
                    const BorderSide(
                  color: blue,
                ),

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    6,
                  ),
                ),
              ),

              child: const Text(
                'Preview',
                style: TextStyle(
                  fontSize: 9,
                  color: blue,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: SizedBox(
            height: 38,

            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Platform Identity saved successfully.',
                    ),
                  ),
                );
              },

              icon: const Icon(
                Icons.save_outlined,
                size: 13,
              ),

              label: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              style:
                  ElevatedButton.styleFrom(
                backgroundColor: blue,
                foregroundColor:
                    Colors.white,
                elevation: 0,

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    6,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION CARD
  // ============================================================

  Widget _sectionCard({
    required String title,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(9),

        border: Border.all(
          color:
              const Color(0xFFE1E6EC),
        ),
      ),

      clipBehavior:
          Clip.antiAlias,

      child: Column(
        children: [
          Container(
            height: 40,

            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
            ),

            decoration:
                const BoxDecoration(
              color:
                  Color(0xFFFCFCFD),

              border: Border(
                bottom: BorderSide(
                  color:
                      Color(0xFFE6EAF0),
                ),
              ),
            ),

            child: Row(
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w600,
                    color: darkText,
                  ),
                ),

                const Spacer(),

                if (trailing != null)
                  trailing,
              ],
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMMON TEXT FIELD
  // ============================================================

  Widget _textField({
    required String label,
    required TextEditingController
        controller,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 8.5,
            color: Color(0xFF424B56),
          ),
        ),

        const SizedBox(height: 5),

        TextField(
          controller: controller,

          style:
              const TextStyle(
            fontSize: 9,
            color: darkText,
          ),

          decoration:
              InputDecoration(
            isDense: true,

            contentPadding:
                const EdgeInsets
                    .symmetric(
              horizontal: 9,
              vertical: 9,
            ),

            border:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                6,
              ),

              borderSide:
                  const BorderSide(
                color: borderColor,
              ),
            ),

            enabledBorder:
                const OutlineInputBorder(
              borderSide:
                  BorderSide(
                color: borderColor,
              ),
            ),

            focusedBorder:
                const OutlineInputBorder(
              borderSide:
                  BorderSide(
                color: blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}