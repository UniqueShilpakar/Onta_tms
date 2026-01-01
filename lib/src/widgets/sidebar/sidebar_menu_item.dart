import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';

class SidebarMenuItem extends StatelessWidget {
  final MenuItem item;
  final bool isSelected; 
  final bool isExpanded;
  final VoidCallback onTap;

  const SidebarMenuItem({
    Key? key,
    required this.item,
    required this.isSelected, 
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isExpanded ? '' : item.title,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isExpanded ? 16 : 12,
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: isExpanded ? 8 : 4,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: isSelected // ✅ Fixed typo
                ? Colors.white.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // SVG Icon
              SvgPicture.asset(
                item.iconPath,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),

              // Title (only show if expanded)
              if (isExpanded) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: isSelected 
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
    );
  }
}