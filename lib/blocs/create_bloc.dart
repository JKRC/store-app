import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:store_app/models/product.dart';

enum CreateState { IDLE, LOADING, DONE }

class CreateBloc {
  final StreamController<CreateState> _stateController =
      StreamController<CreateState>();

  Stream<CreateState> get outState => _stateController.stream;
  StreamSink<CreateState> get sinkState => _stateController.sink;

  Future<bool> saveProduct(Product product) async {
    sinkState.add(CreateState.LOADING);
    product.urlImages = [];
    if (product.images.isNotEmpty) {
      product.urlImages = await uploadPhotos(product.images);
    }
    await FirebaseFirestore.instance
        .collection("products")
        .doc()
        .set(product.toJson());
    sinkState.add(CreateState.DONE);
    return true;
  }

  Future<List<String>> uploadPhotos(images) async {
    List<String> photosUrls = [];
    for (var image in images) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(image);
      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      photosUrls.add(url);
    }
    return photosUrls;
  }

  void dispose() {
    _stateController.close();
  }
}
