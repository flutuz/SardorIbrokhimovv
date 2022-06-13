import 'package:flutter/material.dart';
import 'package:namozni_organaman/utilites/utilites/quran_strings.dart';
import 'package:namozni_organaman/utilites/utilites/webcall.dart';
class QuranPage extends StatefulWidget {
  static const String id = 'quran';

  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  Color maincolor = Color(0xFF007437);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qur'oni Karim"),
        centerTitle: true,
        backgroundColor: maincolor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 10, right: 10),
        itemCount: QuranStrings.titles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebCall(
                      urlIndex: index, pageTitle: QuranStrings.titles[index]),
                ),
              );
            },
            child: Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade500),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        (index + 1).toString() + ". ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        QuranStrings.titles[index],
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
