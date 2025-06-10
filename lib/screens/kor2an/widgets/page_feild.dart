import 'package:flutter/material.dart';

class PageFeild extends StatefulWidget {
  const PageFeild(
      {Key? key, required this.onChanged, required this.onSubmitted})
      : super(key: key);

  final void Function(String) onChanged;
  final void Function(String) onSubmitted;

  @override
  State<PageFeild> createState() => _PageFeildState();
}

class _PageFeildState extends State<PageFeild> {
  late TextEditingController textController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    focusNode = FocusNode();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return TextField(
      maxLines: 1,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      keyboardType: TextInputType.number,
      focusNode: focusNode,
      decoration: InputDecoration(
        constraints: BoxConstraints(
            maxWidth: isTablet ? 120 : 60, maxHeight: isTablet ? 100 : 35),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: Colors.black12,
        hintText: '43',
        border: _inputBorder(Colors.black38),
        enabledBorder: _inputBorder(Colors.black38),
        focusedBorder: _inputBorder(Colors.black54),
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color color) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: isTablet ? 3 : 1.5,
      ),
    );
  }
}
