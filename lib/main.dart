import 'package:flutter/material.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

// ======================================================
// APP
// ======================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complete Business Solution',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 14,
          ),
          prefixIconColor: const Color(0xFF64748B),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF1565C0),
              width: 2,
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ======================================================
// LOGIN PAGE
// ======================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool rememberMe = false;

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your username and password'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LandingPage(),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isWide
            ? Row(
                children: [
                  // Left branding panel — only shown on wide screens
                  Expanded(
                    flex: 6,
                    child: _BrandingPanel(),
                  ),
                  // Right login panel
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 30,
                        ),
                        child: _LoginCard(
                          usernameController: usernameController,
                          passwordController: passwordController,
                          hidePassword: hidePassword,
                          rememberMe: rememberMe,
                          onTogglePassword: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          onToggleRemember: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                          onLogin: login,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Center(
                  child: _LoginCard(
                    usernameController: usernameController,
                    passwordController: passwordController,
                    hidePassword: hidePassword,
                    rememberMe: rememberMe,
                    onTogglePassword: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    onToggleRemember: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                    onLogin: login,
                  ),
                ),
              ),
      ),
    );
  }
}

// ======================================================
// LEFT BRANDING PANEL
// ======================================================

class _BrandingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFDCEEFB),
            Color(0xFFBFE0F7),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo row
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.bolt, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Complete Business Solution',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Headline
            const Text(
              'Smart CRM.\nStronger Relationships.\nBetter Growth.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 1.25,
                color: Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              'Manage leads, contacts, projects, tasks and your entire business in one place.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF475569),
              ),
            ),

            const SizedBox(height: 40),

            // Feature grid
            Wrap(
              spacing: 30,
              runSpacing: 24,
              children: const [
                _FeatureItem(
                  icon: Icons.people_outline,
                  title: 'Manage Contacts',
                  subtitle: 'Organize and nurture customer relationships.',
                ),
                _FeatureItem(
                  icon: Icons.trending_up,
                  title: 'Track Projects',
                  subtitle: 'Plan, monitor and deliver projects efficiently.',
                ),
                _FeatureItem(
                  icon: Icons.schedule,
                  title: 'Automate Tasks',
                  subtitle: 'Automate workflows and improve productivity.',
                ),
                _FeatureItem(
                  icon: Icons.bar_chart,
                  title: 'Powerful Reports',
                  subtitle: 'Get real-time insights and make data-driven decisions.',
                ),
              ],
            ),

            const SizedBox(height: 45),

            // Dashboard preview mockup
            const _DashboardPreview(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF1565C0), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardPreview extends StatelessWidget {
  const _DashboardPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 560),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _DashStat(label: 'Total Leads', value: '1,248'),
              const SizedBox(width: 10),
              _DashStat(label: 'Active Deals', value: '842'),
              const SizedBox(width: 10),
              _DashStat(label: 'Won Deals', value: '328'),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sales Pipeline',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.65,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF3B82F6)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashStat extends StatelessWidget {
  final String label;
  final String value;

  const _DashStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// LOGIN CARD (right side)
// ======================================================

class _LoginCard extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool hidePassword;
  final bool rememberMe;
  final VoidCallback onTogglePassword;
  final ValueChanged<bool?> onToggleRemember;
  final VoidCallback onLogin;

  const _LoginCard({
    required this.usernameController,
    required this.passwordController,
    required this.hidePassword,
    required this.rememberMe,
    required this.onTogglePassword,
    required this.onToggleRemember,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(34),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Welcome Back!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Login to your Complete Business Solution account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            'Username',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),
          const SizedBox(height: 9),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: 'Enter your username',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),

          const SizedBox(height: 21),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF334155),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF1565C0),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          TextField(
            controller: passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                onPressed: onTogglePassword,
                icon: Icon(
                  hidePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: const Color(0xFF1565C0),
                onChanged: onToggleRemember,
              ),
              const Text(
                'Remember me',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                children: [
                  const TextSpan(text: '© 2026 Complete Business Solution. All rights reserved.\n'),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.w600),
                    recognizer: null,
                  ),
                  const TextSpan(text: '   |   '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: const TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.w600),
                    recognizer: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// FORGOT PASSWORD PAGE
// ======================================================

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  void sendResetLink() {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link sent successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCEEFB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 420,
              padding: const EdgeInsets.all(34),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF1565C0)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your email address and we will send you a link to reset your password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 26),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: sendResetLink,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Send Reset Link',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Back to Sign In',
                      style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
