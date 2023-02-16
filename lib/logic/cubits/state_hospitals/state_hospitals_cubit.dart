import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:closest_hospital/data/models/hospital_model.dart';
import 'package:closest_hospital/logic/cubits/state_search/state_search_cubit.dart';

part 'state_hospitals_state.dart';

class StateHospitalsCubit extends Cubit<StateHospitalsState> {
  late StreamSubscription stateSearchSubscription;
  final StateSearchCubit stateSearchCubit;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  StateHospitalsCubit({
    required this.stateSearchCubit,
  }) : super(StateHospitalsState.initial()) {
    stateSearchSubscription =
        stateSearchCubit.stream.listen((StateSearchState stateSearchState) {
      getHospitals();
    });
  }

  void getHospitals() async {
    emit(state.copyWith(isLoading: true));
    final String newSearchTerm =
        stateSearchCubit.state.searchTerm.toLowerCase().replaceAll(" ", "_");
    final snapshot = await firebaseFirestore
        .collection("hospitals")
        .where(
          "Lga",
          isGreaterThanOrEqualTo: newSearchTerm,
          isLessThan: newSearchTerm.substring(0, newSearchTerm.length - 1) +
              String.fromCharCode(
                  newSearchTerm.codeUnitAt(newSearchTerm.length - 1) + 1),
        )
        .get();

    final List<HospitalModel> hospitals =
        hospitalModelFromSnapshot(snapshot.docs);

    emit(state.copyWith(hospitals: hospitals));
    emit(state.copyWith(isLoading: false));
    print(hospitals.length);
  }

  @override
  Future<void> close() {
    stateSearchSubscription.cancel();
    return super.close();
  }
}
