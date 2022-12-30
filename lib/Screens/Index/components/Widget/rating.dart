import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

import 'list_tile_custom.dart';

class ColRank extends StatelessWidget {
  ColRank({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileCustom('Hạng','Tên người chơi','Điểm'),
        const Divider(
          thickness: 3,
          endIndent: 0,
          color: Colors.black,
        ),
        SizedBox(
          height: 617,
          child: ListView(
            children:<Widget> [
              ListTileCustom(1,'Tú Anh',10000),
              ListTileCustom(2,'Nhật Ánh',5000),
              ListTileCustom(3,'Nam An',4600),
              ListTileCustom(4,'Bình An',3000),
              ListTileCustom(5,'Trường An',2000),
              ListTileCustom(6,'Player6',1722),
              ListTileCustom(7,'Player7',1600),
              ListTileCustom(8,'Player8',1000),
              ListTileCustom(9,'Player9',10000),
              ListTileCustom(10,'Player10',5000),
              ListTileCustom(11,'Player11',4600),
              ListTileCustom(12,'Player12',3000),
              ListTileCustom(13,'Player13',2000),
              ListTileCustom(14,'Player14',1722),
              ListTileCustom(15,'Player15',1600),
              ListTileCustom(16,'Player16',1000),
            ],
          ),
        ),
      ],
    );
  }
}

class Ratings extends StatefulWidget {
  const Ratings({super.key});

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: kPrimaryColor,
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.filter_list_sharp,
              color: Colors.white,
            ),
            Text(
              'Bảng xếp hạng',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            )
          ],
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 10),
      content: Container(
          decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(15),
           bottomRight: Radius.circular(15),
          ),
          color:Color.fromRGBO(249, 230, 255, 1),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ColRank(),
      ),
    );
  }
}
