import 'package:do_an/constants.dart';
import 'package:flutter/material.dart';

class ColRank extends StatelessWidget {
  const ColRank({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(5),
        child: Column(
      children: [
        ListTile(
            leading: const Text(
              'Hạng',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Tên người chơi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              'Điểm',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '1',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '300',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '2',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player2',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '260',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '3',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player3',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '240',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '4',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player4',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '220',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '5',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player5',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '200',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '6',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player6',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '180',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '7',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player7',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '160',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '8',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player8',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '140',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '9',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player9',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '120',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        ListTile(
            leading: const Text(
              '10',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Player10',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // subtitle: Text(''),
            trailing: const Text(
              '120',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
      ],
    ));
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
      title: Container(
          height: MediaQuery.of(context).size.height / 10.0,
          color: kPrimaryColor,
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
                    fontSize: 20),
              )
            ],
          )),
      contentPadding: const EdgeInsets.only(left: 5, right: 5),
      content: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width, child: const ColRank()),
      ),
    );
  }
}
