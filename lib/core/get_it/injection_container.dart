import 'package:get_it/get_it.dart';
import 'package:the_basics/logic/bloc/auth_bloc.dart';
import 'package:the_basics/logic/data/datasources/auth_datasource.dart';
import 'package:the_basics/logic/data/repositories/auth_repository.dart';

var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
}
