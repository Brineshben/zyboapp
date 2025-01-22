import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../Utils/colors.dart';
import '../ProfileScreen/profile_screen.dart';
import '../WishlistScreen/wishlist_screen.dart';
import 'home_screen.dart';

class PageIndexNavigation extends StatefulWidget {
  const PageIndexNavigation({Key? key}) : super(key: key);

  @override
  State<PageIndexNavigation> createState() =>
      _PageIndexNavigationState();
}

class _PageIndexNavigationState extends State<PageIndexNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.whiteColor ,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Padding(

        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),

        child: Container(
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: ColorUtils.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SalomonBottomBar(
            margin: EdgeInsets.only(left: 10,right: 10),
            selectedItemColor: ColorUtils.bottomNavigationColor,
            selectedColorOpacity: 0.6,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/Images/Home.svg"),
                title: Text(
                  "Home",
                  style: GoogleFonts.lato(
                      color: ColorUtils.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                // selectedColor: ColorUtils.bottomNavigationolor,
                activeIcon: SvgPicture.asset(
                  "assets/Images/Selectedhome.svg",
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/Images/Wishlist.svg"),
                title: Text(
                  "Wishlist",
                  style: GoogleFonts.lato(
                      color: ColorUtils.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                selectedColor: ColorUtils.bottomNavigationColor,
                activeIcon: SvgPicture.asset(
                  "assets/Images/Selectedwishlist.svg",
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset("assets/Images/Profile.svg"),
                title: Text(
                  "Profile",
                  style: GoogleFonts.lato(
                      color: ColorUtils.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                selectedColor: ColorUtils.bottomNavigationColor,
                activeIcon: SvgPicture.asset(
                  "assets/Images/SelectedProfile.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
