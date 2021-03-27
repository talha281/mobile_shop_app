import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class AddNewPhoneWidget extends StatefulWidget {
  AddNewPhoneWidget({
    Key? key,
  });

  @override
  _AddNewPhoneWidgetState createState() => _AddNewPhoneWidgetState();
}

class _AddNewPhoneWidgetState extends State<AddNewPhoneWidget> {
  bool canPress = false;
  final TextEditingController companyNameController = TextEditingController();

  final TextEditingController modelNameController = TextEditingController();

  final TextEditingController ramSizeController = TextEditingController();

  final TextEditingController internalsController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController rearCamController = TextEditingController();

  final TextEditingController frontCamController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  showPriceSnack() {
    String p = "[^a-zA-Z]";
    RegExp regExp = new RegExp(p);
    bool priceval = regExp.hasMatch(priceController.text);

    if (!priceval) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('field should contains numbers'),
        ),
      );
      priceController.clear();
    }
  }

  showQuantitySnack() {
    String p = "[^a-zA-Z]";
    RegExp regExp = new RegExp(p);

    bool quantityVal = regExp.hasMatch(quantityController.text);
    if (!quantityVal) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('field should contains numbers'),
        ),
      );
      quantityController.clear();
    }
  }

  validator() {
    String p = "[^a-zA-Z]";
    RegExp regExp = new RegExp(p);
    bool val = regExp.hasMatch(priceController.text);
    bool quantityVal = regExp.hasMatch(quantityController.text);
    var canhit = companyNameController.text.isNotEmpty &&
        modelNameController.text.isNotEmpty &&
        ramSizeController.text.isNotEmpty &&
        internalsController.text.isNotEmpty &&
        quantityController.text.isNotEmpty &&
        rearCamController.text.isNotEmpty &&
        frontCamController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        val &&
        quantityVal;

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
    companyNameController.addListener(() {
      validator();
    });
    modelNameController.addListener(() {
      validator();
    });
    ramSizeController.addListener(() {
      validator();
    });
    internalsController.addListener(() {
      validator();
    });
    quantityController.addListener(() {
      validator();
      showQuantitySnack();
    });
    rearCamController.addListener(() {
      validator();
    });
    frontCamController.addListener(() {
      validator();
    });
    priceController.addListener(() {
      validator();
      showPriceSnack();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          child: Icon(
                            FontAwesomeIcons.mobileAlt,
                            color: ConstColor.primaryColor,
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(FontAwesomeIcons.mobileAlt,
                            color: ConstColor.primaryColor),
                      )
                    ],
                  ),
                ),
                Text(
                  'New Phone Record',
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
                            SizedBox(height: 35),
                            Text('Company', style: TextStyle(fontSize: 15)),
                            TextField(controller: companyNameController),
                            SizedBox(height: 35),
                            Text('Model Name', style: TextStyle(fontSize: 15)),
                            TextFormField(controller: modelNameController),
                            SizedBox(height: 35),
                            Text('RAM', style: TextStyle(fontSize: 15)),
                            TextFormField(
                                controller: ramSizeController,
                                decoration:
                                    InputDecoration(suffixText: 'GB RAM')),
                            SizedBox(height: 35),
                            Text('Internal Storage',
                                style: TextStyle(fontSize: 15)),
                            TextFormField(
                                controller: internalsController,
                                decoration: InputDecoration(
                                    suffixText: 'GB ROM',
                                    suffixStyle: TextStyle(color: Colors.black))
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //         content: Text('Required field is empty'),
                                //       ),
                                //     );
                                // }
                                //   },
                                ),
                            SizedBox(height: 35),
                            Text('Rear Camera', style: TextStyle(fontSize: 15)),
                            TextFormField(
                                controller: rearCamController,
                                decoration: InputDecoration(suffixText: 'MP')),
                            SizedBox(height: 35),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 35),
                            Text('Front Camera',
                                style: TextStyle(fontSize: 15)),
                            TextFormField(
                                controller: frontCamController,
                                decoration: InputDecoration(suffixText: 'MP')),
                            SizedBox(height: 35),
                            Text('Quantity', style: TextStyle(fontSize: 15)),
                            TextFormField(
                              controller: quantityController,
                            ),
                            SizedBox(height: 35),
                            Text('Price', style: TextStyle(fontSize: 15)),
                            TextFormField(
                              controller: priceController,
                            ),
                            SizedBox(height: 70),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30,
                                  width: 90,
                                  child: MaterialButton(
                                    disabledTextColor: Colors.grey,
                                    disabledColor: Colors.blue.shade400,
                                    color: ConstColor.primaryColor,
                                    elevation: 4,
                                    hoverElevation: 20,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    onPressed: (canPress)
                                        ? () async {
                                            int id = await BlocProvider.of<
                                                    DashboardBloc>(context)
                                                .productRecordRepository
                                                .generatedProductId();
                                            ProductModel product = ProductModel(
                                                id: id,
                                                companyName:
                                                    companyNameController.text
                                                        .toLowerCase(),
                                                modelName: modelNameController
                                                    .text
                                                    .toLowerCase(),
                                                ram: ramSizeController.text
                                                    .toLowerCase(),
                                                internalMemory:
                                                    internalsController.text
                                                        .toLowerCase(),
                                                rearCam: rearCamController.text
                                                    .toLowerCase(),
                                                frontCam: frontCamController
                                                    .text
                                                    .toLowerCase(),
                                                price: double.parse(
                                                    priceController.text));

                                            BlocProvider.of<DashboardBloc>(
                                                    context)
                                                .add(AddPhoneDetailsEvent(
                                                    productModel: product,
                                                    quantity: int.parse(
                                                        quantityController
                                                            .text)));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.black,
                                              content: Text(
                                                'Your Data is recorded',
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade700),
                                              ),
                                            ));
                                            companyNameController.clear();
                                            modelNameController.clear();
                                            ramSizeController.clear();
                                            internalsController.clear();
                                            quantityController.clear();
                                            rearCamController.clear();
                                            frontCamController.clear();
                                            priceController.clear();
                                          }
                                        : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'save',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ConstColor.primaryColor,
                                    border: Border.all(
                                        color: ConstColor.primaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  height: 30,
                                  width: 100,
                                  child: MaterialButton(
                                    disabledTextColor: Colors.grey,
                                    disabledColor: Colors.blue.shade400,
                                    color: ConstColor.primaryColor,
                                    elevation: 4,
                                    hoverElevation: 20,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      companyNameController.clear();
                                      modelNameController.clear();
                                      ramSizeController.clear();
                                      internalsController.clear();
                                      quantityController.clear();
                                      rearCamController.clear();
                                      frontCamController.clear();
                                      priceController.clear();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Reset',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
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
}
