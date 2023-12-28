import 'package:flutter/material.dart';
import 'package:reactiv/views/reactive_state_widget.dart';
import '../controller.dart';

class VotingButton extends ReactiveStateWidget<VotingController> {
  @override
  BindController<VotingController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => VotingController());
  }

  const VotingButton(
      {super.key,
      required this.buttonText,
      required this.onp,
      required this.backgroundColor});

  final String buttonText;
  final VoidCallback onp;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 40))),
        onPressed: onp,
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
