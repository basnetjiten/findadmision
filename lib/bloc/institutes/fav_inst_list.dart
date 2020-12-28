import 'dart:async';
import 'dart:math';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/fav_univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/save_inst_bloc/save_inst_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/filterdto.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/saved_univ.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/nav_drawer.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/colleges_univ_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/colleges_list_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/filter_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/sort_college_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';

class FavInstitutes extends StatefulWidget {
  @override
  _FavInstitutesState createState() => _FavInstitutesState();
}

class _FavInstitutesState extends State<FavInstitutes> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget institutePage;
  UnivFavFilterBloc _univFavFilterBloc;
  List<Widget> initialCollegeCards;
  List<Widget> filteredCollegeCards;
  Set<Widget> paginatedCards = Set();

  //randomize the college and universities
  final _random = new Random();
  int selectedIndex = 0;
  int startItem = 0;
  int endItem = 10;
  int rowsShown = 10;
  bool isLoading = true;
  SaveInstBloc _saveInstBloc;
  SavedUnivList univFavFilterResponse;

  // creating the timer that stops the loading after 15 secs
  void startTimer(temp) {
    Timer.periodic(const Duration(milliseconds: 500), (t) {
      setState(() {
        isLoading = false;
        filteredCollegeCards = temp; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  @override
  void initState() {
    _saveInstBloc = SaveInstBloc();
    initialCollegeCards = [];
    filteredCollegeCards = [];

    _univFavFilterBloc = UnivFavFilterBloc()..add(FetchFavUnivData());

    if (selectedHomeDegree.isNotEmpty) {
      print("EXECUTINGG..");
      //courseFilterOnly();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("PAGE REBUILDING");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: NavigationDrawer(onCountryFiltered: onCountryFiltered),
      body: Center(
        child: BlocListener<SaveInstBloc, SaveInstState>(
          cubit: _saveInstBloc,
          listener: (context, state) {
            if (state is InstSaved) {
              AppWidgetHelper.showSnackBar(
                  "Institute saved", context, AppTheme.checkBoxCheckedColor);
            }
            if (state is InstDeleted) {
              AppWidgetHelper.showSnackBar(
                  "Institute deleted", context, AppTheme.officeBGColor);
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: sizeConfig.screenHeight * 0.05,
              ),
              FilterUniversityCard(scaffoldKey: _scaffoldKey),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  //color: AppTheme.greyBackground,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ignore: missing_return
                          BlocBuilder<UnivFavFilterBloc, UnivFavFilterState>(
                            cubit: _univFavFilterBloc,
                            // ignore: missing_return
                            builder: (context, state) {
                              if (state is UnivFavFilterInitial) {
                                return Center(
                                  child: NutsActivityIndicator(
                                    radius: 25,
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.lightBlueAccent,
                                    tickCount: 10,
                                    startRatio: 0.5,
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                  ),
                                );
                              }
                              if (state is UnivFavDataFetched) {
                                univFavFilterResponse = state.savedUnivList;
                                initialCollegeCards.clear();
                                filteredCollegeCards.clear();
                                univFavFilterResponse.match.forEach((match) {
                                  initialCollegeCards.add(CollegeListCard(
                                      favInstBloc: _saveInstBloc,
                                      univMatch: match));
                                });

                                return (filteredCollegeCards.isEmpty)
                                    ? Column(
                                        key: ValueKey<dynamic>(
                                            initialCollegeCards),
                                        children: [
                                          Text(
                                            "${initialCollegeCards.length} Matched Colleges & Universities",
                                            style: AppTheme.helperLabelStyle
                                                .copyWith(
                                                    color: AppTheme
                                                        .cardTitleTxtColor),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Sort By",
                                                style: AppTheme
                                                    .clickableTermsStyle
                                                    .copyWith(
                                                        color: AppTheme
                                                            .cardTitleTxtColor),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 40,
                                                  width: 190,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child:
                                                        SortCollegeDropDown(),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ...initialCollegeCards.map((element) {
                                            var index = initialCollegeCards
                                                .indexOf(element);
                                            if (index <= 9) {
                                              return element;
                                            } else {
                                              return SizedBox();
                                            }
                                          }).toList(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Showing $startItem - $endItem of ${initialCollegeCards.length} Results",
                                            style: AppTheme.helperLabelStyle
                                                .copyWith(
                                                    color: AppTheme
                                                        .cardTitleTxtColor),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          buildAllResultPagination(),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      )
                                    : isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Column(
                                            key: ValueKey<dynamic>(
                                                filteredCollegeCards),
                                            children: [
                                              Text(
                                                "${paginatedCards.isNotEmpty ? paginatedCards.length : filteredCollegeCards.length} Matched Colleges & Universities",
                                                style: AppTheme.helperLabelStyle
                                                    .copyWith(
                                                        color: AppTheme
                                                            .cardTitleTxtColor),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Sort By",
                                                    style: AppTheme
                                                        .clickableTermsStyle
                                                        .copyWith(
                                                            color: AppTheme
                                                                .cardTitleTxtColor),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      height: 40,
                                                      width: 190,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    18.0),
                                                        child:
                                                            SortCollegeDropDown(),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: 20,
                                                width: 500,
                                                color: Colors.green,
                                              ),
                                              ...filteredCollegeCards
                                                  .map((element) {
                                                // get index
                                                //print("ITEM FILTERED",+element.)
                                                var index = filteredCollegeCards
                                                    .indexOf(element);
                                                //print("FILTERED INDEX" + index.toString());
                                                if (index <= 9) {
                                                  return element;
                                                } else {
                                                  return SizedBox();
                                                }
                                              }).toList(),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Showing $startItem - ${endItem > paginatedCards.length ? paginatedCards.length : endItem} of ${paginatedCards.isNotEmpty ? paginatedCards.length : filteredCollegeCards.length} Results",
                                                style: AppTheme.helperLabelStyle
                                                    .copyWith(
                                                        color: AppTheme
                                                            .cardTitleTxtColor),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              buildFilterPagination(),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          );
                              }
                              if (state is UnivFavEmptyData) {
                                return Center(
                                  child: Text("No any saved Institutes"),
                                );
                              }
                            },
                          ),
                          /*Visibility(
                            visible: initialCollegeCards.isEmpty,
                            child: Center(child: CircularProgressIndicator()),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildFilterPagination() {
    return Container(
      key: ValueKey<int>(_random.nextInt(filteredCollegeCards.length)),
      height: 50,
      width: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: paginatedCards.isEmpty
              ? (filteredCollegeCards.length / rowsShown).round()
              : (paginatedCards.length / rowsShown).round(),
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

                          getFilteredData(index);
                        });
                      })),
            );
          }),
    );
  }

  Container buildAllResultPagination() {
    return Container(
      key: ValueKey<int>(_random.nextInt(initialCollegeCards.length)),
      height: 50,
      width: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: (initialCollegeCards.length / rowsShown).round(),
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

                          // widget.onPageChange(selectedIndex);
                          onAllInstitutePagination(selectedIndex);
                          print("CLICKEDDD");
                        });
                        /*   paginatedWidgetList = List.generate(
                          10, (i) => widget.paginationList[i]);*/
                      })),
            );
          }),
    );
  }

  void onCountryFiltered(FilterDto filterDto) {
    setState(() {
      filteredCollegeCards.clear();
      paginatedCards.clear();
    });
    List<Widget> tempCard = [];
    if (filterDto.feeRange.isNotEmpty) {
      univFavFilterResponse.match.forEach((element) {
        filterDto.feeRange.forEach((feeRangeValue) {
          // print("country filter id" + activeCountry);
          if (feeRangeValue.start * 1000 >= element.budgetstart &&
              feeRangeValue.start * 1000 <= int.parse(element.budgetend)) {
            print("MATCHED FEE UNIVERSITY" + element.name);
            setState(() {
              tempCard.add(CollegeListCard(
                  favInstBloc: _saveInstBloc, univMatch: element));
            });

            // cardList=CollegeListCard(univMatch: element);

          }
        });
      });
    }

    if (filterDto.locationFilter.isNotEmpty) {
      univFavFilterResponse.match.forEach((element) {
        filterDto.locationFilter.forEach((activeCountry) {
          // print("country filter id" + activeCountry);
          if (element.countryid == activeCountry.countryId) {
            print("MATCHED UNIVERSITY" + element.name);
            setState(() {
              tempCard.add(CollegeListCard(
                  favInstBloc: _saveInstBloc, univMatch: element));
            });

            // cardList=CollegeListCard(univMatch: element);

          }
        });
      });
    }
    if (filterDto.dateFilter.isNotEmpty) {
      univFavFilterResponse.match.forEach((element) {
        filterDto.dateFilter.forEach((startDate) {
          print("country filter id" + startDate.name);
          element.startlist.forEach((startMnth) {
            if (startMnth == startDate.name) {
              print("MATCHED UNIVERSITY" + element.name);

              setState(() {
                tempCard.add(CollegeListCard(
                    favInstBloc: _saveInstBloc, univMatch: element));
              });
            }
          });
        });
      });
    }
    if (filterDto.cityFilter.isNotEmpty) {
      univFavFilterResponse.match.forEach((element) {
        filterDto.cityFilter.forEach((cityFilter) {
          // print("country filter id" + dateId);
          if (element.cityid == cityFilter.id) {
            setState(() {
              tempCard.add(CollegeListCard(
                  favInstBloc: _saveInstBloc, univMatch: element));
            });
          }
        });
      });
      // initialCollegeCards.insertAll(0, filteredCollegeCards);
    }
    if (filterDto.degreeFilter.isNotEmpty) {
      univFavFilterResponse.match.forEach((element) {
        filterDto.degreeFilter.forEach((degreeFilter) {
          element.degreelist.forEach((degreeIds) {
            if (degreeIds == degreeFilter.degreeId) {
              setState(() {
                tempCard.add(CollegeListCard(
                    favInstBloc: _saveInstBloc, univMatch: element));
              });
            }
          });
        });
      });
      // initialCollegeCards.insertAll(0, filteredCollegeCards);
    }
    if (tempCard.isNotEmpty) {
      setState(() {
        isLoading = false;
        filteredCollegeCards = tempCard;
        paginatedCards.addAll(filteredCollegeCards);
      });
    } else {
      setState(() {
        filteredCollegeCards.clear();
      });
    }
    filteredCollegeCards.shuffle(_random);
  }

  void getFilteredData(int currentPage) {
    final List<Widget> temp = [];

    startItem = currentPage * rowsShown;
    endItem = startItem + rowsShown;
    var realTotal =
        endItem >= paginatedCards.length ? paginatedCards.length : endItem;
    //print("START" + startItem.toString() + "END" + endItem.toString());
    //print("PAGINATED CARD" + paginatedCards.length.toString());
    for (var i = startItem; i < realTotal; i++) {
      setState(() {
        //if (paginatedCards.toList()[i] != null) {
        temp.add(paginatedCards.toList()[i]);
        // }
      });
    }
    if (temp.isNotEmpty) {
      // setState(() {
      startTimer(temp);

      //});
    } else {
      setState(() {
        filteredCollegeCards.clear();
      });
    }
    filteredCollegeCards.shuffle(_random);
  }

  void onAllInstitutePagination(int currentPage) {
    final List<Widget> temp = [];
    startItem = currentPage * rowsShown;
    endItem = startItem + rowsShown;
    var realTotal = initialCollegeCards.length;

    for (var i = startItem; i < realTotal; i++) {
      setState(() {
        // if (paginatedCards.toList()[i] != null) {
        temp.add(initialCollegeCards[i]);
        //}
      });
    }
    if (temp.isNotEmpty) {
      setState(() {
        initialCollegeCards = temp;
      });
    } else {
      setState(() {
        initialCollegeCards.clear();
      });
    }
    initialCollegeCards.shuffle(_random);
  }

  void courseFilterOnly() {
    List<Widget> tempCourseCardList = [];

    univFavFilterResponse.match.forEach((element) {
      selectedHomeDegree.forEach((degreeFilter) {
        element.degreelist.forEach((degreeIds) {
          if (degreeIds == degreeFilter.degreeId) {
            setState(() {
              tempCourseCardList.add(CollegeListCard(
                  favInstBloc: _saveInstBloc, univMatch: element));
            });
          }
        });
      });
    });

    if (tempCourseCardList.isNotEmpty) {
      setState(() {
        filteredCollegeCards = tempCourseCardList;
        paginatedCards.addAll(filteredCollegeCards);
      });
    } else {
      setState(() {
        filteredCollegeCards.clear();
      });
    }
    filteredCollegeCards.shuffle(_random);
  }
}
