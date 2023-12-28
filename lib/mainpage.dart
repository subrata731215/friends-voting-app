import 'package:flutter/material.dart';
import 'package:friends_voting_app/controller.dart';
import 'package:friends_voting_app/voting_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:reactiv/reactiv.dart';

class MainPage extends ReactiveStateWidget<VotingController> {
  @override
  BindController<VotingController>? bindController() {
    // TODO: implement bindController
    return BindController(
        controller: () => VotingController(), autoDispose: false);
  }

  const MainPage({Key? key}) : super(key: key);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          title: const Text(
            'Friends Voting Calculate',
            style: TextStyle(
                fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w900),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (title) {
                    controller.votingTitle = title;
                  },
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      letterSpacing: 2),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: controller.votingTitleLabelText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.teal),
                  ),
                  onPressed: () {
                    if (controller.votingTitle.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VotingScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 1.53,
                              left: 25,
                              right: 25),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.redAccent,
                          duration: const Duration(seconds: 3),
                          content: const Center(
                            child: Text('Please Enter your Voting title'),
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('Go to Voting Page'.toUpperCase()),
                  )),
              Lottie.asset('images/lottie/networking.json',
                  height: 300, width: 300),
            ],
          ),
        ),
      ),
    );
  }
}
