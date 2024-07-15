import 'package:equatable/equatable.dart';
import 'package:nastid/config/utils/models.dart';

class FileSelectionState extends Equatable {
  final String folderPath;
  final List<ImageFileModel> files;
  final ImageFileModel? selectedFile;

  FileSelectionState({required this.folderPath, required this.files, this.selectedFile});

  @override
  List<Object?> get props => [folderPath, files, selectedFile];
}
