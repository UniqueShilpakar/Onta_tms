import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Sidebarcontroller extends GetxController {
  // Observable for selected menu item
  final selectedIndex = 0.obs;

  // Observable for sidebar state based on screen size
  final sidebarState = SidebarState.expanded.obs;

  // Menu items with SVG
  final List<MenuItem> menuItems = [
    
    MenuItem(iconPath: 'assets/icons/dashboard.svg', title: 'Dashboard'),
    MenuItem(iconPath: 'assets/icons/query.svg', title: 'Queries'),
    MenuItem(iconPath: 'assets/icons/sales.svg', title: 'Sales'),
    MenuItem(iconPath: 'assets/icons/accounts.svg', title: 'Accounts'),
    MenuItem(iconPath: 'assets/icons/tasks.svg', title: 'Tasks'),
    MenuItem(iconPath: 'assets/icons/tour.svg', title: 'Tours'),
    MenuItem(iconPath: 'assets/icons/plane.svg', title: 'Pax Flights'),
    MenuItem(iconPath: 'assets/icons/visa.svg', title: 'Visas'),
    MenuItem(iconPath: 'assets/icons/report.svg', title: 'Reports'),
    MenuItem(iconPath: 'assets/icons/finance.svg', title: 'Finance'),
    MenuItem(iconPath: 'assets/icons/marketing.svg', title: 'Marketing'),
    MenuItem(iconPath: 'assets/icons/admin.svg', title: 'Admin'),
    MenuItem(iconPath: 'assets/icons/analysis.svg', title: 'Analysis'),
    MenuItem(iconPath: 'assets/icons/setting.svg', title: 'Setting'),
    MenuItem(iconPath: 'assets/icons/help.svg', title: 'Help'),
    MenuItem(iconPath: 'assets/icons/logout.svg', title: 'Logout'),
  ];

  // Update sidebar state based on screen width
  void updateSidebarState(double width) {
    if (width < 600) {
      // For mobile
      sidebarState.value = SidebarState.drawer;
    } else if (width < 1024) {
      // For tablet
      sidebarState.value = SidebarState.collapsed;
    } else {
      // Desktop
      sidebarState.value = SidebarState.expanded;
    }
  }

  // Toggle sidebar manually
  void toggleSidebar() {
    if (sidebarState.value == SidebarState.expanded) {
      sidebarState.value = SidebarState.collapsed;
    } else if (sidebarState.value == SidebarState.collapsed) {
      sidebarState.value = SidebarState.expanded;
    }
  }

  // Select menu item
  void selectMenuItem(int index) {
    selectedIndex.value = index;

    // Closing drawer on mobile after selection
    if (sidebarState.value == SidebarState.drawer) {
      Get.back();
    }

    // Handling logout
    if (menuItems[index].title == 'Logout') {
      handleLogout();
      return;
    }
  }

  // Handle logout
  void handleLogout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

enum SidebarState {
  expanded,  // For desktop view
  collapsed, // For tablet view
  drawer,    // For mobile view
}

class MenuItem {
  final String iconPath;
  final String title;

  MenuItem({
    required this.iconPath,
    required this.title,
  });
}