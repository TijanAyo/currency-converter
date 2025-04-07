import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController convertedToController = TextEditingController();
  String selectedCurrency = 'USD';
  String selectedCurrencyTo = 'NGN';
  List<String> currencies = [
    'USD',
    'EUR',
    'GBP',
    'CAD',
    'AUD',
    'JPY',
    'CHF',
    'CNY',
    'INR',
    'BRL',
    'MXN',
  ];

  Map<String, int> exchangeRates = {
    'USD': 1500,
    'EUR': 1300,
    'GBP': 1200,
    'CAD': 1400,
    'AUD': 1600,
    'JPY': 10,
    'CHF': 1400,
    'CNY': 200,
    'INR': 10,
    'BRL': 10,
    'MXN': 10,
  };

  @override
  void initState() {
    super.initState();
    amountController.addListener(_convertCurrency);
  }

  @override
  void dispose() {
    amountController.dispose();
    convertedToController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    double amount, convertedValue;
    String amountText = amountController.text.trim();

    if (amountText.isNotEmpty) {
      amount = double.parse(amountText);
      convertedValue = amount * exchangeRates[selectedCurrency]!;
      setState(() {
        convertedToController.text = convertedValue.toStringAsFixed(0);
      });
    } else {
      convertedToController.text = "";
    }
  }

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

    Widget customTextFieldSection({
      required String labelText,
      required TextEditingController controller,
    }) {
      return TextField(
        controller: controller,
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
                child: Text(
                  "Convert $selectedCurrencyTo to $selectedCurrency at the real exchange rate",
                  style: TextStyle(
                    color: Color.fromRGBO(159, 232, 112, 1),
                    fontFamily: 'san-serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              // Currency drop-down menu
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton<String>(
                  value: selectedCurrency,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCurrency = value!;
                    });
                  },
                  items:
                      currencies.map((String currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(
                            currency,
                            style: const TextStyle(
                              fontFamily: "sans-serif",
                              fontSize: 16,
                              color: Color.fromRGBO(159, 232, 112, 1),
                            ),
                          ),
                        );
                      }).toList(),
                  dropdownColor: const Color.fromRGBO(34, 70, 13, 0.902),
                ),
              ),

              // Amount text field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: customTextFieldSection(
                  labelText: "Amount",
                  controller: amountController,
                ),
              ),

              // Swap icon
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: const Icon(
                  Icons.swap_vert,
                  size: 35,
                  color: Colors.white,
                ),
              ),

              // Converted to text field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: customTextFieldSection(
                  labelText: "Converted to",
                  controller: convertedToController,
                ),
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
