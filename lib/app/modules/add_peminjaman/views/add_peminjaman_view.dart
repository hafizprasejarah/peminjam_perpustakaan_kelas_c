import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body:Form(
          key: controller.formkey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.tglpinjamController,
                decoration: InputDecoration(
                  hintText: 'Tanggal Pinjam',
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return 'Masukan tanggal peminjaman';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tglkembaliController,
                decoration: InputDecoration(
                  hintText: 'Tanggal Pengembaliam',
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return 'Masukan tanggal pengembalian';
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.pinjam();
                  },
                  child: Text('Pinjam')))
            ],
          )),
    );
  }
}
