import 'package:destini_app/story_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storybrain = StoryBrain();
  bool see = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storybrain.getstory(),
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storybrain.nextstory(1);
                        see = storybrain.check();
                      });
                    },
                    child: Text(
                      storybrain.getchoice1(),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: see,
                  child: Container(
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storybrain.nextstory(2);
                          see = storybrain.check();
                        });
                      },
                      child: Text(
                        storybrain.getchoice2(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                    ),
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
