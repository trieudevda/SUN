import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        ProfilePic(),
        SizedBox(height: 20),
        Text(
          'Level: 50',
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 241, 171, 241)),
        ),
        TextButton(
          child: Text("Thay đổi thông tin"),
          onPressed: () => {},
        ),
        ProfileMenu(
          text: "Tên người chơi",
          icon: "",
          press: () {},
        ),
        ProfileMenu(
          text: "Tên đăng nhập",
          icon: "",
          press: () {},
        ),
        ProfileMenu(
          text: "Mật khẩu",
          icon: "",
          press: () {},
        ),
        Row(children: [
          SizedBox(width: 150),
          ElevatedButton(
            child: Text(
              "Đăng xuất",
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            child: Text(
              "Quay lại",
            ),
            onPressed: () {},
          ),
        ])
      ]),
    );
  }
}
