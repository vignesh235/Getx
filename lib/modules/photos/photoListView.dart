import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/photos/photosController.dart';
import 'package:todo/modules/photos/photoview.dart';

class PhotoListView extends StatelessWidget {
  PhotoListView({super.key});
  final PhotosController photosController = Get.put(PhotosController());
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photos"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              TextFormField(
                controller: textEditingController,
              ),
              ElevatedButton(
                  onPressed: () {
                    photosController.photos.clear();
                    photosController.getPhotos(textEditingController.text);
                  },
                  child: Text("Search")),
              GetBuilder<PhotosController>(builder: (controller) {
                if (controller.photos.isEmpty) {
                  return const Center(
                      child: Text("No images,Try searching something"));
                }
                if (controller.photos.isNotEmpty && !controller.isLoading) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: controller.photos.length,
                      itemBuilder: (context, index) {
                        var data = controller.photos;

                        return GestureDetector(
                          onTap: () {
                            Get.to(() => Photoview(
                                  imageUrl: data[index].src!.original!,
                                ));
                          },
                          child: Image.network(
                            data[index].src!.original!,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return SizedBox();
              }),
            ],
          ),
        ));
  }
}
