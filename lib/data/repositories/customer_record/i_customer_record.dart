import 'package:mobile_shop_app/data/models/customer_model.dart';

abstract class ICustomerRecordRepository {
  void addProduct(CustomerModel? customer);
  List<String?>? searchByCategory();
  Future<List<CustomerModel?>> getCustomersList();
  Future<List<CustomerModel?>> getCustomerList(
      {String? searchby, String? searchElement});
}
