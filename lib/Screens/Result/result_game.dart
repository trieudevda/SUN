import 'package:flutter/material.dart';

import '../../components/background_custom.dart';
import '../../components/function_custom.dart';
import '../Index/index_screen.dart';
import 'components/row_result.dart';
class ResultGame extends StatelessWidget {
  ResultGame({Key? key,required this.point,required this.exp,required this.numberOfAnswers}) : super(key: key);
  int point=0;
  int exp=0;
  int numberOfAnswers=0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: BackgroundCustom(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              RowResultHappy('Kết quả cuối cùng',const TextStyle(fontWeight: FontWeight.bold,fontSize: 32,)),
              Image.asset('image/gifs/sanh.gif'),
              RowResultRow('Số câu trả lời đúng',21),
              const SizedBox(height: 20,),
              RowResultRow('Số câu trả lời sai',22),
              const SizedBox(height: 20,),
              RowResultRow('Tổng điểm',23),
              const SizedBox(height: 20,),
              RowResultRow('Tổng kinh nghiệm',24),
              const SizedBox(height: 50,),
              RowResultHappy('Chúc mừng bạn đã hoàn thành trò chơi',const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              const SizedBox(height: 50,),
              InkWell(
                borderRadius: BorderRadius.circular(30.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IndexCustom()
                    ),
                  );
                },
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromRGBO(134, 0, 179, 1),
                    ),
                    padding: const EdgeInsets.all(20.0),
                     child: const Text('Về trang chủ',style:TextStyle(fontSize: 16,color: Colors.white,),),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
