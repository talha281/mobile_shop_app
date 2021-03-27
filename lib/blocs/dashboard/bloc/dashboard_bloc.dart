import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_shop_app/data/models/customer_model.dart';
import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/data/models/product_record_model.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/i_customer_record.dart';
import 'package:mobile_shop_app/data/repositories/product_record/i_product_record.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this.productRecordRepository, this.customerRecordRepository)
      : super(DashboardInitial());
  final IProductRecordRepository productRecordRepository;
  final ICustomerRecordRepository customerRecordRepository;

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is AddPhoneEvent) {
      yield Loading();
      yield AddPhoneState();
    } else if (event is AddPhoneDetailsEvent) {
      yield Loading();
      productRecordRepository.addProduct(event.productModel, event.quantity!);
      yield AddPhoneState();
    } else if (event is AddCustomerEvent) {
      yield Loading();
      print('Errorka Bap');
      List<String?> companyList = await productRecordRepository.companyList();
      print('Errorka Beta');
      yield Loading();
      yield AddCustomerState(
          companyList: companyList,
          modelList: [],
          ramList: [],
          internalStorageList: []);
    } else if (event is ChangeCompanyName) {
      yield Loading();
      List<String?> companyList = await productRecordRepository.companyList();
      List<String?> modelList =
          await productRecordRepository.modelList(event.companyValue!);
      yield AddCustomerState(
          companyValue: event.companyValue,
          companyList: companyList,
          modelList: modelList,
          ramList: [],
          internalStorageList: []);
    } else if (event is ChangeModelName) {
      yield Loading();
      List<String?> companyList = await productRecordRepository.companyList();
      List<String?> modelList =
          await productRecordRepository.modelList(event.companyValue!);
      List<String?> ramList = await productRecordRepository.ramList(
          event.companyValue!, event.modelValue!);
      yield AddCustomerState(
          modelValue: event.modelValue,
          companyList: companyList,
          companyValue: event.companyValue,
          modelList: modelList,
          ramList: ramList,
          internalStorageList: []);
    } else if (event is ChangeRam) {
      yield Loading();
      List<String?> companyList = await productRecordRepository.companyList();
      List<String?> modelList =
          await productRecordRepository.modelList(event.companyValue!);
      List<String?> ramList = await productRecordRepository.ramList(
          event.companyValue!, event.modelValue!);
      List<String?> internalStorageList =
          await productRecordRepository.internalList(
              event.companyValue!, event.modelValue!, event.ramValue!);
      yield AddCustomerState(
          modelValue: event.modelValue,
          companyList: companyList,
          companyValue: event.companyValue,
          modelList: modelList,
          ramValue: event.ramValue,
          ramList: ramList,
          internalStorageList: internalStorageList);
    } else if (event is ChangeInternal) {
      yield Loading();
      List<String?> companyList = await productRecordRepository.companyList();
      List<String?> modelList =
          await productRecordRepository.modelList(event.companyValue!);
      List<String?> ramList = await productRecordRepository.ramList(
          event.companyValue!, event.modelValue!);
      List<String?> internalStorageList =
          await productRecordRepository.internalList(
              event.companyValue!, event.modelValue!, event.ramValue!);
      yield AddCustomerState(
        modelValue: event.modelValue,
        companyList: companyList,
        companyValue: event.companyValue,
        modelList: modelList,
        ramValue: event.ramValue,
        ramList: ramList,
        internalValue: event.internalValue,
        internalStorageList: internalStorageList,
      );
//      
    } else if (event is AddCustomerDetails) {
      yield Loading();
      List<String?> companyList = await productRecordRepository.companyList();
      productRecordRepository.removeItem(event.productModel);
      customerRecordRepository.addProduct(event.customerModel);
      yield AddCustomerState(
          companyList: companyList,
          modelList: [],
          ramList: [],
          internalStorageList: []);
//
    } else if (event is CheckStocksEvent) {
      yield Loading();
      print('checking error');
      List<String?>? searchbyCategory =
          productRecordRepository.searchByCategory();
      List<ProductRecordModel?> stockList =
          await productRecordRepository.getStocksList();
      List<ProductRecordModel?> productlist =
          await productRecordRepository.getproductList();
      yield StocksState(
          productlist: productlist,
          stockList: stockList,
          searchbyCategory: searchbyCategory);
    } else if (event is CheckingStocks) {
      yield Loading();
      print('we are on checking stocks');
      print(event.searchBy);
      print(event.searchElement);
      List<String?>? searchbyCategory =
          productRecordRepository.searchByCategory();
      List<ProductRecordModel?> stockList =
          await productRecordRepository.getStocksList(
              searchby: event.searchBy, searchElement: event.searchElement);
      List<ProductRecordModel?> productlist =
          await productRecordRepository.getproductList();
      yield StocksState(
          productlist: productlist,
          stockList: stockList,
          searchbyCategory: searchbyCategory,
          categoryValue: event.categoryValue);
    } else if (event is CheckCustomerRecords) {
      yield Loading();
      List<CustomerModel?> customersList =
          await customerRecordRepository.getCustomersList();
      List<String?>? searchbyCategory =
          customerRecordRepository.searchByCategory();
      List<CustomerModel?> customerList =
          await customerRecordRepository.getCustomerList();
      yield CustomerRecordState(
          customersList: customersList,
          searchbyCategory: searchbyCategory,
          customerList: customerList);
    } else if (event is CheckingCustomerRecord) {
      yield Loading();
      print('we are on checking customer records');
      print(event.searchBy);
      print(event.searchElement);
      List<String?>? searchbyCategory =
          customerRecordRepository.searchByCategory();
      List<CustomerModel?> customerList =
          await customerRecordRepository.getCustomerList(
              searchby: event.searchBy, searchElement: event.searchElement);
      List<CustomerModel?> customersList =
          await customerRecordRepository.getCustomersList();
      yield CustomerRecordState(
          customersList: customersList,
          customerList: customerList,
          searchbyCategory: searchbyCategory,
          categoryValue: event.categoryValue);
//          
    } else if (event is CheckingPhoneRecord) {
      yield Loading();
      print('we are on checking stocks');
      print(event.categoryValue);
      print(event.searchBy);
      print(event.searchElement);
      List<String?>? searchbyCategory =
          productRecordRepository.searchByCategory();
      List<ProductRecordModel?> stockList =
          await productRecordRepository.getStocksList(
              searchby: event.searchBy, searchElement: event.searchElement);
      List<ProductRecordModel?> productlist =
          await productRecordRepository.getproductList();
      yield DeletePhoneState(
          productlist: productlist,
          stockList: stockList,
          searchbyCategory: searchbyCategory,
          categoryValue: event.categoryValue);
//         
    } else if (event is DeleteProduct) {
      yield Loading();
      productRecordRepository.removeProductItem(event.product);
      List<String?>? searchbyCategory =
          productRecordRepository.searchByCategory();
      List<ProductRecordModel?> stockList =
          await productRecordRepository.getStocksList();
      List<ProductRecordModel?> productlist =
          await productRecordRepository.getproductList();
      yield DeletePhoneState(
          productlist: productlist,
          stockList: stockList,
          searchbyCategory: searchbyCategory);
//
    } else if (event is DeletePhoneRecords) {
      yield Loading();
      List<String?>? searchbyCategory =
          productRecordRepository.searchByCategory();
      List<ProductRecordModel?> stockList =
          await productRecordRepository.getStocksList();
      List<ProductRecordModel?> productlist =
          await productRecordRepository.getproductList();
      yield DeletePhoneState(
          productlist: productlist,
          stockList: stockList,
          searchbyCategory: searchbyCategory);
    } else {
      DashboardInitial();
    }
  }
}
