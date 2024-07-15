import 'package:equatable/equatable.dart';
import 'package:nastid/config/utils/models.dart';

class FileSelectionState extends Equatable {
  final List<ImageFileModel> files;
  final ImageFileModel? selectedFile;

  FileSelectionState({required this.files, this.selectedFile});

  @override
  List<Object?> get props => [files, selectedFile];
}
