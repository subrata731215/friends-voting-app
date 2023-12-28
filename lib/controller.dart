import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reactiv/reactiv.dart';

class VotingController extends ReactiveController {
  String votingTitle = '';
  String votingTitleLabelText = 'Voting Title';
  ReactiveInt agree = ReactiveInt(0);
  ReactiveInt notAgree = ReactiveInt(0);
  ReactiveInt totalVote = ReactiveInt(0);
  ReactiveBool isDisable = ReactiveBool(true);
  ReactiveBool agreeButton = ReactiveBool(true);
  ReactiveBool notAgreeButton = ReactiveBool(true);

  int agreePercentage() {
    var k = agree.value / totalVote.value * 100;
    return k.round();
  }

  int notAgreePercentage() {
    var k = notAgree.value / totalVote.value * 100.round();
    return k.round();
  }

  void showResultDialog(context) {
    if (totalVote.value >= 3) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.black,
                icon: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'Result for \n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: votingTitle,
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                    ])),
                title: agree.value >= notAgree.value
                    ? Lottie.asset(
                        'images/lottie/congrats.json',
                      )
                    : Lottie.asset(
                        'images/lottie/lost.json',
                      ),
                content: Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  color:
                      agree.value >= notAgree.value ? Colors.teal : Colors.red,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Agree(${agreePercentage()}%) : ${agree.value.toString()}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Not Agree(${notAgreePercentage()}%) : ${notAgree.value.toString()}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              ));
    }
  }
}
