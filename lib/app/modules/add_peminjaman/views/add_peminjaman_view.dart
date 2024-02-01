import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
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
              DateTimePicker(
                icon: Icon(Icons.date_range_rounded),
                controller: controller.tglpinjamController,
                dateMask: 'd MMM, yyyy',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Tanggal Peminjaman',
                onChanged: (val) => print(val),
                validator: (value) {
                  if (value!.length < 2) {
                    return 'Masukan Tanggal pengembalian';
                  }
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20,),
              DateTimePicker(
                icon: Icon(Icons.date_range_rounded),
                controller: controller.tglkembaliController,
                dateMask: 'd MMM, yyyy',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Tanggal Pengembalian',
                onChanged: (val) => print(val),
                validator: (value) {
                  if (value!.length < 2) {
                    return 'Masukan Tanggal pengembalian';
                  }
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20,),
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
