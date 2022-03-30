import 'package:flutter/material.dart';
import '../bloc/gallery_cubit.dart';
import '../screens/gallery_main_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider <GalleryCubit>(
      create: (context) => GalleryCubit()..getPhotos(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.black54
        ),
        home: const GalleryAppMainPage(),
      ),
    );
  }
}
