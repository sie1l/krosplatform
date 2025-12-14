import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 14 Native',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const NativeLabScreen(),
    );
  }
}

class NativeLabScreen extends StatefulWidget {
  const NativeLabScreen({super.key});

  @override
  State<NativeLabScreen> createState() => _NativeLabScreenState();
}

class _NativeLabScreenState extends State<NativeLabScreen> {
  static const platform = MethodChannel('com.example.lab14/message');

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _showNativeMessage() async {
    String message;
    try {
      final String result = await platform.invokeMethod('getGreeting');
      message = result;
    } on PlatformException catch (e) {
      message = "Failed: '${e.message}'.";
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.android, size: 40, color: Colors.green),
          title: const Text("Native data:"),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }


  Future<void> _pickImage() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        setState(() {
          _image = File(photo.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.purple,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _showNativeMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.deepPurple),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text("#1 String", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Center(
                child: _image == null
                    ? const Text(
                  "No image taken",
                  style: TextStyle(color: Colors.grey),
                )
                    : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      _image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        backgroundColor: Colors.deepPurple[100],
        child: const Icon(Icons.camera_alt, color: Colors.black87),
      ),
    );
  }
}