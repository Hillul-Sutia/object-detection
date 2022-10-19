import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'home.dart';

///Changed minSdkVersion to 21 in project_directory/android/app/build.gradle file
///Added assets folder placed the pretrained model and label files inside it
///then added assets in pubspec.yaml file and the contents of assets folder
///assets:
//     - assets/yolov2_tiny.tflite
//     - assets/yolov2_tiny.txt
//     - assets/ssd_mobilenet.tflite
//     - assets/ssd_mobilenet.txt
//     - assets/mobilenet_v1_1.0_224.tflite
//     - assets/mobilenet_v1_1.0_224.txt
//     - assets/posenet_mv1_075_float_from_checkpoints.tflite

List<CameraDescription>? cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tflite real-time detection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(cameras!),
    );
  }
}
