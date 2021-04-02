import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class StocksWidget extends StatelessWidget {
  const StocksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state is StocksState) {
        if (state.productlist.isEmpty) {
          return Center(
              child: Text(
            'No Stocks Available!',
            style: TextStyle(fontSize: 38),
          ));
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 20,
                  right: MediaQuery.of(context).size.width / 20,
                  top: 22.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.book_rounded,
                            color: ConstColor.primaryColor,
                            size: 28,
                          )),
                      Text(
                        'Stocks',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        Text(
                          'Search By',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ConstColor.primaryColor),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: 250,
                          // decoration: BoxDecoration(
                          //     border:
                          //         Border.all(color: ConstColor.primaryColor),
                          //     borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            focusColor: ConstColor.primaryColor,
                            underline: Container(
                              height: 1.0,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            hint: Text('Select Category'),
                            elevation: 5,
                            dropdownColor: Colors.white,
                            iconSize: 34,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w100),
                            value: state.categoryValue,
                            items: state.searchbyCategory!.map((value) {
                              return DropdownMenuItem<String>(
                                value:
                                    //  (state.value!.isEmpty)
                                    //     ? companyName
                                    // :
                                    value!,
                                child: Text(
                                    value.replaceAll("-", " ").toUpperCase()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              BlocProvider.of<DashboardBloc>(context)
                                  .add(CheckingStocks(categoryValue: value));
                              print(value);
                              // setState(() {
                              //   companyName = value;
                              // });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Search Your product',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ConstColor.primaryColor),
                        ),
                        Container(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(CheckingStocks(
                                              searchBy: state.categoryValue,
                                              searchElement: search.text,
                                              categoryValue:
                                                  state.categoryValue));
                                    },
                                    child: Icon(FontAwesomeIcons.search,
                                        size: 18)),
                                hintText: 'Search here...'),
                            controller: search,
                            onSubmitted: (search) {
                              BlocProvider.of<DashboardBloc>(context).add(
                                  CheckingStocks(
                                      searchBy: state.categoryValue,
                                      searchElement: search,
                                      categoryValue: state.categoryValue));
                            },

                            // onChanged: (search) {
                            //   BlocProvider.of<DashboardBloc>(context)
                            //       .add(CheckingStocks(searchElement: search));
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ConstColor.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: (state.stockList.isEmpty)
                                  ? Container(
                                      padding: EdgeInsets.all(40),
                                      child: Center(
                                          child: Text(
                                        'No Stocks Available!',
                                        style: TextStyle(fontSize: 24),
                                      )))
                                  : DataTable(
                                      showBottomBorder: true,
                                      headingRowColor:
                                          MaterialStateColor.resolveWith(
                                        (states) {
                                          return ConstColor.primaryColor
                                              .withOpacity(0.5);
                                        },
                                      ),
                                      columns: <DataColumn>[
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                22,
                                            child: Center(
                                              child: Text(
                                                'Sr.no'.toUpperCase(),
                                                style: TextStyle(
                                                    color:
                                                        ConstColor.primaryColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Company '.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Name'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Model '.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Name'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                18,
                                            child: Center(
                                              child: Text(
                                                'Ram'.toUpperCase(),
                                                style: TextStyle(
                                                    color:
                                                        ConstColor.primaryColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Internal '.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Memory'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Rear '.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Camera'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'front '.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  'Camera'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: ConstColor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Center(
                                              child: Text(
                                                'Price'.toUpperCase(),
                                                style: TextStyle(
                                                    color:
                                                        ConstColor.primaryColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                15,
                                            child: Center(
                                              child: Text(
                                                'Qunatity'.toUpperCase(),
                                                style: TextStyle(
                                                    color:
                                                        ConstColor.primaryColor,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      columnSpacing: 10,
                                      rows: state.stockList
                                          .map(
                                            (product) => DataRow(
                                              cells: [
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              22,
                                                      child: Center(
                                                        child: Text(
                                                            "${state.stockList.indexOf(product) + 1}",
                                                            style: TextStyle(
                                                                fontSize: 11)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                          product!.product!
                                                              .companyName!.toUpperCase(),
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                          product.product!
                                                              .modelName!,
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                      child: Center(
                                                        child: Text(
                                                          '${product.product!.ram!}GB',
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                      child: Center(
                                                        child: Text(
                                                         '${product.product!
                                                              .internalMemory!}GB',
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                          '${product.product!
                                                              .rearCam!}MP',
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                         '${product.product!
                                                              .frontCam!}MP',
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                          product
                                                              .product!.price!
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                      child: Center(
                                                        child: Text(
                                                          product.quantity
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else if (state is Loading) {
        return Container(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Container();
      }
    });
  }
}
