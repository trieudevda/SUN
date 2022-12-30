import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

import 'list_tile_custom.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
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
              Icons.bar_chart_outlined,
              color: Colors.white,
            ),
            Text(
              'Số liệu thống kê',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
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
        height: MediaQuery.of(context).size.height*0.52,
        width: MediaQuery.of(context).size.width,
        child: ColChart(),
      ),
    );
  }
}

class ColChart extends StatelessWidget {
  const ColChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView(
        children: <Widget>[
          ListTileIconCustom(Icons.question_answer_outlined,'Câu hỏi đã được trả lời','10'),
          ListTileIconCustom(Icons.done,'Câu trả lời đúng','2'),
          ListTileIconCustom(Icons.clear,'Câu trả lời sai','3'),
          ListTileIconCustom(Icons.abc,'Tỉ lệ chính xác','30%'),
          ListTileIconCustom(Icons.numbers_outlined,'Đạt lv5 trong trò chơi','3'),
          ListTileIconCustom(Icons.abc,'Chiến thắng trò chơi','1'),
          ListTileIconCustom(Icons.abc,'Tỉ lệ chiến thắng','20%'),
          ListTileIconCustom(Icons.monetization_on_outlined,'Tiền kiếm được','250 xu'),
        ],
      ),
    );
  }
}
