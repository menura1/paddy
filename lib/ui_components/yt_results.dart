import 'package:flutter/material.dart';
import 'package:paddy/models/yt_video_model.dart';
import 'package:url_launcher/url_launcher.dart';

class YtResults extends StatefulWidget {
  Future<List<YtVideoModel>>? results;
  YtResults({Key? key, required Future<List<YtVideoModel>> results})
      : super(key: key) {
    this.results = results;
  }

  @override
  _YtResultsState createState() => _YtResultsState();
}

class _YtResultsState extends State<YtResults> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 575,
      child: FutureBuilder<List<YtVideoModel>>(
        future: widget.results,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      launch(snapshot.data![index].url);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              snapshot.data != null
                                  ? snapshot.data![index].thumbnailUrl
                                  : "",
                              fit: BoxFit.cover,
                              height: 80,
                              width: 120,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    snapshot.data != null
                                        ? snapshot.data![index].title
                                        : "",
                                    style: TextStyle(
                                        color: Colors.black87.withOpacity(0.7),
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
            : const SizedBox(
                height: 300, width: 300, child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
