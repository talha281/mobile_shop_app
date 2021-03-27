part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class Loading extends DashboardState {}

class AddPhoneState extends DashboardState {}

class AddCustomerState extends DashboardState {
  final List<String?>? companyList;
  final String? companyValue;
  final String? modelValue;
  final List<String?>? modelList;
  final String? ramValue;
  final String? internalValue;
  final List<String?>? ramList;
  final List<String?>? internalStorageList;

  AddCustomerState(
      {required this.companyList,
      this.companyValue,
      this.modelValue,
      this.modelList,
      this.ramValue,
      this.internalValue,
      this.ramList,
      this.internalStorageList});
  @override
  List<Object> get props => [
        companyList!,
        companyValue!,
        modelValue!,
        modelList!,
        ramValue!,
        internalValue!,
        ramList!,
        internalStorageList!
      ];
}

class StocksState extends DashboardState {
  final List<ProductRecordModel?> stockList;
  final List<ProductRecordModel?> productlist;
  final List<String?>? searchbyCategory;
  final String? categoryValue;

  StocksState(
      {required this.productlist,required this.stockList, this.searchbyCategory, this.categoryValue});
  @override
  List<Object> get props => [productlist, stockList, searchbyCategory!, categoryValue!];
}

class CustomerRecordState extends DashboardState {
  final List<CustomerModel?> customersList;
  final List<CustomerModel?> customerList;
  final List<String?>? searchbyCategory;
  final String? categoryValue;

  CustomerRecordState({required this.customersList,required this.customerList, this.searchbyCategory, this.categoryValue});
  @override
  List<Object> get props => [customerList, customerList, searchbyCategory!, categoryValue!];
}

class DeletePhoneState extends DashboardState {
 final List<ProductRecordModel?> stockList;
  final List<ProductRecordModel?> productlist;
  final List<String?>? searchbyCategory;
  final String? categoryValue;

  DeletePhoneState({required this.productlist,required this.stockList, this.searchbyCategory, this.categoryValue});
  @override
  List<Object> get props => [productlist, stockList, searchbyCategory!, categoryValue!];
}
