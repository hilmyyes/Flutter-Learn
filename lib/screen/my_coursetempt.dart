// import 'package:flutter/material.dart';
// import 'package:emoji_app/screen/course_detail.dart';

// class MyCourses extends StatelessWidget {
//   MyCourses({super.key});


//   List<Widget> courseWidget() {
//     List<Widget> temp = [];
//     int i = 0;
//     while (i < courseList.length) {
//       Widget w = Text(courseList[i]);
//       temp.add(w);
//       i++;
//     }
//     return temp;
//   }

//   List<String> courseList = [
//     "Business Geography -",
//     "Leadership and Professional Ethics A",
//     "Web Framework Programming F",
//     "Research Methodology ZB",
//     "System Testing & Implementation A",
//     "Enterprise System Implementation B",
//     "Emerging Technology -",
//     "Advanced Native Mobile Programming C"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('MY COURSES'),
//         ),
//         body: SingleChildScrollView(
//             child: Center(
//                 child: Column(children: [
//           Container(
//             width: 200,
//             height: 200,
//             margin: const EdgeInsets.all(25),
//             decoration: BoxDecoration(
//               image: const DecorationImage(
//                 image: AssetImage('assets/images/cool.png'),
//                 fit: BoxFit.cover,
//               ),
//               shape: BoxShape.circle,
//               boxShadow: const [
//                 BoxShadow(spreadRadius: 8, blurRadius: 15, offset: Offset(7, 7), color: Colors.grey)
//               ]
//             ),
//           ),
//           Text(
//             'Jonathan Pratama Erdiyanto',
//             style: TextStyle(fontSize: 20, fontFamily: 'Britannic'),
//           ),
//           Text(
//             '160421010',
//             style: TextStyle(fontSize: 16, fontFamily: 'Consolas'),
//           ),
//           Text(
//             'IMESH',
//             style: TextStyle(fontSize: 16, fontFamily: 'Consolas'),
//           ),
//           Text(
//             'Genap 2023/2024',
//             style: TextStyle(fontSize: 16, fontFamily: 'Consolas'),
//           ),
//           const Divider(
//             height: 20,
//             color: Colors.transparent,
//           ),
//           CourseMethod(context)
//         ]))));
//   }

//   GridView CourseMethod(BuildContext context) {
//     return GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: 5 / 0.8,
//           crossAxisCount: 1,
//         ),
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: courseList.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   Color.fromARGB(255, 155, 213, 255),
//                   Color.fromARGB(255, 125, 162, 255),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.33),
//                   spreadRadius: 1,
//                   blurRadius: 3,
//                   offset: Offset(3, 7),
//                 ),
//               ],
//             ),
//             child: ListTile(
//               title: Text(courseList[index], style: TextStyle(fontSize: 16, fontFamily: 'Consolas'),),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CourseDetail(index),
//                   ),
//                 );
//               },
//             ),
//           );
//         });
//   }
// }