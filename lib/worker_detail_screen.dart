import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class WorkerDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String job;
  final String jobTitle;
  const WorkerDetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.color,
      required this.job,
      required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: color.withOpacity(0.12),
        child: Stack(
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                          Center(
                            child: Text(
                              job,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Icon(
                              Icons.add,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            image: DecorationImage(image: AssetImage(image)),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.4,
                                  blurRadius: 2,
                                  offset: Offset(0, 5)),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        jobTitle,
                        style: TextStyle(color: Colors.black45),
                      ),
                    )
                  ],
                )
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.65,
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              children: [
                                iconContener(
                                    Colors.red, Ionicons.heart, "likes", 43),
                                iconContener(Colors.deepOrangeAccent,
                                    AntDesign.like1, "thanks", 20),
                                iconContener(
                                    Colors.blue, Ionicons.ribbon, "likes", 43),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Last Update",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        lastUpdate(name, "General",
                            "Pekerjaan kamu sangat bagus dan di tingkatkan dan melakukan inovasi yang lebih cepat"),
                        SizedBox(
                          height: 15,
                        ),
                        lastUpdate(name, "Perilaku",
                            "Perilaku kamu sangat sopan dan menyenangkan"),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    ));
  }

  Widget lastUpdate(String name, String job, String desc) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              job,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name + " " + desc,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget iconContener(Color color, IconData icon, String title, int number) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.06)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
