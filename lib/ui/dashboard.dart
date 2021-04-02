import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';
import 'package:mobile_shop_app/ui/customer_record_widget.dart';
import 'package:mobile_shop_app/ui/delete_phone_record.dart';
import 'package:mobile_shop_app/ui/stocks_widget.dart';

import 'add_customer_widget.dart';
import 'add_new_phone.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [
              ConstColor.accentColor,
              ConstColor.primaryColor,
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(LogOut(context));
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 45),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                FontAwesomeIcons.powerOff,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 100,
                        child: Image.asset('assets/images/double_phone.png',
                            height: 500, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.mobileAlt,
                                color: (state is AddPhoneState)
                                    ? ConstColor.primaryColor.withOpacity(0.5)
                                    : Colors.white,
                              ),
                              title: Text('Add New Phone',
                                  style: (state is AddPhoneState)
                                      ? TextStyle(
                                          color: ConstColor.primaryColor,
                                          fontSize: 16)
                                      : TextStyle(
                                          color: Colors.white, fontSize: 13)),
                              onTap: () {
                                BlocProvider.of<DashboardBloc>(context)
                                    .add(AddPhoneEvent());
                              },
                              horizontalTitleGap: 5.5,
                              tileColor: (state is AddPhoneState)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          );
                        },
                      ),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.userFriends,
                                color: (state is AddCustomerState)
                                    ? Colors.lightBlue
                                    : Colors.white,
                              ),
                              title: Text('Customers',
                                  style: (state is AddCustomerState)
                                      ? TextStyle(
                                          color: ConstColor.primaryColor,
                                          fontSize: 16)
                                      : TextStyle(
                                          color: Colors.white, fontSize: 13)),
                              onTap: () {
                                BlocProvider.of<DashboardBloc>(context)
                                    .add(AddCustomerEvent());
                              },
                              horizontalTitleGap: 5.5,
                              tileColor: (state is AddCustomerState)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          );
                        },
                      ),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.inbox,
                                color: (state is StocksState)
                                    ? ConstColor.primaryColor
                                    : Colors.white,
                              ),
                              title: Text('Stocks',
                                  style: (state is StocksState)
                                      ? TextStyle(
                                          color: ConstColor.primaryColor,
                                          fontSize: 16)
                                      : TextStyle(
                                          color: Colors.white, fontSize: 13)),
                              onTap: () {
                                BlocProvider.of<DashboardBloc>(context)
                                    .add(CheckStocksEvent());
                              },
                              horizontalTitleGap: 5.5,
                              tileColor: (state is StocksState)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          );
                        },
                      ),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.searchengin,
                                color: (state is CustomerRecordState)
                                    ? ConstColor.primaryColor.withOpacity(0.5)
                                    : Colors.white,
                              ),
                              title: Text('Customer Records',
                                  style: (state is CustomerRecordState)
                                      ? TextStyle(
                                          color: ConstColor.primaryColor,
                                          fontSize: 16)
                                      : TextStyle(
                                          color: Colors.white, fontSize: 13)),
                              onTap: () {
                                BlocProvider.of<DashboardBloc>(context)
                                    .add(CheckCustomerRecords());
                              },
                              horizontalTitleGap: 5.5,
                              tileColor: (state is CustomerRecordState)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          );
                        },
                      ),
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.trash,
                                color: (state is DeletePhoneState)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              title: Text('Delete Phone Record',
                                  style: (state is DeletePhoneState)
                                      ? TextStyle(
                                          color: ConstColor.primaryColor,
                                          fontSize: 16)
                                      : TextStyle(
                                          color: Colors.white, fontSize: 13)),
                              onTap: () {
                                BlocProvider.of<DashboardBloc>(context)
                                    .add(DeletePhoneRecords());
                              },
                              horizontalTitleGap: 5.5,
                              tileColor: (state is DeletePhoneState)
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          );
                        },
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 15),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: MaterialButton(
                      //     color: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(10.0)),
                      //     onPressed: () {
                      //       BlocProvider.of<AuthBloc>(context)
                      //           .add(LogOut(context));
                      //     },
                      //     child: Text('Log Out'),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2 +
                    MediaQuery.of(context).size.width / 3.4,
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state is AddPhoneState) {
                      return AddNewPhoneWidget();
                    } else if (state is AddCustomerState) {
//from the list of the PhoneRecordModel we will extract Company name and modelName and convert it to list
//so that we can show in dropdown
                      return AddCustomerWidget();
                    } else if (state is StocksState) {
                      return StocksWidget();
                    } else if (state is CustomerRecordState) {
                      return CustomerRecordWidget();
                    } else if (state is DeletePhoneState) {
                      return DeleteStocksWidget();
                    } else {
                      return Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        end: Alignment.topCenter,
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          ConstColor.accentColor,
                                          ConstColor.primaryColor,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .mobileAlt,
                                                      color: ConstColor
                                                          .primaryColor,
                                                      size: 85,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 85, bottom: 12),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 85, bottom: 12),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 60),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // padding: EdgeInsets.only(
                                                    //     bottom: 60),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 80, right: 160),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 70, right: 70),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 85,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Welcome,',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 41,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4),
                                                          child: Text(
                                                            "Here's Your True Companion",
                                                            style: TextStyle(
                                                                fontSize: 40,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Container(
                                            padding: EdgeInsets.all(45),
                                            child: Center(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 170, bottom: 50),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 215,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        right: 170, bottom: 50),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 215,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 215,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Center(
                                                            child: Text(
                                                                'Share your burden with us.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Center(
                                                          child: Text(
                                                              'MOBILE SHOP SYSTEM',
                                                              style: TextStyle(
                                                                  fontSize: 50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Center(
                                                            child: Text(
                                                                'A partner to ease your work.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 9.5, top: 11),
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .mobileAlt,
                                                          color: ConstColor
                                                              .primaryColor,
                                                          size: 25)),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 108),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .mobileAlt,
                                                      color: ConstColor
                                                          .primaryColor,
                                                      size: 25,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      bottom: 5,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 95,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      bottom: 73,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .mobileAlt,
                                                        color: ConstColor
                                                            .primaryColor,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .mobileAlt,
                                                      color: ConstColor
                                                          .primaryColor,
                                                      size: 95,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .mobileAlt,
                                                      color: ConstColor
                                                          .primaryColor,
                                                      size: 95,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              //      Text(
                                              //   'Text bas aise hi',
                                              //   style: TextStyle(
                                              //       fontSize: 43,
                                              //       color: Colors.white,
                                              //       fontWeight: FontWeight.w700),
                                              // )
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
