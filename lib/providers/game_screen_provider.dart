import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:utak_riscian/question.dart';
import 'package:utak_riscian/services/storage_util.dart';

class GameScreenProvider extends ChangeNotifier {
  List<String>? _answer = [];
  late List<String> userAnswer;
  List<String> choices = [];
  bool _correct = false;
  int _coins = 0;
  int _stage = 0;
  bool isFinish = false;
  bool isWrong = false;

  int _tempStage = 0;

  GameScreenProvider() {
    _stage = getStageFromStorage();
    _coins = getCoinsFromStorage();
    loadQuestions();
  }

  int getStageFromStorage() => StorageUtil.getInt('stage');

  int getCoinsFromStorage() => StorageUtil.getInt('coins');

  int get stage => _stage;

  int get coins => _coins;

  final List<Question> questions = [];

  Future<void> loadQuestions() async {
    // load question from asset json
    final String response =
        await rootBundle.loadString('assets/questions.json');
    final q = json.decode(response)['questions'];
    try {
      final json =
          (q as List<dynamic>).map((e) => Question.fromMap(e)).toList();
      questions.addAll(json);
    } catch (e) {
      print(e);
    }
    // questions
    //     .sort((curr, next) => curr.answer.length.compareTo(next.answer.length));
    setQuestion(_stage);
    notifyListeners();
  }

  void setStage(int index) {
    _stage = index;
    notifyListeners();
  }

  void addAnswer(int index) {
    String selected = choices[index];

    int iUserAns = userAnswer.indexOf(' ');
    if (iUserAns > -1) {
      userAnswer[iUserAns] = selected;
      choices.removeAt(index);
      hintCount++;
      print(index);
      answerChecker();
      notifyListeners();
    }
  }

  void answerChecker() {
    if (userAnswer.where((val) => val == ' ').isEmpty) {
      if (_answer!.join() == userAnswer.join()) {
        _correct = true;

        print("$_tempStage - ${getStageFromStorage()}");
        if (_tempStage == getStageFromStorage()) {
          int stage = getStageFromStorage() + 1;
          int coins = getCoinsFromStorage() + 20;
          print(StorageUtil.putInt('stage', stage));
          print(StorageUtil.putInt('coins', coins));
        }

        _stage = getStageFromStorage();
        _tempStage = stage;
        _coins = getCoinsFromStorage();
        setQuestion(_stage);
        print(_stage);
      } else {
        HapticFeedback.mediumImpact();
        isWrong = true;
      }
    }
  }

  void removeAnswer(int index) {
    if (userAnswer[index] != ' ') {
      choices.add(userAnswer[index]);
      userAnswer[index] = ' ';
      hintCount--;
      print('removed');
      notifyListeners();
    }
  }

  List<String>? get answer => _answer;

  bool get correct => _correct;

  void resetCorrect() => _correct = !_correct;

  late Question _question;

  Question get question => _question;

  void setQuestion(int index) {
    if (index < questions.length) {
      Question question = questions[index];
      _question = question;
      _answer = question.answer;
      _tempStage = index;
      userAnswer = List.filled(_answer!.length, ' ');
      generateChoices();
      hintCount = 0;
    } else {
      isFinish = true;
    }
    notifyListeners();
  }

  void clearData() async {
    _coins = 0;
    _stage = 0;
    _correct = false;
    isFinish = false;

    setQuestion(0);
    await StorageUtil.clrData();
    notifyListeners();
  }

  void generateChoices() {
    int generateCount = 0;
    if (answer!.length >= 8) {
      generateCount = 16 - answer!.length;
    } else {
      generateCount = 8 - answer!.length;
    }

    choices = new List.from(generateRandomString(generateCount))
      ..addAll(answer!);
    choices.shuffle();
  }

  final _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Random _rnd = Random();

  List<String> generateRandomString(int length) => List.generate(
        length,
        (_) => String.fromCharCode(
          _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );

  int hintCount = 0;

  void hint() {
    int index = userAnswer.indexOf(' ');

    if (index >= 0) {
      userAnswer[index] = _answer![index];
      choices.remove(userAnswer[index]);
      int coins = getCoinsFromStorage() - 20;
      print(StorageUtil.putInt('coins', coins));
      _coins = coins;
      hintCount++;
      answerChecker();
      notifyListeners();
    }
  }
}
