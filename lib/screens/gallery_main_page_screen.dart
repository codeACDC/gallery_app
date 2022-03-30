import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app_2/bloc/gallery_cubit.dart';

class GalleryAppMainPage extends StatelessWidget {
  const GalleryAppMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(builder: (context, state) {
      if (state is GalleryLoaded) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
                itemCount: state.imageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Image.network(
                    state.imageList[index],
                    fit: BoxFit.cover,
                  );
                }),
          )),
        );
      }
      if (state is GalleryLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Container();
    });
  }
}
