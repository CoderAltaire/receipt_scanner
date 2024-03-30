import 'package:flutter/material.dart';
import 'package:receipt_scanner/right/check_view_content.dart';

class CheckView extends StatefulWidget {
  const CheckView({super.key});

  @override
  CheckViewState createState() => CheckViewState();
}

class CheckViewState extends State<CheckView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              CheckViewContent(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
