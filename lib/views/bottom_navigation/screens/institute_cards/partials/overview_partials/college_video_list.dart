import 'dart:async';

import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CollegeVideoList extends StatefulWidget {
  final List<Video> videos;
  CollegeVideoList({this.videos});
  @override
  _CollegeVideoListState createState() => _CollegeVideoListState();
}

class _CollegeVideoListState extends State<CollegeVideoList> {
  InAppWebViewController webView;
  String iframeUrl = "https://www.youtube.com/embed/";
  PageController controller = PageController(initialPage: 0);
  int currentPageValue = 0;
  int pageViewIndex = 0;
  List<Image> videoThumbNailImg = [];
  List<String> videoIdList = [];
  @override
  void initState() {
    if(widget.videos.isNotEmpty) {
      widget.videos.forEach((video) {
        videoThumbNailImg.add(Image.network(
          "https://img.youtube.com/vi/${video.instvideoVideoid}/0.jpg",
          fit: BoxFit.fill,
        ));
        videoIdList.add(video.instvideoVideoid);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Align(alignment: Alignment.topLeft, child: Text("Photos")),
            SizedBox(
              height: 15,
            ),
            Container(
                //color: Colors.greenAccent,
                alignment: Alignment.center,
                height: 280,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPageValue = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        imageSlider(index),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  currentPageValue = index - 1;
                                  controller.animateToPage(index - 1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  currentPageValue = index + 1;
                                  controller.animateToPage(index + 1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              width: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: videoThumbNailImg.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            currentPageValue = index;
                            controller.animateToPage(index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Container(
                              height: 82,
                              width: 84,
                              decoration: currentPageValue == index
                                  ? BoxDecoration(
                                  border: Border.all(color: Colors.blue))
                                  : null,
                              child: videoThumbNailImg[index]),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        double value = 1;
        if (controller.position.haveDimensions) {
          value = controller.page - position;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return SizedBox(
          height: Curves.easeInOut.transform(value) * 290,
          width: Curves.easeInOut.transform(value) * 315,
          child: widget,
        );
      },
      child: Container(
        height: 280,
        width: double.infinity,
        child:  InAppWebView(
          initialData: InAppWebViewInitialData(
              data: """
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Flutter InAppWebView</title>
    </head>
    <body>
<iframe width="424" height="315" src="${iframeUrl+videoIdList[position]}" frameborder="0" allow="autoplay; encrypted-media; picture-in-picture"></iframe>    </body>
</html>"""
          ),
          initialHeaders: {},

          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {

          },
          onLoadStop: (InAppWebViewController controller, String url) {

          },
        ),
      ),
    );
  }
}
