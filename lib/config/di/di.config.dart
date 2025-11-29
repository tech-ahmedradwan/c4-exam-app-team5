// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/services/local/app_storage/app_storage.dart' as _i735;
import '../../core/services/local/app_storage/app_storage_impl.dart' as _i696;
import '../../features/exam/api/api_client/exam_api_client.dart' as _i682;
import '../../features/exam/api/data_source/remote/exam_remote_data_source_impl.dart'
    as _i195;
import '../../features/exam/data/data_sources/remote/exam_remote_data_source_contract.dart'
    as _i667;
import '../../features/exam/data/repo/exam_repo_impl.dart' as _i790;
import '../../features/exam/domain/repo/exam_repo_contract.dart' as _i651;
import '../../features/exam/domain/use_cases/fetch_exam_questions_use_case.dart'
    as _i267;
import '../../features/exam/presentation/view_models/exam_questions/exam_questions_cubit.dart'
    as _i666;
import '../../features/explore/api/api_client/explore_api_client.dart'
    as _i1020;
import '../../features/explore/api/data_source/remote/explore_subjects_remote_data_source_impl.dart'
    as _i609;
import '../../features/explore/data/data_sources/remote/explore_subjects_remote_data_source_contract.dart'
    as _i977;
import '../../features/explore/data/repos/explore_subjects_repos_impl.dart'
    as _i358;
import '../../features/explore/domain/repos/expolre_subjects_repos_contract.dart'
    as _i186;
import '../../features/explore/domain/use_cases/fetch_explore_subjects_use_case.dart'
    as _i462;
import '../../features/explore/presentation/view_models/explore_subjects/explore_subjects_cubit.dart'
    as _i1051;
import '../../features/forget_password/api/api_client/forget_password_api_client.dart'
    as _i892;
import '../../features/forget_password/api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i973;
import '../../features/forget_password/data/data_sources/remote/remote_data_source_cont.dart'
    as _i161;
import '../../features/forget_password/data/repos/forget_password_repo_impl.dart'
    as _i216;
import '../../features/forget_password/domain/repos/forget_password_repo_contract.dart'
    as _i377;
import '../../features/forget_password/domain/ucecases/forget_password_usecase.dart'
    as _i982;
import '../../features/forget_password/domain/ucecases/reset_password_usecase.dart'
    as _i939;
import '../../features/forget_password/domain/ucecases/verify_reset_otp_usecase.dart'
    as _i492;
import '../../features/forget_password/presentation/view_models/forget_password/forget_password_cubit.dart'
    as _i201;
import '../../features/forget_password/presentation/view_models/reset_password/reset_password_cubit.dart'
    as _i107;
import '../../features/forget_password/presentation/view_models/verify_reset_code/verify_rest_code_cubit.dart'
    as _i433;
import '../../features/login/api/api_client/login_api_client.dart' as _i395;
import '../../features/login/api/data_sources/local/login_local_datasource_impl.dart'
    as _i182;
import '../../features/login/api/data_sources/remote/login_remote_datasource_impl.dart'
    as _i710;
import '../../features/login/api/storage_client/login_local_store_client.dart'
    as _i978;
import '../../features/login/data/data_sources/local/login_local_data_source_contract.dart'
    as _i59;
import '../../features/login/data/data_sources/remote/login_remote_data_source_contract.dart'
    as _i328;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../../features/login/domain/repos/login_repo_contract.dart' as _i909;
import '../../features/login/domain/usecases/login_use_case.dart' as _i1005;
import '../../features/login/presentation/view_models/cubit/login_cubit.dart'
    as _i421;
import '../../features/signup/api/api_client/sign_up_api_client.dart' as _i786;
import '../../features/signup/api/data_sources/remote/sign_up_remote_datasource_impl.dart'
    as _i542;
import '../../features/signup/data/datasources/remote/sign_up_remote_data_source_contract.dart'
    as _i431;
import '../../features/signup/data/repositories/sign_up_repo_impl.dart' as _i17;
import '../../features/signup/domain/repositories/sign_up_repo_contract.dart'
    as _i553;
import '../../features/signup/domain/usecases/sign_up_use_case.dart' as _i594;
import '../../features/signup/presentation/view_models/sign_up_cubit.dart'
    as _i493;
import '../../features/subject_exams/api/api_client/subject_exam_api_client.dart'
    as _i250;
import '../../features/subject_exams/api/remote_datasource_impl/subject_exams_remote_datasource_impl.dart'
    as _i665;
import '../../features/subject_exams/data/datasources/remote/get_subject_exams_remote_datasource_contract.dart'
    as _i263;
import '../../features/subject_exams/data/repos/subject_exams_repo_impl.dart'
    as _i866;
import '../../features/subject_exams/domain/repos/subject_exam_repo_contract.dart'
    as _i415;
import '../../features/subject_exams/domain/usecases/get_subject_exam_usecase.dart'
    as _i383;
import '../../features/subject_exams/presentation/view_models/subject_exam_cubit/subject_exams_cubit.dart'
    as _i1000;
import '../modules/dio_module/dio_module.dart' as _i624;
import '../modules/storage_module/storage_module.dart' as _i409;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i682.ExamApiClient>(
      () => _i682.ExamApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1020.ExploreApiClient>(
      () => _i1020.ExploreApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i892.ForgetPasswordApiClient>(
      () => _i892.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i395.LoginApiClient>(
      () => _i395.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i786.SignUpApiClient>(
      () => _i786.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i250.SubjectExamApiClient>(
      () => _i250.SubjectExamApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i161.ForgetPasswordRemoteDataSourceContract>(
      () => _i973.ForgetPasswordRemoteDataSourceImpl(
        gh<_i892.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i263.SubjectExamsRemoteDatasourceContract>(
      () => _i665.SubjectExamsRemoteDatasourceImpl(
        gh<_i250.SubjectExamApiClient>(),
      ),
    );
    gh.factory<_i377.ForgetPasswordRepoContract>(
      () => _i216.ForgetPasswordRepoImpl(
        remoteDataSource: gh<_i161.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.lazySingleton<_i735.AppStorage>(
      () => _i696.AppStorageImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i415.SubjectExamRepoContract>(
      () => _i866.SubjectExamsRepoImpl(
        gh<_i263.SubjectExamsRemoteDatasourceContract>(),
      ),
    );
    gh.factory<_i328.LoginRemoteDataSourceContract>(
      () => _i710.LoginRemoteDatasourceImpl(
        loginApiClient: gh<_i395.LoginApiClient>(),
      ),
    );
    gh.factory<_i977.ExploreSubjectsRemoteDataSourceContract>(
      () => _i609.ExploreSubjectsRemoteDataSourceImpl(
        gh<_i1020.ExploreApiClient>(),
      ),
    );
    gh.factory<_i667.ExamRemoteDataSourceContract>(
      () => _i195.ExamRemoteDataSourceImpl(gh<_i682.ExamApiClient>()),
    );
    gh.factory<_i978.LoginLocalStoreClient>(
      () => _i978.LoginLocalStoreClient(gh<_i735.AppStorage>()),
    );
    gh.factory<_i431.SignUpRemoteDataSourceContract>(
      () => _i542.SignUpRemoteDatasourceImpl(
        signUpApiClient: gh<_i786.SignUpApiClient>(),
      ),
    );
    gh.factory<_i651.ExamRepoContract>(
      () => _i790.ExamRepoImpl(gh<_i667.ExamRemoteDataSourceContract>()),
    );
    gh.factory<_i553.SignUpRepoContract>(
      () => _i17.SignUpRepoImpl(
        remoteDataSource: gh<_i431.SignUpRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i186.ExploreSubjectsReposContract>(
      () => _i358.ExploreSubjectsReposImpl(
        gh<_i977.ExploreSubjectsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i59.LoginLocalDataSourceContract>(
      () => _i182.LoginLocalDatasourceImpl(gh<_i978.LoginLocalStoreClient>()),
    );
    gh.factory<_i383.GetSubjectExamUsecase>(
      () => _i383.GetSubjectExamUsecase(gh<_i415.SubjectExamRepoContract>()),
    );
    gh.factory<_i939.ResetPasswordUsecase>(
      () => _i939.ResetPasswordUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i982.ForgetPasswordUsecase>(
      () => _i982.ForgetPasswordUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i492.VerifyResetOtpUsecase>(
      () => _i492.VerifyResetOtpUsecase(gh<_i377.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i433.VerifyRestCodeCubit>(
      () => _i433.VerifyRestCodeCubit(gh<_i492.VerifyResetOtpUsecase>()),
    );
    gh.factory<_i1000.SubjectExamsCubit>(
      () => _i1000.SubjectExamsCubit(gh<_i383.GetSubjectExamUsecase>()),
    );
    gh.factory<_i107.ResetPasswordCubit>(
      () => _i107.ResetPasswordCubit(gh<_i939.ResetPasswordUsecase>()),
    );
    gh.factory<_i201.ForgetPasswordCubit>(
      () => _i201.ForgetPasswordCubit(gh<_i982.ForgetPasswordUsecase>()),
    );
    gh.factory<_i267.FetchExamQuestionsUseCase>(
      () => _i267.FetchExamQuestionsUseCase(gh<_i651.ExamRepoContract>()),
    );
    gh.factory<_i462.FetchExploreSubjectsUseCase>(
      () => _i462.FetchExploreSubjectsUseCase(
        gh<_i186.ExploreSubjectsReposContract>(),
      ),
    );
    gh.factory<_i909.LoginRepoContract>(
      () => _i937.LoginRepoImpl(
        remoteDataSource: gh<_i328.LoginRemoteDataSourceContract>(),
        localDataSource: gh<_i59.LoginLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i594.SignUpUseCase>(
      () => _i594.SignUpUseCase(signUpRepo: gh<_i553.SignUpRepoContract>()),
    );
    gh.factory<_i1051.ExploreSubjectsCubit>(
      () =>
          _i1051.ExploreSubjectsCubit(gh<_i462.FetchExploreSubjectsUseCase>()),
    );
    gh.factory<_i666.ExamQuestionsCubit>(
      () => _i666.ExamQuestionsCubit(gh<_i267.FetchExamQuestionsUseCase>()),
    );
    gh.factory<_i1005.LoginUseCase>(
      () => _i1005.LoginUseCase(loginRepo: gh<_i909.LoginRepoContract>()),
    );
    gh.factory<_i493.SignUpCubit>(
      () => _i493.SignUpCubit(gh<_i594.SignUpUseCase>()),
    );
    gh.factory<_i421.LoginCubit>(
      () => _i421.LoginCubit(gh<_i1005.LoginUseCase>()),
    );
    return this;
  }
}

class _$StorageModule extends _i409.StorageModule {}

class _$DioModule extends _i624.DioModule {}
