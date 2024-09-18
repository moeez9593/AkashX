// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/blocs/language/language_bloc.dart' as _i699;
import '../features/auth/data/datasource/auth_datasource.dart' as _i741;
import '../features/auth/data/network/auth_client.dart' as _i255;
import '../features/auth/presentation/login/presentation/login_bloc.dart'
    as _i355;
import '../features/splash/presentation/bloc/splash_bloc.dart' as _i358;
import 'app_module.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i699.LanguageBloc>(() => _i699.LanguageBloc());
  gh.factory<_i358.SplashBloc>(() => _i358.SplashBloc());
  gh.factory<String>(
    () => appModule.baseUrlAuth,
    instanceName: 'baseUrlAuth',
  );
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.lazySingleton<_i361.Dio>(
      () => appModule.dio(gh<String>(instanceName: 'baseUrl')));
  gh.lazySingleton<_i361.Dio>(
    () => appModule.dioAuth(gh<String>(instanceName: 'baseUrlAuth')),
    instanceName: 'auth',
  );
  gh.factory<_i255.AuthClient>(() => _i255.AuthClient(
        gh<_i361.Dio>(instanceName: 'auth'),
        baseUrl: gh<String>(instanceName: 'baseUrlAuth'),
      ));
  gh.factory<_i741.AuthDataSource>(
      () => _i741.AuthDataSource(gh<_i255.AuthClient>()));
  gh.factory<_i355.LoginBloc>(
      () => _i355.LoginBloc(gh<_i741.AuthDataSource>()));
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
