import 'package:get/get.dart';

class Sidebarcontroller extends GetxController {
  //observable for selected menu item
  final selectedIndex = 0.obs;

  //observable for sidebar expand or collapse state
  final isExpanded = true.obs;

  //menuitem with png and routes
  final List<MenuItem> menuItems = [
    MenuItem(iconPath: 'assets/icons/dashboard.png', title: 'Dashboard'),
    MenuItem(iconPath: 'assets/icons/eventaccepted.png', title: 'Queries'),
    MenuItem(iconPath: 'assets/icons/sales_balance.png', title: 'Sales'),
    MenuItem(iconPath: 'assets/icons/maps.png', title: 'Maps'),
    MenuItem(iconPath: 'assets/icons/tasks', title: 'Tasks'),
    MenuItem(iconPath: 'assets/icons/peoples.png', title: 'Tours'),
    MenuItem(iconPath: 'assets/icons/planes.png', title: 'Pax Flights'),
    MenuItem(iconPath: 'assets/icons/visas.png', title: 'Visas'),
    MenuItem(iconPath: 'assets/icons/business_reports.png', title: 'Reports'),
    MenuItem(iconPath: 'assets/icons/sales_balance.png', title: 'Finance'),
    MenuItem(iconPath: 'assets/icons/speaker.png', title: 'Marketing'),
    MenuItem(iconPath: 'assets/icons/System_administrator.png', title: 'Admin'),
    MenuItem(iconPath: 'assets/icons/bar_chart.png', title: 'Analysis'),
    MenuItem(iconPath: 'assets/icons/Settings.png', title: 'Setting'),
    MenuItem(iconPath: 'assets/icons/Help.png', title: 'Help'),
    MenuItem(iconPath: 'assets/icons/Logout.png', title: 'Logout'),
  ];

  //toogle sidebar expand or collapse
  void toggleSidebar() {
    isExpanded.value = !isExpanded.value;
  }

  //select menuitem
  void selectMenuItem(int index) {
    selectedIndex.value = index;

    
  }
}

class MenuItem {
  final String iconPath;
  final String title;

  MenuItem({required this.iconPath, required this.title});
}
