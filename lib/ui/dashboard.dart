import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/data/models/product_record_model.dart';
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
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 68.0),
                  child: Column(
                    children: [
                      BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                FontAwesomeIcons.mobileAlt,
                                color: (state is AddPhoneState)
                                    ? Colors.blue.shade600
                                    : Colors.white,
                              ),
                              title: Text('Add New Phone',
                                  style: (state is AddPhoneState)
                                      ? TextStyle(
                                          color: Colors.blue.shade800,
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
                                          color: Colors.blue.shade800,
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
                                    ? Colors.blue.shade800
                                    : Colors.white,
                              ),
                              title: Text('Stocks',
                                  style: (state is StocksState)
                                      ? TextStyle(
                                          color: Colors.blue.shade800,
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
                                    ? Colors.blue.shade600
                                    : Colors.white,
                              ),
                              title: Text('Customer Records',
                                  style: (state is CustomerRecordState)
                                      ? TextStyle(
                                          color: Colors.blue.shade800,
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
                                          color: Colors.blue.shade800,
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
                    } else if (state is Loading) {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 228.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                'Welcome,sir\n Let us carry your half burden',
                                style: TextStyle(fontSize: 22),
                              )),
                            ],
                          ),
                        ),
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
