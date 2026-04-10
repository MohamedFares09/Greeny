import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:fruits_app/core/repos/product_repo_impl.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firebase_auth_services.dart';
import 'package:fruits_app/core/services/firestore_services.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_app/features/auth/doman/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(
    FirebaseAuthServices(),
  );
   getIt.registerSingleton<DataBaseServices>(
    FireStoreServices(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      dataBaseServices: getIt<DataBaseServices>(),
    ),
  );
   getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
    getIt<DataBaseServices>(),
    ),
  );
  getIt.registerSingleton<SignupCubit>(
    SignupCubit(
      getIt<AuthRepo>(),
    ),
  );
}
