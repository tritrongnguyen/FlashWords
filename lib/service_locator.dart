import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/auth/data/datasources/remote/firebase_auth_remote_datasource.dart';
import 'features/auth/data/datasources/remote/firebase_auth_remote_datasource_impl.dart';
import 'features/auth/data/repositories/firebase_auth_repository_impl.dart';
import 'features/auth/domain/repositories/firebase_auth_repository.dart';
import 'features/auth/domain/usecases/auth_usecases/sign_in_with_email_and_password_usecase.dart';
import 'features/auth/domain/usecases/auth_usecases/sign_in_with_google_usecase.dart';
import 'features/auth/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'features/auth/domain/usecases/auth_usecases/sign_up_with_email_and_password_usecase.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/topics_management/data/datasources/remote_datasources/topics_datasources.dart';
import 'features/topics_management/data/datasources/remote_datasources/topics_datasources_impl.dart';
import 'features/topics_management/data/repositories/topic_repository_impl.dart';
import 'features/topics_management/domain/repositories/topic_repository.dart';
import 'features/topics_management/domain/usecases/get_all_topics_usecase.dart';
import 'features/topics_management/presentation/bloc/topics_management_bloc.dart';
import 'features/user_management/data/datasources/remote/user_remote_datasource.dart';
import 'features/user_management/data/datasources/remote/user_remote_datasource_impl.dart';
import 'features/user_management/data/repositories/user_repository_impl.dart';
import 'features/user_management/domain/repositories/user_repository.dart';
import 'features/user_management/domain/usecases/get_single_user_by_uid_usecase.dart';
import 'features/user_management/presentation/bloc/user_management_bloc.dart';

final sl = GetIt.instance;

Future<void> setUp() async {
  // Register Blocs
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInWithEmailAndPasswordUseCase: sl.call(),
      signInWithGoogleUseCase: sl.call(),
      signOutUseCase: sl.call(),
      signUpWithEmailAndPasswordUseCase: sl.call(),
    ),
  );

  sl.registerFactory<UserManagementBloc>(
    () => UserManagementBloc(
      getSingleUserByUidUseCase: sl.call(),
    ),
  );

  sl.registerFactory<TopicsManagementBloc>(
    () => TopicsManagementBloc(
      getAllTopicsOfUserUseCase: sl.call(),
    ),
  );

  // Register Use cases

  sl.registerLazySingleton<SignUpWithEmailAndPasswordUseCase>(
    () => SignUpWithEmailAndPasswordUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
    () => SignInWithEmailAndPasswordUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetSingleUserByUidUseCase>(
    () => GetSingleUserByUidUseCase(
      userRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetAllTopicsOfUserUseCase>(
    () => GetAllTopicsOfUserUseCase(
      topicRepository: sl.call(),
    ),
  );

  // Register Repositories
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepositoryImpl(
      firebaseAuthRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<TopicRepository>(
    () => TopicRepositoryImpl(
      topicRemoteDataSources: sl.call(),
    ),
  );

  // Register Data sources
  sl.registerLazySingleton<FirebaseAuthRemoteDataSource>(
    () => FirebaseAuthRemoteDataSourceImpl(
      firebaseAuth: sl.call(),
      googleSignIn: sl.call(),
      userRemoteDataSource: sl.call(),
    ),
  );

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
    ),
  );

  sl.registerLazySingleton<TopicRemoteDataSources>(
    () => TopicRemoteDataSourcesImpl(
      firebaseFirestore: sl.call(),
    ),
  );

  // Register Externals

  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final firebaseFirestore = FirebaseFirestore.instance;

  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  sl.registerLazySingleton<GoogleSignIn>(() => googleSignIn);
  sl.registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
}
