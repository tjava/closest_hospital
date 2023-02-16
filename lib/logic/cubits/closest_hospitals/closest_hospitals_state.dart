part of 'closest_hospitals_cubit.dart';

class ClosestHospitalsState extends Equatable {
  final List<HospitalModel> hospitals;
  final bool isLoading;
  const ClosestHospitalsState({
    required this.hospitals,
    this.isLoading = false,
  });

  factory ClosestHospitalsState.initial() {
    return const ClosestHospitalsState(hospitals: []);
  }

  @override
  List<Object> get props => [hospitals, isLoading];

  @override
  bool get stringify => true;

  ClosestHospitalsState copyWith({
    List<HospitalModel>? hospitals,
    bool? isLoading,
  }) {
    return ClosestHospitalsState(
      hospitals: hospitals ?? this.hospitals,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
