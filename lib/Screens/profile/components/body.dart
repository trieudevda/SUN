import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        const ProfilePic(),
        const SizedBox(height: 20),
        const Text(
          'Level: 50',
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 241, 171, 241)),
        ),
        TextButton(
          child: const Text("Thay đổi thông tin"),
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
          const SizedBox(width: 150),
          ElevatedButton(
            child: const Text(
              "Đăng xuất",
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            child: const Text(
              "Quay lại",
            ),
            onPressed: () {},
          ),
        ])
      ]),
    );
  }
}
