import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class OtpTextFieldWidget extends StatefulWidget {
  final int length;
  final double boxSize;
  final void Function(String) onSubmit;
  // final TextStyle textStyle;

  const OtpTextFieldWidget({
    super.key,
    this.length = ConstantScale.otpNumber,
    this.boxSize = 50,
    required this.onSubmit,
    // this.textStyle = const TextStyle(
    //   fontSize: 20,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.black,
    // ),
  });

  @override
  State<OtpTextFieldWidget> createState() => _OtpTextFieldWidgetState();
}

class _OtpTextFieldWidgetState extends State<OtpTextFieldWidget> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1 && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final code = _controllers.map((e) => e.text).join();
    if (code.length == widget.length) {
      widget.onSubmit(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: widget.boxSize,
          height: widget.boxSize,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            style: Theme.of(context).textTheme.displaySmall,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              isDense: false,
              counterText: '',
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onChanged: (value) => _onChanged(index, value),
          ),
        );
      }),
    );
  }
}

