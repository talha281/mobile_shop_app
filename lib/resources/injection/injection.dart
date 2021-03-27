import 'package:get_it/get_it.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/cutomer_record_repository.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/i_customer_record.dart';
import 'package:mobile_shop_app/data/repositories/product_record/i_product_record.dart';
import 'package:mobile_shop_app/data/repositories/product_record/product_records_repository.dart';

final GetIt sl = GetIt.instance;
injectD() {
  _injectRepository();
  _injectBloc();
}

void _injectRepository() {
  sl.registerLazySingleton<IProductRecordRepository>(
      () => ProductRecordRepository());
  sl.registerLazySingleton<ICustomerRecordRepository>(
      () => CustomerRecordRepository());
}

void _injectBloc() {
  sl.registerFactory(() => DashboardBloc(sl(),sl()));
}
