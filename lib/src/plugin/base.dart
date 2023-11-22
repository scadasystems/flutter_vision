import 'package:flutter/services.dart';

abstract class BaseFlutterVision {
  // ignore: constant_identifier_names
  static const String TESS_DATA_PATH = 'assets/tessdata';
  static const MethodChannel _channel = MethodChannel('flutter_vision');
  MethodChannel get channel => _channel;

  Future<void> loadYoloModel({
    required String modelPath,
    required String labels,
    required String modelVersion,
    bool? quantization,
    int? numThreads,
    bool? useGpu,
  });

  Future<List<Map<String, dynamic>>> yoloOnFrame({
    required List<Uint8List> bytesList,
    required int imageHeight,
    required int imageWidth,
    double? iouThreshold,
    double? confThreshold,
    double? classThreshold,
  });

  Future<List<Map<String, dynamic>>> yoloOnImage({
    required Uint8List bytesList,
    required int imageHeight,
    required int imageWidth,
    double? iouThreshold,
    double? confThreshold,
    double? classThreshold,
  });

  Future<void> closeYoloModel() async {
    await channel.invokeMethod('closeYoloModel');
  }
}
