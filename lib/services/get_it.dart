import 'package:get_it/get_it.dart';

import '../blocs/export_blocs.dart';
import '../data/repositories/file_repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton(FileRepository());

  getIt.registerSingleton(
    FileBloc(
      fileRepository: getIt.get<FileRepository>(),
    ),
  );

  getIt.registerSingleton(UserBloc());
}
