// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// // [name], [kp], [jadwal], [ruang], [sks]
// List<Map<String, String>> courses = [
//   {
//     "0": "Business Geography",
//     "1": "KP -",
//     "2": "Senin 07.00",
//     "3": "TB 01.01C",
//     "4": "3 SKS"
//   },
//   {
//     "0": "Leadership and Professional Ethics",
//     "1": "KP A",
//     "2": "Senin 10.40",
//     "3": "TF 04.02",
//     "4": "2 SKS"
//   },
//   {
//     "0": "Web Framework Programming",
//     "1": "KP F",
//     "2": "Selasa 09.45",
//     "3": "TB 01.09",
//     "4": "3 SKS"
//   },
//   {
//     "0": "Research Methodology",
//     "1": "KP ZB",
//     "2": "Rabu 07.00",
//     "3": "TF 03.02",
//     "4": "3 SKS"
//   },
//   {
//     "0": "System Testing & Implementation",
//     "1": "KP A",
//     "2": "Rabu 09.45",
//     "3": "TF 04.01B",
//     "4": "3 SKS"
//   },
//   {
//     "0": "Enterprise System Implementation",
//     "1": "KP B",
//     "2": "Rabu 13.00",
//     "3": "TC 04.01A",
//     "4": "3 SKS"
//   },
//   {
//     "0": "Emerging Technology",
//     "1": "KP -",
//     "2": "Kamis 07.00",
//     "3": "TC 04.01D",
//     "4": "3 SKS"
//   },
//   {
//     "0": "Advanced Native Mobile Programming",
//     "1": "KP C",
//     "2": "Kamis 13.00",
//     "3": "TC 04.01C",
//     "4": "3 SKS"
//   },
// ];

// class CourseDetail extends StatelessWidget {
//   final int courseIndex;
//   const CourseDetail(this.courseIndex, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DATA :'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 courses[courseIndex]["0"]!,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 20, fontFamily: 'Britannic'),
//               ),
//               const Divider(
//                 height: 20,
//                 color: Colors.transparent,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (var i = 1; i < 5; i++)
//                     Container(
//                       width: 50,
//                       height: 50,
//                       margin: EdgeInsets.only(left: 20),
//                       child: Center(
//                         child: Text(
//                           courses[courseIndex]["$i"]!,
//                           textAlign: TextAlign.center,
//                           style:
//                               TextStyle(fontSize: 12, fontFamily: 'Consolas'),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.topRight,
//                           colors: [
//                             Color.fromARGB(255, 155, 213, 255),
//                             Color.fromARGB(255, 125, 162, 255),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   SizedBox(width: 40),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }