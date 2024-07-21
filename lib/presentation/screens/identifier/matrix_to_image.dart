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
    context.read<MatrixCubit>().loadMatrix();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixCubit, MatrixState>(
      builder: (context, state) {
        if (state is MatrixLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MatrixLoaded) {
          return CustomPaint(
            size: const Size.square(200),
            painter: MatrixPainter(state.matrix),
          );
        } else if (state is MatrixError) {
          return Center(child: Text('Failed to load matrix: ${state.message}'));
        } else {
          return const Center(child: Text('Press button to load matrix'));
        }
      },
    );
  }
}

class MatrixPainter extends CustomPainter {
  final List<List<double>> matrix;

  MatrixPainter(this.matrix);

  @override
  void paint(Canvas canvas, Size size) {
    double cellSize = size.width / matrix.length;
    Paint paint = Paint();

    for (int y = 0; y < matrix.length; y++) {
      for (int x = 0; x < matrix[y].length; x++) {
        double value = matrix[y][x];
        // Normaliza el valor a un rango de 0 a 255 para el color en escala de grises
        int colorValue = (value * 255).toInt();
        paint.color = Color.fromARGB(255, colorValue, colorValue, colorValue);
        canvas.drawRect(
          Rect.fromLTWH(x * cellSize, y * cellSize, cellSize, cellSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}