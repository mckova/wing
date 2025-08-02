import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class OcrService {
  final textRecognizer = TextRecognizer();

  Future<String> processImage(File image) async {
    final inputImage = InputImage.fromFile(image);
    final result = await textRecognizer.processImage(inputImage);
    return result.text;
  }
}
