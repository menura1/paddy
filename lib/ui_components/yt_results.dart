import 'package:flutter/material.dart';
import 'package:paddy/models/yt_video_model.dart';

class YtResults extends StatefulWidget {
  List<YtVideoModel>? results;
  YtResults({Key? key, required List<YtVideoModel> results}) : super(key: key) {
    this.results = results;
  }

  @override
  _YtResultsState createState() => _YtResultsState();
}

class _YtResultsState extends State<YtResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.results?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: [
                  Image.network(
                    widget.results![index].thumbnailUrl,
                    height: 90,
                    width: 120,
                  ),
                  Column(
                    children: [
                      Text(widget.results![index].title)
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
