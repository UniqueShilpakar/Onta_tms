import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';

class CustomSidebar extends StatelessWidget {
  final Sidebarcontroller controller = Get.put(Sidebarcontroller());

  CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.sidebarState.value;

      if (state == SidebarState.drawer) {
        // Drawer will be handled separately: mobile
        return const SizedBox.shrink();
      }

      // Tablet and desktop, which will return fixed sidebar
      return _buildSidebar(isExpanded: state == SidebarState.expanded);
    });
  }

  Widget _buildSidebar({required bool isExpanded}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? 200 : 64,
      decoration: const BoxDecoration(
        color: Color(0xFF113C7C), 
      ),
      child: Column(
        children: [
          
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                isExpanded ? Icons.menu_open : Icons.menu,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () => controller.toggleSidebar(),
              tooltip: 'Toggle Menu',
            ),
          ),

          // Logo Section with white background circle
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              width: 41,
              height: 41,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Menu Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemCount: controller.menuItems.length,
              itemBuilder: (context, index) {
                final isLastItem = index == controller.menuItems.length - 1;
                
                return Obx(() => Column(
                      children: [
                        // Add divider before logout
                        if (isLastItem && isExpanded)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: Colors.white,
                              thickness: 0.5,
                              height: 1,
                            ),
                          ),
                        SidebarMenuItem(
                          item: controller.menuItems[index],
                          isSelected: controller.selectedIndex.value == index,
                          isExpanded: isExpanded,
                          onTap: () => controller.selectMenuItem(index),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Sidebar Menu Item Widget
class SidebarMenuItem extends StatefulWidget {
  final MenuItem item;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<SidebarMenuItem> createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<SidebarMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.isExpanded ? '' : widget.item.title,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(25), // ✅ Changed to 25
          child: Container(
            height: 44,
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: EdgeInsets.symmetric(
              horizontal: widget.isExpanded ? 12 : 0,
            ),
            decoration: BoxDecoration(
              color: (widget.isSelected || isHovered) 
                  ? Color(0xFF06295D)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(25), 
            ),
            child: Row(
              mainAxisAlignment: widget.isExpanded
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                // SVG Icon
                SvgPicture.asset(
                  widget.item.iconPath,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),

                // Title (only show if expanded)
                if (widget.isExpanded) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: widget.isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}