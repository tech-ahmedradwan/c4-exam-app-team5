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
  List<ExploreSubjectEntity> subjectList = [];
  List<ExploreSubjectEntity> searchedList = [];
  final FetchExploreSubjectsUseCase _fetchExploreSubjectsUseCase;
  doIntent(ExploreSubjectsEvent event) {
    switch (event) {
      case FetchExploreSubjects():
        _fetchExploreSubjects();
      case SearchInSubjects():
        _searchnSubjects(event.value);
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
      onSuccess: (success) {
        subjectList = success;
        emit(
          state.copyWith(
            expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
              data: success,
            ),
          ),
        );
      },
      onError: (error) => emit(
        state.copyWith(
          expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
            errorMessage: error.message,
          ),
        ),
      ),
    );
  }

  _searchnSubjects(String value) {
    searchedList = [];
    emit(
      state.copyWith(
        expolreSubjectsState: const BaseState<List<ExploreSubjectEntity>>(
          isLoading: true,
        ),
      ),
    );
    for (final subject in subjectList) {
      if (subject.name!.trim().toLowerCase().startsWith(
        value.trim().toLowerCase(),
      )) {
        searchedList.add(subject);
      }
    }
    emit(
      state.copyWith(
        expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
          data: searchedList.isEmpty ? null : searchedList,
        ),
      ),
    );
  }
}
