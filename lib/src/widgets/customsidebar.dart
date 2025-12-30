import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Sidebarcontroller>();

    // Getting responsive values using responsive_framework
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final isTablet = ResponsiveBreakpoints.of(context).between(MOBILE, DESKTOP);
    final isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    return Obx(() {
      final isExpanded = controller.isExpanded.value; // ← ADDED THIS
      
      // Determining sidebar width based on device and expand state
      double sidebarWidth; 
      if (isMobile) {
        sidebarWidth = isExpanded ? 200.0 : 60.0;
      } else if (isTablet) {
        sidebarWidth = isExpanded ? 210.0 : 65.0;
      } else {
        sidebarWidth = isExpanded ? 219.0 : 70.0;
      }
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: double.infinity,
        width: sidebarWidth,
        decoration: const BoxDecoration(color: Color(0xFF1E3A5F)),
        child: Column(
          children: [
            SizedBox(height: isMobile ? 16 : 22),

            // Header with logo and menu toggle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 15), 
              child: Row(
                mainAxisAlignment: isExpanded
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  // Logo
                  if (isExpanded)
                    Container(
                      width: isMobile ? 40 : 50,
                      height: isMobile ? 40 : 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'Onta',
                          style: TextStyle(
                            color: const Color(0xFF1E3A5F),
                            fontSize: isMobile ? 12 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  // Menu toggle button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: controller.toggleSidebar,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 6 : 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isExpanded ? Icons.menu_open : Icons.menu,
                          color: Colors.white,
                          size: isMobile ? 20 : 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Gap after header
            SizedBox(height: isMobile ? 15 : 20),

            const Divider(color: Colors.white24, height: 1, thickness: 1), 

            // Gap before menu items
            SizedBox(height: isMobile ? 12 : 15),

            // Menu items - responsive
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: isMobile ? 20 : (isTablet ? 28 : 33),
                  right: isMobile ? 12 : (isTablet ? 15 : 17),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(controller.menuItems.length, (index) {
                    // Adding divider before logout
                    if (index == controller.menuItems.length - 1) {
                      return Column(
                        children: [
                          const Divider(color: Colors.white24, height: 1), 
                          SizedBox(height: isMobile ? 6 : 8),
                          _buildMenuItem(
                            controller,
                            controller.menuItems[index].iconPath,
                            controller.menuItems[index].title,
                            index,
                            isExpanded,
                            isMobile,
                            isTablet,
                          ),
                        ],
                      );
                    }
                    return _buildMenuItem(
                      controller,
                      controller.menuItems[index].iconPath,
                      controller.menuItems[index].title,
                      index,
                      isExpanded,
                      isMobile,
                      isTablet,
                    );
                  }),
                ),
              ),
            ),
            
            // Bottom padding
            SizedBox(height: isMobile ? 15 : 20),
          ],
        ),
      );
    });
  }

  Widget _buildMenuItem(
    Sidebarcontroller controller,
    String iconPath,
    String title,
    int index,
    bool isExpanded,
    bool isMobile,
    bool isTablet,
  ) {
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index; 

      // Responsive icon and font sizes
      final iconSize = isMobile ? 18.0 : 20.0;
      final fontSize = isMobile ? 12.0 : 14.0;
      final itemHeight = isMobile ? 38.0 : 42.0;

      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.selectMenuItem(index),
          borderRadius: BorderRadius.circular(8),
          child: Tooltip(
            message: isExpanded ? '' : title,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: itemHeight,
              padding: EdgeInsets.symmetric(
                horizontal: isExpanded ? (isMobile ? 8 : 12) : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected 
                    ? Colors.white.withOpacity(0.15) 
                    : Colors.transparent,
              ),
              child: isExpanded
                  ? Row(
                      children: [
                        // PNG Icon
                        Image.asset(
                          iconPath,
                          width: iconSize,
                          height: iconSize,
                          color: Colors.white,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.image_not_supported,
                              color: Colors.white,
                              size: iconSize,
                            );
                          },
                        ),
                        SizedBox(width: isMobile ? 12 : 16),
                        // Text
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: isSelected 
                                  ? FontWeight.w600 
                                  : FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Image.asset(
                        iconPath,
                        width: isMobile ? 20 : 24,
                        height: isMobile ? 20 : 24,
                        color: Colors.white,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: isMobile ? 20 : 24,
                          );
                        },
                      ),
                    ),
            ),
          ),
        ),
      );
    });
  }
}