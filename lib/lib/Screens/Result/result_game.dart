import 'package:flutter/material.dart';

import '../../components/background_custom.dart';
import '../../components/function_custom.dart';
import '../Index/index_screen.dart';
class ResultGame extends StatelessWidget {
  ResultGame({Key? key,required this.point,required this.exp,required this.numberOfAnswers}) : super(key: key);
  int point=0;
  int exp=0;
  int numberOfAnswers=0;
  final temp=[];

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
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: const[
                  Text('Kết quả cuối cùng',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),),
                ],
              ),
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: const[
                  Text('Số câu trả lời đúng'),
                  Text('21'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: const[
                  Text('Số câu trả lời sai'),
                  Text('21'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: const[
                  Text('Tổng điểm'),
                  Text('21'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: const[
                  Text('Tổng kinh nghiệm'),
                  Text('21'),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: const[
                  Text(
                      'Chúc mừng bạn đã hoàn thành trò chơi',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 80,),
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
                     child: Text('Về trang chủ'),
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
