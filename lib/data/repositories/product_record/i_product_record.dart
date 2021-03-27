import 'package:mobile_shop_app/data/models/product_model.dart';
import 'package:mobile_shop_app/data/models/product_record_model.dart';

abstract class IProductRecordRepository {
  Future<List<String?>> companyList();
  Future<List<String?>> modelList(String companyName);
  Future<List<ProductRecordModel?>> getproductList();
  Future<List<String?>> ramList(
    String companyName,
    String modelName,
  );
  List<String?>? searchByCategory();
  Future<List<ProductRecordModel?>> getStocksList(
      {String? searchby, String? searchElement});
  Future<List<String?>> internalList(
    String companyName,
    String modelName,
    String ram,
  );
  void addProduct(ProductModel? product, int quantity);
  Future<int> generatedProductId();
  Future<int> generatedCustomerId();
  void removeItem(ProductModel? product);
  void removeProductItem(ProductModel? product);
}
