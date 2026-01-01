import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';
import 'package:onta_tms/src/widgets/sidebar/customsidebar.dart';
import 'package:onta_tms/src/widgets/sidebar/mobile_drawer.dart';


class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Get controller instance
    final controller = Get.put(Sidebarcontroller());

    // Get screen width for responsive behavior
    final screenWidth = MediaQuery.of(context).size.width;

    // Update sidebar state based on screen width
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.updateSidebarState(screenWidth);
    });

    // Checks if mobile for drawer
    final isMobile = screenWidth < 600;

    return Scaffold(
      // Drawer for mobile
      drawer: isMobile ? MobileDrawer() : null,
      body: Row(
        children: [
          // Sidebar hide on mobile and uses drawer instead
          if (!isMobile) CustomSidebar(),

          // Main area with contents
          Expanded(
            child: Column(
              children: [
                // AppBar for mobile
                if (isMobile)
                  Container(
                    height: 56,
                    color: const Color(0xFF2C5F99),
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            'Onta tms',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Main content area - displays the child page
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: child,
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