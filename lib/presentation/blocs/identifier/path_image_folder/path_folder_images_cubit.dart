import 'package:bloc/bloc.dart';

class PathImagesFolderCubit extends Cubit<String> {
  PathImagesFolderCubit(): super('No-Images-Path');

  void setPathFolder(pathFolder) {
    emit(pathFolder);
  }
}