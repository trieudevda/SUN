import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Thông tin cá nhân",
            press: () => {},
          ),
          ProfileMenu(
            text: "Lịch sử",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài đặt",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng xuất",
            press: () {},
          ),
        ],
      ),
    );
  }
}
