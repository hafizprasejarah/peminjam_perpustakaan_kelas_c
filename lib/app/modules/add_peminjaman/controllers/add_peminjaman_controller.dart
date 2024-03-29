import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart' as dio;
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/ api_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tglpinjamController = TextEditingController();
  final TextEditingController tglkembaliController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: ({
              "tanggal_pinjam": tglpinjamController.text.toString(),
              "tanggal_kembali": tglkembaliController.text.toString(),
              "user_id":int.parse(StorageProvider.read(StorageKey.idUser)),
              "book_id":int.parse(Get.parameters['id'].toString())
            }));

        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Berhasil meminjam", backgroundColor: Colors.orange);
        } else {
          Get.snackbar("Sorry", "Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null)
          Get.snackbar("sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
      } else {
        Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
