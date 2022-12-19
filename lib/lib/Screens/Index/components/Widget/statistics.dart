import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

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
      title: Container(
          height: MediaQuery.of(context).size.height / 10.0,
          color: kPrimaryColor,
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
          )),
      contentPadding: const EdgeInsets.only(left: 5, right: 5),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      content: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width, child: const ColChart()),
      ),
    );
  }
}

class ColChart extends StatelessWidget {
  const ColChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: const [
        ListTile(
          leading: Icon(
            Icons.question_answer_outlined,
          ),
          title: Text(
            'Câu hỏi đã được trả lời ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('10'),
        ),
        ListTile(
          leading: Icon(
            Icons.done,
            color: Colors.green,
          ),
          title: Text(
            'Câu trả lời đúng ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('2'),
        ),
        ListTile(
          leading: Icon(
            Icons.clear,
            color: Colors.red,
          ),
          title: Text(
            'Câu trả lời sai ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('2'),
        ),
        ListTile(
          leading: Icon(
            Icons.abc,
          ),
          title: Text(
            'Tỉ lệ chính xác ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('10%'),
        ),
        ListTile(
          leading: Icon(
            Icons.numbers_outlined,
          ),
          title: Text(
            'Đạt lv5 trong trò chơi',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text(''),
        ),
        ListTile(
          leading: Icon(
            Icons.abc,
          ),
          title: Text(
            'Chiến thắng trò chơi',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('1'),
        ),
        ListTile(
          leading: Icon(
            Icons.abc,
          ),
          title: Text(
            'Tỉ lệ chiến thắng',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('20%'),
        ),
        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.yellow,
          ),
          title: Text(
            'Tiền kiếm được',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: Text('250 xu'),
        ),
      ]),
    );
  }
}
