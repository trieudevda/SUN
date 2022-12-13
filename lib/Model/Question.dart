class Question {
  String? idQuestionTopic;
  String? idAnswer;
  String? title;
  String? difficultyLevel;
  int? addExperience;
  int? point;
  String? status;
  Question({this.idQuestionTopic, this.idAnswer, this.title,this.difficultyLevel, this.addExperience, this.point,this.status});
}

// final List<Question> data = [
//   Question(
//     id: 1,
//     id_question_detail: 2,
//     title:
//         'Quá trình phát triển của văn học Việt Nam từ cách mạng tháng Tám năm 1945 đến năm 1975 trải qua mấy chặng đường chính?',
//     id_answer: [
//       '2',
//       '3',
//       '4',
//       '5',
//     ],
//     point: 10,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 2,
//     id_question_detail: 2,
//     title:
//         'Đặc điểm nào không phải là đặc điểm cơ bản của nền văn học Việt Nam từ năm 1945 đến năm 1975? ',
//     id_answer: [
//       'Nền văn học chủ yếu vận động theo hướng cách mạng hoá, gắn bó sâu sắc với vận mệnh chung của đất nước.',
//       'Nền văn học đổi mới theo hướng hiện đại hóa.',
//       'Nền văn học chủ yếu mang khuynh hướng sử thi và cảm hứng lãng mạn.',
//       'Nền văn học hướng về đại chúng.',
//     ],
//     point: 11,
//     status: 'khong hoat dong',
//   ),
//   Question(
//     id: 3,
//     id_question_detail: 2,
//     title:
//         ' Ý nào sau đây không đúng khi nói về đặc điểm khuynh hướng lãng mạn được thể hiện như thế nào trong văn học giai đoạn 1945-1975.',
//     id_answer: [
//       'Là khuynh hướng tràn đầy mơ ước, hướng tới tương lai.',
//       'Khẳng định lí tưởng của cuộc sống mới, vẻ đẹp của con người mới',
//       'Ca ngợi chủ nghĩa anh hùng cách mạng.',
//       'Các tác phẩm đều có kết thúc có hậu, được hưởng cuộc sống hạnh phúc, no ấm.',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 4,
//     id_question_detail: 2,
//     title:
//         'Đặc điểm nào sau đây không đúng với cảm hứng sử thi trong văn học giai đoạn 1945 – 1975? ',
//     id_answer: [
//       'Đề cập tới số phận chung của cả cộng đồng, liên quan đến giai cấp, đồng bào, Tổ quốc và thời đại. ',
//       'Chủ đề các tác phẩm đều viết về niềm vui chiến thắng, né tránh những tổn thất, hi sinh trong chiến tranh. ',
//       'Nhận vật chính thường tiêu biểu cho lí tưởng chung của dân tộc, gắn bó số phận mình với số phận đất nước, kết tinh những phẩm chất cao đẹp của cộng đồng. ',
//       'Cái đẹp ở mỗi cá nhân là ở ý thức công dân, lẽ sống lớn và tình cảm lớn. Nếu nói đến cái riêng thì cũng phải hoà với cái chung.',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 5,
//     id_question_detail: 2,
//     title: 'Quan niệm về độc giả của văn học Việt Nam sau năm 1975 có gì mới?',
//     id_answer: [
//       'Độc giả là những đối tượng để tuyên truyền, giác ngộ.',
//       'Độc giả là người mua hàng, nhà văn là người bán hàng.',
//       'Độc giả là những người bạn để giao lưu, đối thoại một cách bình đẳng.',
//       'Độc giả là người hoàn toàn quyết định số phận của nhà văn.',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 6,
//     id_question_detail: 2,
//     title: 'Giai đoạn 1945-1975, văn học Việt Nam đã tìm đến những hình thức nghệ thuật nào để phù hợp với nhu cầu thẩm mĩ của đại chúng?',
//     id_answer: [
//       'Mới mẻ đối với nhân dân, được thể hiện bằng một ngôn ngữ nghệ thuật tinh tế, trau chuốt.',
//       'Hấp dẫn đối với nhân dân, được thể hiện bằng một ngôn ngữ cầu kì, đa nghĩa.',
//       'Quen thuộc đối với nhân dân, được thể hiện bằng một ngôn ngữ bình dị, trong sáng, dễ hiểu.',
//       ' Dễ dãi đối với nhân dân, được thể hiện bằng ngôn ngữ bình dân, suồng sã.',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 7,
//     id_question_detail: 2,
//     title: 'Nhiệm vụ của văn học trong giai đoạn đất nước bước vào cuộc chiến tranh gian khổ, trường kì là:',
//     id_answer: [
//       'Phản ánh chân thực và cổ vũ công cuộc xây dựng đất nước.',
//       'Nêu bật được những thành tựu của công cuộc đổi mới đất nước.',
//       'Tập trung phục vụ chính trị tuyên truyền, cổ vũ chiến đấu.',
//       'Đưa tin nhanh chóng về những chiến thắng trên các chiến trường.',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
//   Question(
//     id: 8,
//     id_question_detail: 2,
//     title: 'gia tri 3',
//     id_answer: [
//       'cau hoi 9',
//       'cau hoi 10',
//       'cau hoi 11',
//       'cau hoi 12',
//     ],
//     point: 12,
//     status: 'hoat dong',
//   ),
// ];
