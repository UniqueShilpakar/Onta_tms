import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';
import 'package:onta_tms/src/widgets/customsidebar.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Sidebarcontroller());

    //checks if mobile for drawer
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Scaffold(
      //drawr for mobile
      drawer: isMobile ? const Drawer(child: CustomSidebar()) : null,
      body: Row(
        children: [
          //side bar hide on mobile and uses drawer instead
          if (!isMobile) const CustomSidebar(),

          //main area with contents
          Expanded(
            child: Column(
              children: [
                //appbar for mobile
                if (isMobile)
                  Container(
                    height: 60,
                    color: const Color(0xFF235BB1),
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 28,
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

                  Expanded(
                    child: Container(
                      //our main contain beside from sidebar
                      color: Colors.grey,
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
