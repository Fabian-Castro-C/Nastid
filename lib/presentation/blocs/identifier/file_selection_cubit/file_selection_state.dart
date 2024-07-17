import 'package:equatable/equatable.dart';
import 'package:nastid/config/utils/models.dart';

class FileSelectionState extends Equatable {
  final String imagesPathFolder; 
  final List<ImageFileModel> files;
  final ImageFileModel? selectedFile;

  const FileSelectionState({required this.imagesPathFolder, required this.files, this.selectedFile});

  @override
  List<Object?> get props => [files, selectedFile];
}
