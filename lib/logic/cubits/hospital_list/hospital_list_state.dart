part of 'hospital_list_cubit.dart';

class HospitalListState extends Equatable {
  final List<HospitalModel> hospitals;
  const HospitalListState({
    required this.hospitals,
  });

  factory HospitalListState.initial() {
    return const HospitalListState(hospitals: []);
  }

  @override
  List<Object> get props => [hospitals];

  @override
  bool get stringify => true;

  HospitalListState copyWith({
    List<HospitalModel>? hospitals,
  }) {
    return HospitalListState(
      hospitals: hospitals ?? this.hospitals,
    );
  }
}
