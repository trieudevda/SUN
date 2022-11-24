import 'package:flutter/material.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.question_answer_outlined,
              ),
              title: Text(
                'Câu hỏi đã được trả lời ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('10'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.done,
              ),
              title: Text(
                'Câu trả lời đúng ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('2'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.clear,
              ),
              title: Text(
                'Câu trả lời sai ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('2'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.abc,
              ),
              title: Text(
                'Tỉ lệ chính xác ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('10%'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.numbers_outlined,
              ),
              title: Text(
                'Đạt lv5 trong trò chơi',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text(''),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.abc,
              ),
              title: Text(
                'Chiến thắng trò chơi',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('1'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.abc,
              ),
              title: Text(
                'Tỉ lệ chiến thắng',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('20%'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.monetization_on_outlined,
              ),
              title: Text(
                'Tiền kiếm được',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Text('250 xu'),
            ),
          ),
        ],
      ),
    );
  }
}
