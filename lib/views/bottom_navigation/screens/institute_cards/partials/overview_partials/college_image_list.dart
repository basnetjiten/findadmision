import 'package:findadmissionaffiliate/dto/photodto.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:flutter/material.dart';

class CollegeImageList extends StatefulWidget {
  final List<Photo> photos;

  CollegeImageList({this.photos});

  @override
  _CollegeImageListState createState() => _CollegeImageListState();
}

class _CollegeImageListState extends State<CollegeImageList> {
  PageController controller = PageController(initialPage: 0);
  int currentPageValue = 0;
  int pageViewIndex = 0;
  List<Image> assetImages = [];
  List<Image> assetThumbImage = [];
  InstPhotoDt instPhotoDt;

  @override
  void initState() {
    if (widget.photos != null) {
      widget.photos.forEach((photo) {
        if (photo.instphotoAwskey != null) {
          assetImages.add(Image.network(
            photo.instphotoUrl,
            fit: BoxFit.fill,
          ));
          assetThumbImage.add(Image.network(
            photo.instphotoThumb,
            fit: BoxFit.fill,
          ));
        } else {
         /* assetImages.add(Image.network(
            "https://picsum.photos/seed/picsum/200/300",
            fit: BoxFit.fill,
          ));
          assetThumbImage.add(Image.network(
            "https://picsum.photos/seed/picsum/200/300",
            fit: BoxFit.fill,
          ));*/
        }
      });
      instPhotoDt = InstPhotoDt(assetImages, assetThumbImage);
    } else {
     /* assetImages.add(Image.network(
        "https://picsum.photos/seed/picsum/200/300",
        fit: BoxFit.fill,
      ));
      assetThumbImage.add(Image.network(
        "https://picsum.photos/seed/picsum/200/300",
        fit: BoxFit.fill,
      ));*/
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                // color: Colors.greenAccent,
                alignment: Alignment.center,
                height: 290,
                width: 315,
                child: PageView.builder(
                  itemCount: instPhotoDt.imageUrl.length,
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
                  itemCount: instPhotoDt.thumbUrl.length,
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
                              child: instPhotoDt.thumbUrl[index] ??
                                  Image.network(
                                    "https://picsum.photos/seed/picsum/200/300",
                                    fit: BoxFit.fill,
                                  )),
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
          height: 290,
          width: 315,
          child: instPhotoDt.imageUrl[position] ??
              Image.network(
                "https://picsum.photos/seed/picsum/200/300",
                fit: BoxFit.fill,
              )),
    );
  }
}
