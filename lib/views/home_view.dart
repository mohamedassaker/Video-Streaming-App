import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:video_streaming/models/video_model.dart';
import 'package:video_streaming/widgets/video_card.dart';

import '../widgets/colors.dart';
import 'add_video_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).hintColor,
        title: Text("Videos List", style: TextStyle(color: Theme.of(context).primaryColor),),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).hintColor,
        tooltip: "Add",
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddVideoPage()
              ));
        },
      ),
      body: ValueListenableBuilder<Box<APIVideo>>(
          valueListenable: Hive.box<APIVideo>("personalVideo").listenable(),
          builder: (context, box, _) {
            final videoList = box.values.toList().cast<APIVideo>();
            videoList.sort((a,b) {
              return a.name.compareTo(b.name);
            });
            return Column(
              children: [
                Expanded(
                  child: videoList.isNotEmpty?Container(
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: videoList.length,
                        itemBuilder: (context, index) {
                          return VideoCard(apiVideo: videoList[index]);
                        },
                      ),
                    ),
                  ):Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No data added",
                          style: TextStyle(color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

}
