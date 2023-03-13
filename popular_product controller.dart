import 'package:elaajapp/data/repository/popular_doctors_repo.dart';
import 'package:elaajapp/models/doctors_model.dart';
import 'package:get/get.dart';

class PopularDoctorController extends GetxController {
  final PopularDoctorRepo popularDoctorRepo;
  PopularDoctorController({required this.popularDoctorRepo});
  List<dynamic> _popularDoctorList = [];
  List<dynamic> get popularDoctorList => _popularDoctorList;

  Future<void> getDoctorList() async {
    Response response = await popularDoctorRepo.getPopularDoctorList();
    if (response.statusCode == 200) {
      _popularDoctorList = [];
      _popularDoctorList.addAll(Doctors.fromJson(response.body));
      update();
    } else {}
