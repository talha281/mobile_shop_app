import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/data/models/customer_model.dart';
import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class AddCustomerWidget extends StatefulWidget {
  AddCustomerWidget({
    Key? key,
  });

  @override
  _AddCustomerWidgetState createState() => _AddCustomerWidgetState();
}

class _AddCustomerWidgetState extends State<AddCustomerWidget> {
  String? companyName;
  bool canPress = false;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  validator() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    bool val = regExp.hasMatch(emailController.text);
    var canhit = nameController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        val;

    if (canhit) {
      setState(() {
        canPress = true;
      });
    } else {
      setState(() {
        canPress = false;
      });
    }
  }

  @override
  void initState() {
    contactController.addListener(() {
      validator();
    });
    nameController.addListener(() {
      validator();
    });
    emailController.addListener(() {
      validator();
      //showSnackForEmail();
    });
    priceController.addListener(() {
      validator();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state is AddCustomerState) {
        if (state.companyList!.isEmpty) {
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
                  top: 18.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 9.5, top: 11),
                                child: Icon(FontAwesomeIcons.mobileAlt)),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Icon(FontAwesomeIcons.userAlt,
                                  color: ConstColor.primaryColor),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Customer',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Company',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
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
                                    hint: Text('Select Company'),
                                    elevation: 5,
                                    dropdownColor: Colors.white,
                                    iconSize: 34,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w100),
                                    value: state.companyValue,
                                    items: state.companyList!.map((value) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            //  (state.value!.isEmpty)
                                            //     ? companyName
                                            // :
                                            value!,
                                        child: Text(value.toUpperCase()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(ChangeCompanyName(value));

                                      // setState(() {
                                      //   companyName = value;
                                      // });
                                    },
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Model Name',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
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
                                    hint: Text('Select Model'),
                                    elevation: 5,
                                    dropdownColor: Colors.white,
                                    iconSize: 34,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w100),
                                    value: state.modelValue,
                                    items: state.modelList!.map((value) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            //  (state.value!.isEmpty)
                                            //     ? companyName
                                            // :
                                            value!,
                                        child: Text(value.toUpperCase()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(ChangeModelName(
                                              value, state.companyValue));

                                      // setState(() {
                                      //   companyName = value;
                                      // });
                                    },
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Ram',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
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
                                    hint: Text('Select Ram'),
                                    elevation: 5,
                                    dropdownColor: Colors.white,
                                    iconSize: 34,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w100),
                                    value: state.ramValue,
                                    items: state.ramList!.map((value) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            //  (state.value!.isEmpty)
                                            //     ? companyName
                                            // :
                                            value!,
                                        child: Text(value.toUpperCase()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(ChangeRam(
                                              value,
                                              state.modelValue,
                                              state.companyValue));

                                      // setState(() {
                                      //   companyName = value;
                                      // });
                                    },
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Internal Storage',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
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
                                    hint: Text('Select Internal'),
                                    elevation: 5,
                                    dropdownColor: Colors.white,
                                    iconSize: 34,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w100),
                                    value: state.internalValue,
                                    items:
                                        state.internalStorageList!.map((value) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            //  (state.value!.isEmpty)
                                            //     ? companyName
                                            // :
                                            value!,
                                        child: Text(value.toUpperCase()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(ChangeInternal(
                                        value,
                                        state.modelValue,
                                        state.companyValue,
                                        state.ramValue,
                                      ));

                                      // setState(() {
                                      //   companyName = value;
                                      // });
                                    },
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Price',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextFormField(
                                    controller: priceController,
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Name',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Contact Number',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextFormField(
                                    controller: contactController,
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('Enter email properly*',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11)),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 150,
                                        child: MaterialButton(
                                          disabledTextColor: Colors.grey,
                                          disabledColor: ConstColor.primaryColor
                                              .withOpacity(0.5),
                                          color: ConstColor.primaryColor,
                                          elevation: 4,
                                          hoverElevation: 20,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      20.0)),
                                          onPressed: (canPress)
                                              ? () async {
                                                  int id = await BlocProvider
                                                          .of<DashboardBloc>(
                                                              context)
                                                      .productRecordRepository
                                                      .generatedCustomerId();
                                                  CustomerModel customer =
                                                      CustomerModel(
                                                          customerId: id,
                                                          companyName: state
                                                              .companyValue!
                                                              .toLowerCase(),
                                                          contactNumber:
                                                              contactController
                                                                  .text,
                                                          customerName:
                                                              nameController.text
                                                                  .toLowerCase(),
                                                          email: emailController
                                                              .text
                                                              .toLowerCase(),
                                                          modelName: state
                                                              .modelValue!
                                                              .toLowerCase());
                                                  ProductModel
                                                      product = ProductModel(
                                                          companyName: state
                                                              .companyValue!
                                                              .toLowerCase(),
                                                          modelName: state
                                                              .modelValue!
                                                              .toLowerCase(),
                                                          ram: state
                                                              .ramValue!
                                                              .toLowerCase(),
                                                          internalMemory: state
                                                              .internalValue!
                                                              .toLowerCase(),
                                                          price: double.parse(
                                                              priceController
                                                                  .text));
                                                  BlocProvider.of<
                                                              DashboardBloc>(
                                                          context)
                                                      .add(AddCustomerDetails(
                                                          productModel: product,
                                                          customerModel:
                                                              customer));
                                                  emailController.clear();
                                                  contactController.clear();
                                                  nameController.clear();
                                                  priceController.clear();
                                                }
                                              : null,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'Purchase this item',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ConstColor.primaryColor,
                                          border: Border.all(
                                              color: ConstColor.primaryColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        height: 30,
                                        width: 100,
                                        child: MaterialButton(
                                          disabledTextColor: Colors.grey,
                                          disabledColor: ConstColor.primaryColor
                                              .withOpacity(0.5),
                                          color: ConstColor.primaryColor,
                                          elevation: 4,
                                          hoverElevation: 20,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      20.0)),
                                          onPressed: () {
                                            emailController.clear();
                                            contactController.clear();
                                            nameController.clear();
                                            priceController.clear();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'Reset',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
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
