part of 'state_search_cubit.dart';

class StateSearchState extends Equatable {
  final String searchTerm;
  const StateSearchState({
    required this.searchTerm,
  });

  factory StateSearchState.initial() {
    return const StateSearchState(searchTerm: "");
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;

  StateSearchState copyWith({
    String? searchTerm,
  }) {
    return StateSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
