import 'package:do_an/components/background_custom.dart';
import 'package:flutter/material.dart';

Widget countstar(int countstar) {
  int temp = countstar.floor();
  List<Icon> lststar = List.empty(growable: true);
  for (var i = 0; i < temp; i++) {
    lststar.add(const Icon(
      Icons.star,
      color: Color.fromARGB(255, 236, 207, 43),
    ));
  }
  return Row(
    children: [for (var i in lststar) i],
  );
}

class History extends StatelessWidget {
  History(
      {super.key,
      required this.tran,
      required this.rank,
      required this.cap,
      required this.ten,
      required this.ttcd,
      required this.ttcn});
  String tran, cap, ten, ttcn, ttcd;
  int rank;
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
  Widget AddText(String text,final data, Color color){
    return Container(
      padding:const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),
            ),
          ),
          Expanded(
            flex: 6,
            child:Text(
              data.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundCustom(
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 40,right:40,top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 40),
              child: const Text('Lịch Sử Đấu',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddText('Số trận:',tran,Colors.black),
                // countstar(rank)
                AddText('Hạng:',rank,Colors.black),
                AddText('Cấp:',cap, Color.fromARGB(255, 11, 5, 10)),
                AddText('Tên nhân vật:',ten,Colors.black),
                AddText('ttcn:',ttcn,Colors.black),
                AddText('ttcd:',ttcd,Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
