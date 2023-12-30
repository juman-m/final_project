import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  final Function(String) onValueSelected;

  const MyCustomWidget({Key? key, required this.onValueSelected})
      : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  // Define your variables and state here

  // Example function that triggers the callback with a value
  void triggerCallbackWithValue() {
    String value = "Hello from MyCustomWidget!";

    // Call the callback function with the value
    widget.onValueSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your widget UI goes here
      child: ElevatedButton(
        onPressed: () {
          // Trigger the callback when a certain action occurs
          triggerCallbackWithValue();
        },
        child: Text("Click Me"),
      ),
    );
  }
}

// Example screen that uses MyCustomWidget
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: MyCustomWidget(
        // Pass a callback function to MyCustomWidget
        onValueSelected: (value) {
          // Handle the returned value in the screen
          print("Received value from MyCustomWidget: $value");
        },
      ),
    );
  }
}
