import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  static const Color primaryColor = Color(0xFF08A9D9);
  static const Color darkText = Color(0xFF263238);
  static const Color greyText = Color(0xFF68747C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      // ======================================================
      // APP BAR
      // ======================================================
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        toolbarHeight: 65,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),

        titleSpacing: 0,

        title: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/onecloud_logo.png.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),

        actions: [
          const Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                'GT InStock',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(width: 22),

          const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 22,
          ),

          const SizedBox(width: 15),

          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: 21,
            ),
          ),

          const SizedBox(width: 18),
        ],
      ),

      // ======================================================
      // BODY
      // ======================================================
      body: ScrollConfiguration(
        behavior: const NoScrollbarBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // PAGE TITLE
              // ==================================================
              const Text(
                'GT InStock',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Centralized overview of your inventory and stock operations.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              // ==================================================
              // STOCK STATISTICS
              // ==================================================
              Row(
                children: [
                  Expanded(
                    child: _stockStat(
                      icon: Icons.inventory_2_outlined,
                      title: 'Total Stock',
                      value: '1,842',
                    ),
                  ),

                  Expanded(
                    child: _stockStat(
                      icon: Icons.check_circle_outline,
                      title: 'Available Items',
                      value: '1,620',
                    ),
                  ),

                  Expanded(
                    child: _stockStat(
                      icon: Icons.warning_amber_outlined,
                      title: 'Low Stock',
                      value: '42',
                    ),
                  ),

                  Expanded(
                    child: _stockStat(
                      icon: Icons.shopping_cart_outlined,
                      title: 'Orders',
                      value: '180',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 65),

              // ==================================================
              // OVERVIEW
              // ==================================================
              const Text(
                'GT InStock Overview',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'GT InStock provides a centralized view of inventory, '
                'available items, stock levels and order activity. '
                'It helps teams monitor stock operations and maintain '
                'accurate inventory information.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: greyText,
                ),
              ),

              const SizedBox(height: 24),

              // ==================================================
              // OPERATIONAL SUMMARY
              // ==================================================
              const Text(
                'Stock Operational Summary',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Inventory is currently operating within the expected range. '
                'Available stock is actively maintained while low-stock items '
                'and order activity are monitored for efficient management.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: greyText,
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      // ======================================================
      // FOOTER
      // ======================================================
      bottomNavigationBar: Container(
        height: 35,
        color: primaryColor,
        alignment: Alignment.center,
        child: const Text(
          '© 2026 | All Rights Reserved',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  // ======================================================
  // STOCK STAT
  // ======================================================
  Widget _stockStat({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: primaryColor,
          ),

          const SizedBox(width: 12),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ======================================================
// REMOVE SCROLLBAR
// ======================================================
class NoScrollbarBehavior extends ScrollBehavior {
  const NoScrollbarBehavior();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
