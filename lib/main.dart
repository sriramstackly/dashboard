

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ===============================
// APP
// ===============================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional Login',

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),

        scaffoldBackgroundColor: const Color(0xFFF8FAFC),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),

          labelStyle: const TextStyle(
            color: Color(0xFF64748B),
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
              color: Color(0xFF2563EB),
              width: 2,
            ),
          ),
        ),
      ),

      // ===============================
      // NAMED ROUTING
      // ===============================

      initialRoute: '/',

      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// ===============================
// LOGIN PAGE
// ===============================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool rememberMe = false;

  // ===============================
  // LOGIN
  // ===============================

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter your email and password",
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login successful"),
        backgroundColor: Colors.green,
      ),
    );

    // ===============================
    // ROUTING AFTER LOGIN
    // ===============================

    Navigator.pushReplacementNamed(
      context,
      '/home',
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ===============================
  // UI
  // ===============================

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Container(
              width: screenWidth > 600 ? 430 : double.infinity,

              padding: const EdgeInsets.all(32),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // ===============================
                  // LOGO
                  // ===============================

                  Center(
                    child: Container(
                      width: 70,
                      height: 70,

                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: const Icon(
                        Icons.lock_outline_rounded,
                        size: 34,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ===============================
                  // TITLE
                  // ===============================

                  const Center(
                    child: Text(
                      "Welcome Back",

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Center(
                    child: Text(
                      "Sign in to continue to your account",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // ===============================
                  // EMAIL LABEL
                  // ===============================

                  const Text(
                    "Email Address",

                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ===============================
                  // EMAIL
                  // ===============================

                  TextField(
                    controller: emailController,

                    keyboardType:
                        TextInputType.emailAddress,

                    decoration: const InputDecoration(
                      hintText: "Enter your email",

                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ===============================
                  // PASSWORD LABEL
                  // ===============================

                  const Text(
                    "Password",

                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ===============================
                  // PASSWORD
                  // ===============================

                  TextField(
                    controller: passwordController,

                    obscureText: hidePassword,

                    decoration: InputDecoration(
                      hintText: "Enter your password",

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },

                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ===============================
                  // REMEMBER + FORGOT
                  // ===============================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Row(
                        children: [

                          Checkbox(
                            value: rememberMe,

                            activeColor:
                                const Color(0xFF2563EB),

                            onChanged: (value) {
                              setState(() {
                                rememberMe =
                                    value ?? false;
                              });
                            },
                          ),

                          const Text(
                            "Remember me",

                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),

                      TextButton(
                        onPressed: () {},

                        child: const Text(
                          "Forgot Password?",

                          style: TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // ===============================
                  // LOGIN BUTTON
                  // ===============================

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: login,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF2563EB),

                        foregroundColor: Colors.white,

                        elevation: 2,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),

                      child: const Text(
                        "Sign In",

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ===============================
                  // DIVIDER
                  // ===============================

                  Row(
                    children: [

                      const Expanded(
                        child: Divider(
                          color: Color(0xFFE2E8F0),
                        ),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),

                        child: Text(
                          "OR",

                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),

                      const Expanded(
                        child: Divider(
                          color: Color(0xFFE2E8F0),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // ===============================
                  // SIGN UP
                  // ===============================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account?",

                        style: TextStyle(
                          color: Color(0xFF64748B),
                        ),
                      ),

                      TextButton(
                        onPressed: () {},

                        child: const Text(
                          "Create Account",

                          style: TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // ===============================
                  // FOOTER
                  // ===============================

                  const Center(
                    child: Text(
                      "© 2026 Your Company",

                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                      ),
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

// ======================================================
// HOME PAGE
// ======================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.home_rounded,
                size: 80,
                color: Color(0xFF2563EB),
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome to Home Page",

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Login successful!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // PROFILE BUTTON

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/profile',
                    );
                  },

                  icon: const Icon(Icons.person),

                  label: const Text("Go to Profile"),
                ),
              ),

              const SizedBox(height: 15),

              // LOGOUT BUTTON

              SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  onPressed: () {

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );

                  },

                  icon: const Icon(Icons.logout),

                  label: const Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// PROFILE PAGE
// ======================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const CircleAvatar(
                radius: 55,

                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Sriram",

                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Flutter Developer",

                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(Icons.arrow_back),

                label: const Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

