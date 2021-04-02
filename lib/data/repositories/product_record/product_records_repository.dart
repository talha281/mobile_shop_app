import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/data/models/product_record_model.dart';
import 'package:mobile_shop_app/data/repositories/product_record/i_product_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRecordRepository implements IProductRecordRepository {
  //for  new project of mobile shop app
  //wist stored in perferences & convert that list of strings into list of model
  // on every time when we will call the functions of this repository then we will call one function with that function
  //In that function the code will be of converting that prefs list into model list.
  // And after working with models list we will make a function in which we will store list in preferences

  void addProduct(ProductModel? product, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    
    List<ProductRecordModel?> _productList = [];
    // int id = await generatedProductId();
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
      });

      ProductRecordModel? selectedProduct = _productList.firstWhere(
          (element) =>
              element!.product!.companyName ==
                  product!.companyName!.toLowerCase() &&
              element.product!.modelName == product.modelName!.toLowerCase() &&
              element.product!.ram == product.ram!.toLowerCase() &&
              element.product!.internalMemory ==
                  product.internalMemory!.toLowerCase(),
          orElse: () {});
      print(_productList);
      if (selectedProduct != null) {
        print('this is first quantity ${selectedProduct.quantity}');
        int index = _productList.indexOf(selectedProduct);
        _productList.removeAt(index);
        ProductRecordModel? product = selectedProduct.copyWith(
            quantity: selectedProduct.quantity + quantity);
        _productList.insert(index, product);
        print('this is final quantity${selectedProduct.quantity}');
      }
      //_addNewProduct(product, _productList, quantity);

      List<String>? listToPref = [];
      _productList.forEach((element) {
        listToPref.add(jsonEncode(element!.toJson()));
      });
      prefs.setStringList('prodlistFromPref', listToPref);
    } else {
      print('bigger else condition');
      _addNewProduct(
          product!, _productList, quantity, await generatedProductId());

      List<String>? listToPref = [];
      _productList.forEach((element) {
        listToPref.add(jsonEncode(element!.toJson()));
      });

      prefs.setStringList('prodlistFromPref', listToPref);
    }
    // we will store the list to prefs again
  }

  _addNewProduct(ProductModel product, List<ProductRecordModel?> productList,
      int quantity, int id) {
    ProductModel tempProduct = product.copyWith(id: id);
    print('this is id $id');
    productList.add(ProductRecordModel(
      product: tempProduct,
      quantity: quantity,
    ));
  }

//for collecting Model List
  Future<List<String?>> modelList(String companyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    listFromPref!.forEach((element) {
      _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
    });

    List<String?> modelNameList = [];
    final seen = Set<String>();
    Iterable<ProductRecordModel?> filteredCompanyList = _productList
        .where((element) => element!.product!.companyName == companyName);

    filteredCompanyList.forEach((element) {
      modelNameList.add(element!.product!.modelName);
    });
    List<String?> filteredList =
        modelNameList.where((element) => seen.add(element!)).toList();
    return filteredList;
  }

// for collecting ram list
  Future<List<String?>> ramList(
    String companyName,
    String modelName,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    listFromPref!.forEach((element) {
      _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
    });

    List<String?> ramList = [];
    final seen = Set<String>();
    Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
        (element) =>
            element!.product!.companyName == companyName &&
            element.product!.modelName == modelName);

    filteredRequiredList.forEach((element) {
      ramList.add(element!.product!.ram);
    });
    List<String?> filteredList =
        ramList.where((element) => seen.add(element!)).toList();
    return filteredList;
  }

  // for collecting internal list
  Future<List<String?>> internalList(
      String companyName, String modelName, String ram) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    listFromPref!.forEach((element) {
      _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
    });

    List<String?> internalStorageList = [];
    final seen = Set<String>();
    Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
        (element) =>
            element!.product!.companyName == companyName &&
            element.product!.modelName == modelName &&
            element.product!.ram == ram);

    filteredRequiredList.forEach((element) {
      internalStorageList.add(element!.product!.internalMemory);
    });
    List<String?> filteredList =
        internalStorageList.where((element) => seen.add(element!)).toList();
    return filteredList;
  }

  //for collecting Company List
  Future<List<String?>> companyList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('hi');
    // prefs.clear();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    print('I am here');
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    print('what are you searching here');

    print('this is $listFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
      });

      List<String?> companyNameList = [];
      final seen = Set<String>();
      _productList.forEach((element) {
        companyNameList.add(element!.product!.companyName);
      });
      print('this is $companyNameList');

      List<String?> filteredList =
          companyNameList.where((element) => seen.add(element!)).toList();

      return filteredList;
    } else {
      return [];
    }
  }

  //for generating id for productRecord
  Future<int> generatedProductId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? storedId = prefs.getInt('productId');

    if (storedId != null) {
      int idToPrefs = storedId + 1;
      //prefs.remove('productId');

      prefs.setInt('productId', idToPrefs);
      return idToPrefs;
    } else {
      prefs.setInt('productId', 1);
      return 1;
    }
  }

  // setInitialIds() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('customerId', 0);
  //   prefs.setInt('productId', 0);
  // }

  //for generating id for productRecord
  Future<int> generatedCustomerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? storedId = prefs.getInt('customerId');

    if (storedId != null) {
      int idToPrefs = storedId + 1;

      prefs.setInt('customerId', idToPrefs);
      return idToPrefs;
    } else {
      prefs.setInt('customerId', 1);
      return 1;
    }
  }

  //we will use this in customer purchase
  void removeItem(ProductModel? product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('remove item func starts here');
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');

    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
      });
      print(
          'list of pref \n$listFromPref \n list of prefs ends\nbole toh ends here');
      ProductRecordModel? productRecord = _productList.firstWhere((element) =>
          element!.product!.companyName == product!.companyName &&
          element.product!.modelName == product.modelName &&
          element.product!.ram == product.ram &&
          element.product!.internalMemory == product.internalMemory);
      print('productRecord model \n$productRecord\n product model ends here');
      _decrementQuantity(productRecord!, _productList);
      List<String>? listToPref = [];
      _productList.forEach((element) {
        listToPref.add(jsonEncode(element!.toJson()));
      });
      print('list of final prefs\n$listToPref\n list of final prefs');
      prefs.setStringList('prodlistFromPref', listToPref);
    } else {
      return print('prefs is null');
    }
  }

  //because of adding new instance of everytype same is wrong from my view
//we should just add quanity if every prop is same not make a new id
  void _decrementQuantity(
      ProductRecordModel productRecord, List<ProductRecordModel?> productList) {
    int? _index = productList.indexOf(productRecord);
    if (productList[_index]!.quantity <= 1) {
      removeProductItem(productList[_index]!.product);
    } else {
      productList[_index]!.quantity--;
    }
  }

  // we will use this in delete phone record
  void removeProductItem(ProductModel? product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    listFromPref!.forEach((element) {
      _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
    });
    ProductRecordModel? productRecord =
        _productList.firstWhere((element) => element!.product == product);
    _productList.removeAt(_productList.indexOf(productRecord));
    print("agar zero b rahi na$_productList");
    List<String>? listToPref = [];
    _productList.forEach((element) {
      listToPref.add(jsonEncode(element!.toJson()));
    });
    prefs.setStringList('prodlistFromPref', listToPref);
  }

  List<String?>? searchByCategory() {
    List<String?>? searchByCategory = [
      'company-Name',
      'model-Name',
      'ram',
      'internal-Memory'
    ];
    return searchByCategory;
  }

  Future<List<ProductRecordModel?>> getproductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    print('checking listFrom pref\n$listFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
      });
      return _productList;
    } else {
      print('nowhere');
      return [];
    }
  }

  Future<List<ProductRecordModel?>> getStocksList(
      {String? searchby, String? searchElement}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // we will get from prefs & add to list
    List<ProductRecordModel?> _productList = [];
    List<String>? listFromPref = prefs.getStringList('prodlistFromPref');
    print('checking listFrom pref\n$listFromPref');
    if (listFromPref != null) {
      listFromPref.forEach((element) {
        _productList.add(ProductRecordModel.fromJson(jsonDecode(element)));
      });

      print('this is productList\n$_productList');
      if (searchby == 'company-Name') {
        print('we are in company Name');
        Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
            (element) => element!.product!.companyName!
                .contains(searchElement!.toLowerCase()));

        print(filteredRequiredList.toList());
        return filteredRequiredList.toList();
        // print();
      } else if (searchby == 'model-Name') {
        print('we are in model Name');
        Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
            (element) => element!.product!.modelName!
                .contains(searchElement!.toLowerCase()));
        return filteredRequiredList.toList();
      } else if (searchby == 'ram') {
        print('we are in ram');
        Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
            (element) =>
                element!.product!.ram!.contains(searchElement!.toLowerCase())
            // ||
            // element.product!.ram!.contains(searchElement.substring(1, 3))
            );
        return filteredRequiredList.toList();
      } else if (searchby == 'internal-Memory') {
        print('we are in internal');
        Iterable<ProductRecordModel?> filteredRequiredList = _productList.where(
            (element) => element!.product!.internalMemory!
                .contains(searchElement!.toLowerCase()));
        return filteredRequiredList.toList();
      } else {
        print('else wali productList');
        return _productList;
      }
    } else {
      print('nowhere');
      return [];
    }
  }

  //List<ProductRecordModel?>? get productList => _productList;
}
