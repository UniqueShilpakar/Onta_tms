import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';
import 'package:onta_tms/src/widgets/sidebar/customsidebar.dart';
//import 'package:onta_tms/src/widgets/sidebar/sidebar_menu_item.dart';

class MobileDrawer extends StatelessWidget {
  final Sidebarcontroller controller = Get.find<Sidebarcontroller>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1E3A8A),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1E3A8A),
                  Color(0xFF1E40AF),
                ],
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Text(
                      'O',
                      style: TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Onta tms',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1E3A8A),
                    Color(0xFF1E40AF),
                  ],
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: controller.menuItems.length,
                itemBuilder: (context, index) {
                  return Obx(() => SidebarMenuItem(
                        item: controller.menuItems[index],
                        isSelected: controller.selectedIndex.value == index,
                        isExpanded: true,
                        onTap: () => controller.selectMenuItem(index),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

