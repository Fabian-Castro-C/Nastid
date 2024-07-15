import 'package:bloc/bloc.dart';
import './file_selection_state.dart';
import 'dart:io';
import 'package:nastid/config/utils/models.dart';

class FileSelectionCubit extends Cubit<FileSelectionState> {
  FileSelectionCubit() : super(FileSelectionState(files: []));

  void setFolderPath(String path) {
    final directory = Directory(path);
    final files = directory
        .listSync()
        .whereType<File>()
        .map((file) => ImageFileModel(name: file.uri.pathSegments.last, path: file.path))
        .toList();
    emit(FileSelectionState(files: files));
  }

  void selectFile(ImageFileModel file) {
    emit(FileSelectionState(files: state.files, selectedFile: file));
  }
}