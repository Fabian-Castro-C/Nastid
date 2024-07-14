import 'package:bloc/bloc.dart';

class PathFolderImagesCubit extends Cubit<String> {
  PathFolderImagesCubit(): super('No-Images-Path');

  void setPathFolder(pathFolder) {
    emit(pathFolder);
  }
}