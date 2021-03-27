part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class AddPhoneDetailsEvent extends DashboardEvent {
  final ProductModel? productModel;
  final int? quantity;

  AddPhoneDetailsEvent({this.productModel, this.quantity});
  @override
  List<Object> get props => [productModel!, quantity!];
}

class ChangeCompanyName extends DashboardEvent {
  final String? companyValue;
  ChangeCompanyName(this.companyValue);
  @override
  List<Object> get props => [companyValue!];
}

class ChangeModelName extends DashboardEvent {
  final String? modelValue;
  final String? companyValue;
  ChangeModelName(this.modelValue, this.companyValue);
  @override
  List<Object> get props => [modelValue!, companyValue!];
}

class ChangeRam extends DashboardEvent {
  final String? ramValue;
  final String? modelValue;
  final String? companyValue;
  ChangeRam(
    this.ramValue,
    this.modelValue,
    this.companyValue,
  );
  @override
  List<Object> get props => [modelValue!, companyValue!, ramValue!];
}

class ChangeInternal extends DashboardEvent {
  final String? internalValue;
  final String? modelValue;
  final String? companyValue;
  final String? ramValue;

  ChangeInternal(
    this.internalValue,
    this.modelValue,
    this.companyValue,
    this.ramValue,
  );
  @override
  List<Object> get props => [
        modelValue!,
        companyValue!,
        ramValue!,
        internalValue!,
      ];
}

class AddCustomerDetails extends DashboardEvent {
  final ProductModel? productModel;
  final CustomerModel? customerModel;
  AddCustomerDetails({this.productModel, this.customerModel});
  @override
  List<Object> get props => [productModel!, customerModel!];
}

class CheckingStocks extends DashboardEvent {
  final String? searchBy;
  final String? categoryValue;
  final String? searchElement;

  CheckingStocks({this.searchBy, this.searchElement, this.categoryValue});
  @override
  List<Object> get props => [searchBy!, categoryValue!, searchElement!];
}

class CheckingCustomerRecord extends DashboardEvent {
  final String? searchBy;
  final String? categoryValue;
  final String? searchElement;

  CheckingCustomerRecord(
      {this.searchBy, this.categoryValue, this.searchElement});
  @override
  List<Object> get props => [searchBy!, categoryValue!, searchElement!];
}

class CheckingPhoneRecord extends DashboardEvent {
  final String? searchBy;
  final String? categoryValue;
  final String? searchElement;

  CheckingPhoneRecord({this.searchBy, this.categoryValue, this.searchElement});
  @override
  List<Object> get props => [searchBy!, categoryValue!, searchElement!];
}

class DeleteProduct extends DashboardEvent {
  final ProductModel? product;
  DeleteProduct({this.product});
   @override
  List<Object> get props => [product!];
}

class AddPhoneEvent extends DashboardEvent {}

class AddCustomerEvent extends DashboardEvent {}

class CheckStocksEvent extends DashboardEvent {}

class CheckCustomerRecords extends DashboardEvent {}

class DeletePhoneRecords extends DashboardEvent {}
