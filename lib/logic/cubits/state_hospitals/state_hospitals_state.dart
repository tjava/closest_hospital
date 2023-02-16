// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'state_hospitals_cubit.dart';

class StateHospitalsState extends Equatable {
  final List<HospitalModel> hospitals;
  final bool isLoading;
  const StateHospitalsState({
    required this.hospitals,
    this.isLoading = false,
  });

  factory StateHospitalsState.initial() {
    return const StateHospitalsState(hospitals: []);
  }

  @override
  List<Object> get props => [hospitals, isLoading];

  @override
  bool get stringify => true;

  StateHospitalsState copyWith({
    List<HospitalModel>? hospitals,
    bool? isLoading,
  }) {
    return StateHospitalsState(
      hospitals: hospitals ?? this.hospitals,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
