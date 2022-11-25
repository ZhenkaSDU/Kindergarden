import 'package:get_it/get_it.dart';
import 'package:the_basics/home/logic/bloc/save_child_bloc.dart';
import 'package:the_basics/home/logic/data/repositories/save_repositories.dart';

import '../../home/logic/data/datasources/save_datasources.dart';

var sl = GetIt.instance;

void initGetIt() async {
   sl.registerFactory<SaveChildBloc>(() => SaveChildBloc(sl()));

  sl.registerLazySingleton<SaveRepository>(() => SaveRepositoryImpl(sl()));

  sl.registerLazySingleton<SaveDataSource>(() => SaveDataSourceImpl());

}
