import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entity/explore_subject_entity.dart';
import '../../domain/repos/expolre_subjects_repos_contract.dart';
import '../data_sources/remote/explore_subjects_remote_data_source_contract.dart';

@Injectable(as: ExploreSubjectsReposContract)
class ExploreSubjectsReposImpl extends ExploreSubjectsReposContract {
  ExploreSubjectsReposImpl(this.remoteDataSource);

  final ExploreSubjectsRemoteDataSourceContract remoteDataSource;
  @override
  Future<BaseResponse<List<ExploreSubjectEntity>>>
  fetchExploreSubjects() async {
    try {
      final response = await remoteDataSource.fetchExploreSubjects();
      final subjectsEntity =
          response.subjects?.map((e) => e.toEntity()).toList() ?? [];

      return SuccessResponse(subjectsEntity);
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Server error occurred.'));
    } catch (e) {
      return const ErrorResponse(
        ServerFailure('An unexpected error occurred.'),
      );
    }
  }
}
