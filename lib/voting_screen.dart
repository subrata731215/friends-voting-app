import 'package:flutter/material.dart';
import 'package:friends_voting_app/controller.dart';
import 'package:friends_voting_app/utils/button.dart';
import 'package:friends_voting_app/utils/dialog.dart';
import 'package:reactiv/reactiv.dart';

class VotingScreen extends ReactiveStateWidget<VotingController> {
  @override
  BindController<VotingController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => VotingController());
  }

  const VotingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff015494),
        body: Observer(
          listenable: controller.totalVote,
          listener: (totalVote) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Observer(
                              listenable: controller.totalVote,
                              listener: (voteCount) {
                                return Text(
                                  '[ Total Vote :  ${int.parse(controller.totalVote.value.toString())} ]',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2),
                                );
                              })),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Vote For : \n',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2),
                          ),
                          TextSpan(
                              text: '${controller.votingTitle}. \n',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  letterSpacing: 3)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VotingButton(
                          buttonText: 'Agree',
                          backgroundColor: Colors.green,
                          onp: () async {
                            if (controller.agreeButton.value) {
                              controller.agree.value++;
                              controller.totalVote.value++;
                              voteDoneDialog(context);
                              controller.agreeButton.value = false;
                              controller.notAgreeButton.value = false;
                              await Future.delayed(const Duration(seconds: 5), () {
                                controller.agreeButton.value = true;
                                controller.notAgreeButton.value = true;
                              });
                            }
                          },
                        ),
                        const SizedBox(width: 20),
                        VotingButton(
                          buttonText: 'Not Agree',
                          backgroundColor: Colors.red,
                          onp: () async {
                            if (controller.notAgreeButton.value) {
                              controller.notAgree.value++;
                              controller.totalVote.value++;
                              voteDoneDialog(context);
                              controller.notAgreeButton.value = false;
                              controller.agreeButton.value = false;
                              await Future.delayed(const Duration(seconds: 5), () {
                                controller.notAgreeButton.value = true;
                                controller.agreeButton.value = true;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if(totalVote>=3)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  padding:
                                      MaterialStatePropertyAll(EdgeInsets.all(30))),
                              onPressed: () {
                               controller.showResultDialog(context);
                              },
                              child: const Text(
                                'Show Result',
                                style: TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
