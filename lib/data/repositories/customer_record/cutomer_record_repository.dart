import 'dart:convert';

import 'package:mobile_shop_app/data/models/customer_model.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/i_customer_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRecordRepository implements ICustomerRecordRepository {
  void addProduct(CustomerModel? customer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<CustomerModel?> _customerList = [];
    List<String>? listFromPref = prefs.getStringList('custlistFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _customerList.add(CustomerModel.fromJson(jsonDecode(element)));
      });
      _customerList.add(customer);
      List<String>? listToPref = [];
      _customerList.forEach((element) {
        listToPref.add(jsonEncode(element!.toJson()));
      });
      print('customer list\n$listToPref\n customerlist ends');
      prefs.setStringList('custlistFromPref', listToPref);
    } else {
      print(_customerList);
      _customerList.add(customer);
      List<String>? listToPref = [];
      _customerList.forEach((element) {
        listToPref.add(jsonEncode(element!.toJson()));
      });
      prefs.setStringList('custlistFromPref', listToPref);
      print('list of customer list\n$_customerList\n list of customer ends');
    }
  }

    List<String?>? searchByCategory() {
    List<String?>? searchByCategory = [
      'company-Name',
      'customer-Name',
      'contact-Number',
      'model-Name'
    ];
    return searchByCategory;
  }

  Future<List<CustomerModel?>> getCustomersList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<CustomerModel?> _customersList = [];
    List<String>? listFromPref = prefs.getStringList('custlistFromPref');
    print('checking listFrom pref\n$listFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _customersList.add(CustomerModel.fromJson(jsonDecode(element)));
      });
      return _customersList;
    } else {
      print('nowhere');
      return [];
    }
  }

    Future<List<CustomerModel?>> getCustomerList(
      {String? searchby, String? searchElement}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<CustomerModel?> _customerList = [];
    List<String>? listFromPref = prefs.getStringList('custlistFromPref');
    print('checking listFrom pref\n$listFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _customerList.add(CustomerModel.fromJson(jsonDecode(element)));
      });
      
      print('this is productList\n$_customerList');
      if (searchby == 'company-Name') {
        print('we are in company Name');
        Iterable<CustomerModel?> filteredRequiredList = _customerList.where(
            (element) =>
                element!.companyName!.contains(searchElement!) );

        print(filteredRequiredList.toList());
        return filteredRequiredList.toList();
        // print();
      } else if (searchby == 'customer-Name') {
        print('we are in customer Name');
        Iterable<CustomerModel?> filteredRequiredList = _customerList.where(
            (element) =>
                element!.customerName!.contains(searchElement!) );
        return filteredRequiredList.toList();
      } else if (searchby == 'contact-Number') {
        print('we are in contact number');
        Iterable<CustomerModel?> filteredRequiredList = _customerList.where(
            (element) =>
                element!.contactNumber!.contains(searchElement!));
        return filteredRequiredList.toList();
      } else if (searchby == 'model-Name') {
        print('we are in internal');
        Iterable<CustomerModel?> filteredRequiredList = _customerList.where(
            (element) =>
                element!.modelName!.contains(searchElement!));
        return filteredRequiredList.toList();
      } else {
        print('else wali customerList');
        return _customerList;
      }
    } else {
      print('nowhere');
      return [];
    }
  }
  }