import 'package:flutter/material.dart';
import 'package:truetone/core/utiles/app_colors.dart';
import 'package:truetone/feature/home/presintation/screens/home_views.dart';

class Mainscreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedNotifier = ValueNotifier(0);
  final List<Widget> _screens = [
 
    HomeViews(),
       history(),
    SettingScreen(),
  ];

  Mainscreen({super.key});

  void _onItemTap(int index) {
    _selectedNotifier.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          PageView(
            controller: _pageController,
            onPageChanged: (value) => _selectedNotifier.value = value,
            physics: const NeverScrollableScrollPhysics(),
            children: _screens,
          ),

   
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedNotifier,
              builder: (context, selectedIndex, _) {
                return Container(
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                      GestureDetector(
                        onTap: () => _onItemTap(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.history,
                                size: 30,
                                color: selectedIndex == 1
                                    ?  AppColors.primarycolor
                                    : Colors.black),
                            Text("History",
                                style: TextStyle(
                                    color: selectedIndex == 1
                                        ? AppColors.primarycolor
                                        : Colors.black,
                                    fontSize: 12))
                          ],
                        ),
                      ),

                     
                      GestureDetector(
  onTap: () => _onItemTap(0),
  child: Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: selectedIndex == 0 
          ? AppColors.primarycolor  
          : AppColors.onprimary,  
      shape: BoxShape.circle,
      border: Border.all(
        color: selectedIndex == 0 
            ? Colors.transparent 
            : AppColors.primarycolor, 
        width: 2,
      ),
    ),
    child: Icon(
      Icons.graphic_eq,
      size: 30,
    color: selectedIndex == 0 
            ? AppColors.onprimary
            : AppColors.primarycolor, 
    ),
  ),
),

                     
                      GestureDetector(
                        onTap: () => _onItemTap(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings_outlined,
                                size: 30,
                                color: selectedIndex == 2
                                    ?  AppColors.primarycolor
                                    : AppColors.black),
                            Text("Settings",
                                style: TextStyle(
                                    color: selectedIndex == 2
                                        ?  AppColors.primarycolor
                                        : AppColors.black ,
                                    fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Settings Page")),
    );
  }
}


class history extends StatelessWidget {
  const history({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Settings Page")),
    );
  }
}