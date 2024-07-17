import 'package:bloc/bloc.dart';
import './file_selection_state.dart';
import 'dart:io';
import 'package:nastid/config/utils/models.dart';

class FileSelectionCubit extends Cubit<FileSelectionState> {
  FileSelectionCubit() : super(const FileSelectionState(imagesPathFolder: 'No-Images-Path', files: []));

  void setFolderPath(String path) {
    final directory = Directory(path);
    final files = directory
        .listSync()
        .whereType<File>()
        .map((file) => ImageFileModel(name: file.uri.pathSegments.last, path: file.path))
        .toList();
    emit(FileSelectionState(imagesPathFolder: path, files: files));
  }

  void selectFile(ImageFileModel file) {
    emit(FileSelectionState(imagesPathFolder: state.imagesPathFolder ,files: state.files, selectedFile: file));
  }
}