import 'package:flutter/material.dart';

class HomeTextWidget extends StatelessWidget {
  const HomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 1.5,
      ),
    );

    Widget customTextFieldSection({required String labelText}) {
      return TextField(
        style: const TextStyle(color: Colors.white),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: "sans-serif",
            fontSize: 14,
            color: Colors.white,
          ),
          focusedBorder: border,
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(34, 70, 13, 0.902),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(34, 61, 13, 0.9),
          centerTitle: true,
          title: const Text(
            "CURRENCY CONVERTER",
            style: TextStyle(
              color: Color.fromRGBO(159, 232, 112, 1),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Convert EUR to USD at the real exchange rate",
                  style: TextStyle(
                    color: Color.fromRGBO(159, 232, 112, 1),
                    fontFamily: 'san-serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: customTextFieldSection(labelText: "Amount"),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: const Icon(
                  Icons.swap_vert,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: customTextFieldSection(labelText: "Converted to"),
              ),

              ElevatedButton(
                onPressed: () => {},
                child: const Text(
                  "Track exchange rate",
                  style: TextStyle(
                    fontFamily: "sans-serif",
                    fontSize: 16,
                    color: Color.fromRGBO(22, 51, 0, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
