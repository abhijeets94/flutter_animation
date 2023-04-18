import 'package:flutter/material.dart';

import 'box_animate_clip.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home-Screen';
  HomeScreen({Key? key}) : super(key: key);

  List<List<dynamic>> headerButton = [
    [Icons.person_outline, "Profile"],
    [Icons.explore, "Experience"],
    [Icons.light, "Project"],
    [Icons.meeting_room, "Social"],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Practice Area.",
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.grey[400]),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: MediaQuery.of(context).size.height / 8,
          elevation: 8,
          shadowColor: Colors.black54,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: MediaQuery.of(context).size.height / 8,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: headerButton.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: const Color.fromARGB(255, 34, 27, 27),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(headerButton[index][0]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(headerButton[index][1]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            RadiusIndicateWidget(),
          ],
        ),
      ),
    );
  }
}
