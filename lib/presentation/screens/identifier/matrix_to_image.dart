import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nastid/presentation/blocs/blocs.dart';

class MatrixImageWidget extends StatefulWidget {
  const MatrixImageWidget({super.key});

  @override
  _MatrixImageWidgetState createState() => _MatrixImageWidgetState();
}

class _MatrixImageWidgetState extends State<MatrixImageWidget> {
  @override
  void initState() {
    super.initState();
    // Load matrix data when the widget is initialized
    context.read<MatrixCubit>().loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixCubit, MatrixState>(

      builder: (context, state) {

        if (state is MatrixLoading) {
          return const Center(child: CircularProgressIndicator());
        } 

        else if (state is MatrixLoaded) {
          return Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1, // Ajusta este valor al de la relación de aspecto de tu imagen
                child: Image.memory(
                  state.imageBytes,
                  width: 2,
                  height: 2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } 
        
        else if (state is MatrixError) {
          return Center(child: Text('Failed to load matrix: ${state.message}'));
        } 
        
        else {
          return const Center(child: Text('Press button to load matrix'));
        }
      },
    );
  }
}