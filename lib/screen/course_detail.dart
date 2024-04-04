import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final String kp;
  final String hari;
  final String jam;
  final String kelas;
  final int jumlahSks;
  final String mataKuliah;

  CourseDetail(this.kp, this.hari, this.jam, this.kelas, this.jumlahSks,
      this.mataKuliah);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Matakuliah'),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$mataKuliah',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(child: Text('$kp',style: TextStyle(fontSize: 12,),textAlign: TextAlign.center,) ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(child: Text('$hari $jam', style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(child: Text('$kelas', textAlign:  TextAlign.center,)),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(child: Text('$jumlahSks Sks')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),),
      ),
    );
  }
}
