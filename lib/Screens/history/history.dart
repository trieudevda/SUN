import 'package:flutter/material.dart';

Widget countstar(int countstar) {
  int temp = countstar.floor();
  List<Icon> lststar = List.empty(growable: true);
  for (var i = 0; i < temp; i++) {
    lststar.add(Icon(
      Icons.star,
      color: Color.fromARGB(255, 236, 207, 43),
    ));
  }
  return Row(
    children: [for (var i in lststar) i],
  );
}

class lichsu extends StatelessWidget {
  lichsu(
      {super.key,
      required this.tran,
      required this.rank,
      required this.cap,
      required this.ten,
      required this.ttcd,
      required this.ttcn});
  String tran, cap, ten, ttcn, ttcd;
  int rank;
  @override
  Widget build(BuildContext context) {
    double chia = 5;
    double chia2 = 9;
    int font = 25;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 100),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: MediaQuery.of(context).size.width / chia2,
            child: Row(
              children: [
                Text(
                  tran,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / font,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / chia,
            child: Row(
              children: [countstar(rank)],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / chia2,
            child: Row(
              children: [
                Text(cap,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 11, 5, 10)))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / chia,
            child: Row(
              children: [
                Text(ten,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 10,
            child: Row(
              children: [
                Text(ttcn,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 10,
            child: Row(
              children: [
                Text(ttcd,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / font,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
