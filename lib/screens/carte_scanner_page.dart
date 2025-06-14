import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:viewerx/screens/historique_page.dart';
import 'package:viewerx/screens/main_screen.dart';
import 'package:viewerx/screens/receipt_ticket_page.dart';
import 'package:viewerx/widgets/corner_shape_widget.dart';

class CarteScannerPage extends StatefulWidget {
  const CarteScannerPage({super.key});

  @override
  State<CarteScannerPage> createState() => _CarteScannerPageState();
}

class _CarteScannerPageState extends State<CarteScannerPage> {
  File? _pickedImage;
  String _result = '';
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      final file = File(picked.path);
      setState(() {
        _pickedImage = file;
        _isLoading = true;
        _result = '';
      });
      await _detectObjects(file);
    }
  }

  Future<void> _detectObjects(File file) async {
    final objectDetector = ObjectDetector(
      options: ObjectDetectorOptions(
        classifyObjects: true,
        multipleObjects: false,
        mode: DetectionMode.single,
      ),
    );

    final inputImage = InputImage.fromFile(file);
    final objects = await objectDetector.processImage(inputImage);

    setState(() {
      _isLoading = false;
      _result = objects.isEmpty
          ? 'Aucun objet détecté.'
          : 'Carte détectée (objet : ${objects.first.labels.isNotEmpty ? objects.first.labels.first.text : "inconnu"})';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFC42D),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFC42D),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFC42D),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context, rootNavigator: true)
                        .pushReplacement(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, sec) =>
                              MainScreen(),
                          transitionDuration: const Duration(milliseconds: 0),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 0)),
                    ),
                    // MaterialPageRoute(
                    //     builder: (_) = const MainScreen())
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.start,
                      'Scannez votre carte bancaire',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Scannez le recto de votre carte bancaire',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    AspectRatio(
                      aspectRatio: 1.6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: _pickedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(_pickedImage!,
                                          fit: BoxFit.cover),
                                    )
                                  : null,
                            ),
                            const Positioned(
                                top: 0,
                                left: 0,
                                child:
                                    CornerShapeWidget(top: true, left: true)),
                            const Positioned(
                                top: 0,
                                right: 0,
                                child:
                                    CornerShapeWidget(top: true, left: false)),
                            const Positioned(
                                bottom: 0,
                                left: 0,
                                child:
                                    CornerShapeWidget(top: false, left: true)),
                            const Positioned(
                                bottom: 0,
                                right: 0,
                                child:
                                    CornerShapeWidget(top: false, left: false)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recto de la carte',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Positionner de manière précise les\n04 coins de l’avant dans le cadre',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              const Spacer(),
              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: CircularProgressIndicator(),
                )
              else if (_result.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    _result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      icon: const Icon(Icons.flash_off, size: 20),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      //onTap: _pickImage,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ReceiptTicketPage())),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                            border:
                                Border.all(color: Colors.white, width: 1.5)),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      icon: const Icon(Icons.camera_alt, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
