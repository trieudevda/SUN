import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(5),
        child: Column(
      children: [
        ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hạng',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  'Tên người chơi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: Text('Diem')),
      ],
    ));
  }
}

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
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
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [CustomChart()],
          ),
        ),
      ),
    );
  }
}
