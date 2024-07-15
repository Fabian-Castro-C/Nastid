import 'package:equatable/equatable.dart';

class ImageFileModel extends Equatable {
  final String name;
  final String path;

  const ImageFileModel({required this.name, required this.path});

  @override
  List<Object?> get props => [name, path];
}
