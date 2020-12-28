import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginationCard extends StatefulWidget {
  final List<Widget> paginationList;
  final ValueChanged<int> onPageChange;

  PaginationCard({this.paginationList, this.onPageChange});

  @override
  _PaginationCardState createState() => _PaginationCardState();
}

class _PaginationCardState extends State<PaginationCard> {
  List<int> pageCount = [];

  Color selectedBGColor = Colors.white;
  int selectedIndex = 0;
  Color selectedTextColor = Colors.blue;
  List<Widget> paginatedWidgetList = [];

  @override
  void initState() {
    generatePaginationCount(widget.paginationList);
   // print("TOTAL PAGE COUNT" + pageCount.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: pageCount.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4),
              child: Container(
                  height: 30,
                  width: 56,
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppTheme.instituteTextColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppTheme.instituteTextColor)),
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Center(
                            child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppTheme.instituteTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )),
                      ),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;


                          widget.onPageChange(selectedIndex);
                          print(paginatedWidgetList.length.toString());
                          print("CLICKEDDD");
                        });
                     /*   paginatedWidgetList = List.generate(
                            10, (i) => widget.paginationList[i]);*/
                      })),
            );
          }),
    );
  }

  void generatePaginationCount(List<Widget> paginationList) {
    //print("total data" + paginationList.length.toString());
    final int totalPage = (paginationList.length / 10).round();
    for (int i = 0; i < totalPage; i++) {
      pageCount.add(i);
    }
  }
}
