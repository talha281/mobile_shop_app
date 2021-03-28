import 'package:get_it/get_it.dart';
import 'package:mobile_shop_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:mobile_shop_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/cutomer_record_repository.dart';
import 'package:mobile_shop_app/data/repositories/customer_record/i_customer_record.dart';
import 'package:mobile_shop_app/data/repositories/product_record/i_product_record.dart';
import 'package:mobile_shop_app/data/repositories/product_record/product_records_repository.dart';
import 'package:mobile_shop_app/data/repositories/user/i_user_repository.dart';
import 'package:mobile_shop_app/data/repositories/user/user_repository.dart';

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
  sl.registerLazySingleton<IUserRepository>(() => UserRepository());
}

void _injectBloc() {
  sl.registerFactory(() => DashboardBloc(sl(), sl()));
  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
}
