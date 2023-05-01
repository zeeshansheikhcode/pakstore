import 'package:flutter/material.dart';
import 'package:pakstore/view/cart/cart_view.dart';
import 'package:pakstore/view/category/category_view.dart';
import 'package:pakstore/view/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class AppTabBar extends StatelessWidget {
   AppTabBar({super.key});  
  final PersistentTabController controller = PersistentTabController(initialIndex: 0);
   
   List<Widget> _buildScreens() {
        return [
          HomeView(),
          CategoriesView(),
          CartScreen(),
        ];
    }  
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                textStyle: const TextStyle(color: Colors.white),
                icon:const Icon(Icons.home),
                title: ("Home"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                 icon:const Icon(Icons.category),
                 textStyle: const TextStyle(color: Colors.white),
                 title: ("Category"),
               activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon:const Icon(Icons.shopping_cart),
                textStyle: const TextStyle(color: Colors.white),
                title: ("Cart"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.grey,
            ),
        ];
    }
  @override
  Widget build(BuildContext context) {
     return PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties:const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style17, // Choose the nav bar style with this property.
    );
  }
}
