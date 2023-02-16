import 'package:bloc/bloc.dart';
import 'package:closest_hospital/data/models/hospital_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'specialist_hospitals_state.dart';

class SpecialistHospitalsCubit extends Cubit<SpecialistHospitalsState> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  SpecialistHospitalsCubit() : super(SpecialistHospitalsState.initial());

  void getHospitals({int? index}) async {
    emit(state.copyWith(isLoading: true));

    String newSearchTerm = "";

    switch (index) {
      case 0:
        newSearchTerm = "General Hospital";
        break;
      case 1:
        newSearchTerm = "Basic Health Centre";
        break;
      case 2:
        newSearchTerm = "Health Post";
        break;
      case 3:
        newSearchTerm = "Specialist Hospital";
        break;
      case 4:
        newSearchTerm = "Dispensary";
        break;
      case 5:
        newSearchTerm = "Primary Health Centre (PHC)";
        break;
      default:
        newSearchTerm = "";
    }

    final snapshot = await firebaseFirestore
        .collection("hospitals")
        .where(
          "Facility_t",
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
}
