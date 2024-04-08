import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});
  bool isFlashlightOn = false;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    /// Returns a singleton with the controller that you had initialized
    /// on `main.dart`
    final torchController = TorchController();
    torchController.initialize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simle Flashlight App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool? active = await torchController.toggle();

            // Add your onPressed code here!
            setState(() {
              widget.isFlashlightOn = active!;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.isFlashlightOn ? 'Turn On' : 'Turn Off'),
              const SizedBox(height: 20),
              Icon(
                widget.isFlashlightOn
                    ? Icons.flash_on
                    : Icons.flash_off,
                size: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
