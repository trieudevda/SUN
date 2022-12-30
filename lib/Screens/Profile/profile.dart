import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/h15.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                child: Column(children: [
              Row(
                children: [
                  TextButton(onPressed: () {}, child: Icon(Icons.clear))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Video-Game-Controller-Icon-IDV-green.svg/1200px-Video-Game-Controller-Icon-IDV-green.svg.png'),
                        maxRadius: 100,
                        minRadius: 100,
                      ),
                      Row(
                        children: [
                          Text('Player1',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25))
                        ],
                      ),
                      Text('Lv: 5',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      const Divider(
                        height: 20,
                        thickness: 5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            'Thông tin người chơi',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        'Hạng: Bạc',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        'Số trận đã chơi: 20',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.purpleAccent.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)))),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              'Lịch sử đấu',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]))));
  }
}
