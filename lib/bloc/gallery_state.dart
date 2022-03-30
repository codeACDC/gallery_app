part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState extends Equatable{
  const GalleryState();

  @override
  List <Object> get props => [];
}

class GalleryInitial extends GalleryState{
  const GalleryInitial();
}

class GalleryLoading extends GalleryState{
  const GalleryLoading();
}

class GalleryLoaded extends GalleryState{
  final List <String>  imageList;

  const GalleryLoaded({required this.imageList});

  @override
  List <Object> get props => [imageList];

}

class GalleryError extends GalleryState{
  final String message;

  const GalleryError({required this.message});

  @override
  List <Object> get props => [message];
}