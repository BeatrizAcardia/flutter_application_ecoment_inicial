import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar("Sobre nós", 0, 0, 0),
    );
  }
}