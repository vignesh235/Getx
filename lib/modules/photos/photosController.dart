import 'package:get/get.dart';
import 'package:todo/api_helper/api_helper.dart';
import 'package:todo/modules/photos/photomodel.dart';

class PhotosController extends GetxController {
  List<Photo> photos = [];
  bool isLoading = false;
  Future<void> getPhotos(String search) async {
    try {
      final apiHelper = ApiHelper();
      isLoading = true;
      update();
      final response = await apiHelper.fetchImages(search);
      PhotoResponse photoResponse = PhotoResponse.fromJson(response!.data);
      photos.addAll(photoResponse.photos!);
      isLoading = false;
      update();
    } catch (e) {}
  }
}
