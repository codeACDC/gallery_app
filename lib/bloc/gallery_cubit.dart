import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import '../services/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_app_2/keys.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState>{
  GalleryCubit() : super(const GalleryInitial());

  Future <void> getPhotos() async{

    emit(const GalleryLoading());

    List <String> images = [];
    String url = 'https://pixabay.com/api/?key=$pixabayApiKey&image_type=photo';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();

    List <dynamic> hitList = data['hits'] as List;
    for (int i = 0; i<hitList.length; i++){
      images.add(hitList[i]['largeImageURL']);
    }

    emit(GalleryLoaded(imageList: images));
  }

}

