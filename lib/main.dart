import 'package:flutter/material.dart';
import 'package:quizz_app/data/question_list.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Questions ${index + 1} / ${questions.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  questions[index].question!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 25.0),
                for (var i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12.0),
                    padding: const EdgeInsets.all(12.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? Utils.isTrue
                              : Utils.isWrong
                          : Utils.secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              } else {
                                setState(() {
                                  Utils.btnColor = Utils.isWrong;
                                });
                              }
                            },
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResulScreen(score),
                                    ),
                                  );
                                }
                              : () {
                                  _controller!.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear,
                                  );
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Colors.orange,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "See result"
                            : 'Next Question',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
