import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index) {
          DataPinjam dataPinjam = state[index];
          return ListTile(
            title: Text("${dataPinjam.book?.judul}"),
            subtitle: Text(
                "Pinjam : ${dataPinjam.tanggalPinjam}\n Kembali : ${dataPinjam.tanggalKembali}"),
            leading: Icon(Icons.book,color: Colors.lightBlueAccent,),
            trailing: Text("${dataPinjam.status}"),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      )),
    );
  }
}
