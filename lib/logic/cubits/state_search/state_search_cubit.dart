import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state_search_state.dart';

class StateSearchCubit extends Cubit<StateSearchState> {
  StateSearchCubit() : super(StateSearchState.initial());

  void setSearchTerm(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
  }
}
