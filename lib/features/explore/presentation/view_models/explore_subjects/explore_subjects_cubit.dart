import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    // Check 1: Good, you have this
    if (isClosed) return;

    emit(
      state.copyWith(
        expolreSubjectsState: state.expolreSubjectsState.copyWith(
          isLoading: true,
        ),
      ),
    );

    final result = await _fetchExploreSubjectsUseCase();

    // Check 2: MUST check again after the await
    if (isClosed) return;

    result.when(
      onSuccess: (success) {
        subjectList = success;

        // Check 3: Also need to check here
        if (!isClosed) {
          emit(
            state.copyWith(
              expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
                data: success,
              ),
            ),
          );
        }
      },
      onError: (error) {
        // Check 4: And also here
        if (!isClosed) {
          emit(
            state.copyWith(
              expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
                errorMessage: error.message,
              ),
            ),
          );
        }
      },
    );
  }

  _searchnSubjects(String value) {
    // Check 5: MUST check here
    if (isClosed) return;

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

    // Check 6: And MUST check here
    if (isClosed) return;

    emit(
      state.copyWith(
        expolreSubjectsState: BaseState<List<ExploreSubjectEntity>>(
          data: searchedList.isEmpty ? null : searchedList,
        ),
      ),
    );
  }
}
