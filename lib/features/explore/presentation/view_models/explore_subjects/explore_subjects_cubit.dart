import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/explore_subject_entity.dart';
import '../../../domain/use_cases/fetch_explore_subjects_use_case.dart';
import 'explore_subjects_event.dart';
part 'explore_subjects_state.dart';

@injectable
class ExploreSubjectsCubit extends Cubit<ExploreSubjectsState> {
  ExploreSubjectsCubit(this._fetchExploreSubjectsUseCase)
    : super(const ExploreSubjectsState());
  final FetchExploreSubjectsUseCase _fetchExploreSubjectsUseCase;
  doIntent(ExploreSubjectsEvent event) {
    switch (event) {
      case FetchExploreSubjects():
        _fetchExploreSubjects();
    }
  }

  _fetchExploreSubjects() async {
    emit(
      state.copyWith(
        expolreSubjectsState: state.expolreSubjectsState.copyWith(
          isLoading: true,
        ),
      ),
    );
    final result = await _fetchExploreSubjectsUseCase();
    result.when(
      onSuccess: (success) => emit(
        state.copyWith(
          expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
            data: success,
          ),
        ),
      ),
      onError: (error) => emit(
        state.copyWith(
          expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
            errorMessage: error.message,
          ),
        ),
      ),
    );
  }
}
