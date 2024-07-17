import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';

class FileSelectorList extends StatefulWidget {
  const FileSelectorList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FileSelectorListState createState() => _FileSelectorListState();
}

class _FileSelectorListState extends State<FileSelectorList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileSelectionCubit, FileSelectionState>(
      builder: (context, state) {

        final pathImagesFolder = context.watch<FileSelectionCubit>().state.imagesPathFolder;

        return Text(pathImagesFolder);
      },
    );
  }
}
