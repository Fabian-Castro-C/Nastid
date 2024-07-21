import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nastid/config/utils/models.dart';
import '../../blocs/blocs.dart';

class FileSelectorList extends StatefulWidget {
  const FileSelectorList({super.key});

  @override
  _FileSelectorListState createState() => _FileSelectorListState();
}

class _FileSelectorListState extends State<FileSelectorList> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileSelectionCubit, FileSelectionState>(
      builder: (context, state) {
        final List<ImageFileModel> imageFiles =
            context.watch<FileSelectionCubit>().state.files;
        
        imageFiles.sort((a, b) => a.name.compareTo(b.name));

        return Container(
          height: MediaQuery.of(context).size.height/1.5, // Define la altura del cuadrado
          width: MediaQuery.of(context).size.width/4, // Define la anchura del cuadrado
          child: ListView.builder(
            itemCount: imageFiles.length,
            itemBuilder: (context, index) {
              final file = imageFiles[index];
              return ListTile(
                title: InkWell(
                  hoverColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    context.read<FileSelectionCubit>().selectFile(file);
                    print(context.read<FileSelectionCubit>().state.selectedFile);
                  },
                  child: Container(
                    color: _selectedIndex == index ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                    child: Text(file.name)),
                  ),
              );
            },
          ),
        );
      },
    );
  }
}
