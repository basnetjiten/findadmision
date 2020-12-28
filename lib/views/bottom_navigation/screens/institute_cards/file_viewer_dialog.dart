import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';

class FileViewerDialog extends StatefulWidget {
  final String fileUrl;
  final String ext;

  FileViewerDialog({this.fileUrl, this.ext});

  @override
  _FileViewerDialogState createState() => _FileViewerDialogState();
}

class _FileViewerDialogState extends State<FileViewerDialog> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 130),
      child: Container(
        height: sizeConfig.screenHeight / 1.2,
        width: sizeConfig.screenWidth / 1.25,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            title: Text(
              "Test",
              style: AppTheme.dialogDetailInfoStyle,
            ),
            content: Container(
              height: sizeConfig.screenHeight / 1.7,
              width: sizeConfig.screenWidth / 1.25,
              child: widget.ext == '.pdf'
                  ? Stack(
                      children: <Widget>[
                        PDFView(
                          filePath: widget.fileUrl,
                          enableSwipe: true,
                          swipeHorizontal: true,
                          autoSpacing: false,
                          pageFling: true,
                          pageSnap: true,
                          defaultPage: currentPage,
                          fitPolicy: FitPolicy.BOTH,
                          preventLinkNavigation: true,
                          // if set to true the link is handled in flutter
                          onRender: (_pages) {
                            setState(() {
                              pages = _pages;
                              isReady = true;
                            });
                          },
                          onError: (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                            print(error.toString());
                          },
                          onPageError: (page, error) {
                            setState(() {
                              errorMessage = '$page: ${error.toString()}';
                            });
                            print('$page: ${error.toString()}');
                          },
                          onViewCreated: (PDFViewController pdfViewController) {
                            _controller.complete(pdfViewController);
                          },
                          onLinkHandler: (String uri) {
                            print('goto uri: $uri');
                          },
                          onPageChanged: (int page, int total) {
                            print('page change: $page/$total');
                            setState(() {
                              currentPage = page;
                            });
                          },
                        ),
                        errorMessage.isEmpty
                            ? !isReady
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container()
                            : Center(
                                child: Text(errorMessage),
                              )
                      ],
                    )
                  : Container(
                      height: sizeConfig.screenHeight / 1.7,
                      width: sizeConfig.screenWidth / 1.25,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: NetworkImage(widget.fileUrl))),
                    ),
            ),
          ),
          floatingActionButton: widget.ext == '.pdf'
              ? FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
                    if (snapshot.hasData) {
                      return FloatingActionButton.extended(
                        label: Text("Go to ${pages ~/ 2}"),
                        onPressed: () async {
                          await snapshot.data.setPage(pages ~/ 2);
                        },
                      );
                    }

                    return Container();
                  },
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
