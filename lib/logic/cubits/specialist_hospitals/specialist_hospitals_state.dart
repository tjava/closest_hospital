part of 'specialist_hospitals_cubit.dart';

class SpecialistHospitalsState extends Equatable {
  final List<HospitalModel> hospitals;
  final bool isLoading;
  const SpecialistHospitalsState({
    required this.hospitals,
    this.isLoading = false,
  });

  factory SpecialistHospitalsState.initial() {
    return const SpecialistHospitalsState(hospitals: []);
  }

  @override
  List<Object> get props => [hospitals, isLoading];

  @override
  bool get stringify => true;

  SpecialistHospitalsState copyWith({
    List<HospitalModel>? hospitals,
    bool? isLoading,
  }) {
    return SpecialistHospitalsState(
      hospitals: hospitals ?? this.hospitals,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
