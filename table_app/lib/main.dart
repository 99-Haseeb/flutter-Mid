import 'package:flutter/material.dart';

void main() {
  runApp(CountingTableGenerator());
}

class CountingTableGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tableLimit = 1;
  int startValue = 1;
  int endValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Table App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent, // Set the background color of the AppBar to transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 5, // Adjust the elevation for a 3D effect
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              _buildIncrementDecrement(
                value: tableLimit.toDouble(),
                label: 'Table Number',
                increment: () {
                  setState(() {
                    tableLimit++;
                  });
                },
                decrement: () {
                  setState(() {
                    tableLimit--;
                  });
                },
              ),
              _buildIncrementDecrement(
                value: startValue.toDouble(),
                label: 'Starting Point',
                increment: () {
                  setState(() {
                    startValue++;
                  });
                },
                decrement: () {
                  setState(() {
                    startValue--;
                  });
                },
              ),
              _buildIncrementDecrement(
                value: endValue.toDouble(),
                label: 'Ending Limit',
                increment: () {
                  setState(() {
                    endValue++;
                  });
                },
                decrement: () {
                  setState(() {
                    endValue--;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountingTablePage(
                          tableLimit: tableLimit,
                          startValue: startValue,
                          endValue: endValue,
                        ),
                      ),
                    );
                  },
                  child: Text('Generate Table', style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.lime,
                    backgroundColor: Colors.white30,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(fontSize: 18),
                    elevation: 5, // Increase elevation for 3D effect
                    shadowColor: Colors.black.withOpacity(0.5), // Set shadow color for depth perception
                   // side: BorderSide(color: Colors., width: 2), // Add border to enhance 3D effect
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildIncrementDecrement({
    required double value,
    required String label,
    required Function() increment,
    required Function() decrement,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: decrement,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.lime[500],
                  ),
                  child: Icon(Icons.remove, color: Colors.black54),
                ),
              ),
            ),
            SizedBox(width: 20),
            Text(
              value.toInt().toString(),
              style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Material(
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: increment,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lime[800],
                  ),
                  child: Icon(Icons.add, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

}

class CountingTablePage extends StatelessWidget {
  final int tableLimit;
  final int startValue;
  final int endValue;

  CountingTablePage({
    required this.tableLimit,
    required this.startValue,
    required this.endValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Generated Table",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent, // Set the background color of the AppBar to transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 5, // Adjust the elevation for a 3D effect
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DataTable(
                  columns: _generateColumns(),
                  rows: _generateRows(),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            startValue: startValue,
                            endValue: endValue,
                            tableLimit: tableLimit,
                          ),
                        ),
                      );
                    },
                    child: Text('Generate Quiz', style: TextStyle(color: Colors.black, fontSize: 20)),
                    style:ElevatedButton.styleFrom(
                      foregroundColor: Colors.lime,
                      backgroundColor: Colors.white30,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5, // Increase elevation for 3D effect
                      shadowColor: Colors.black.withOpacity(0.5), // Set shadow color for depth perception
                      // side: BorderSide(color: Colors., width: 2), // Add border to enhance 3D effect
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _generateColumns() {
    return [
      DataColumn(label: Text('Numbers', style: TextStyle(color: Colors.black))),
      DataColumn(label: Text('Results', style: TextStyle(color: Colors.black))),
    ];
  }

  List<DataRow> _generateRows() {
    List<DataRow> rows = [];
    for (int i = startValue; i <= endValue; i++) {
      rows.add(DataRow(
        cells: [
          DataCell(Text('$tableLimit x $i', style: TextStyle(color: Colors.black))),
          DataCell(Text('${tableLimit * i}', style: TextStyle(color: Colors.black))),
        ],
      ));
    }
    return rows;
  }
}

class QuizPage extends StatefulWidget {
  final int startValue;
  final int endValue;
  final int tableLimit;

  QuizPage({
    required this.startValue,
    required this.endValue,
    required this.tableLimit,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  late List<List<int>> _questions;
  late List<List<int>> _options;
  late List<int> _correctAnswers;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
  }

  void _generateQuestions() {
    _questions = [];
    _options = [];
    _correctAnswers = [];

    // Iterate through each table value
    for (int i = widget.startValue; i <= widget.endValue; i++) {
      // Iterate through multipliers for each table
      for (int j = 1; j <= 1; j++) {
        int table = widget.tableLimit;
        int multiplier = i;

        // Add the question to the lists
        _questions.add([table, multiplier]);
        int correctAnswer = table * multiplier;
        _correctAnswers.add(correctAnswer);
        _options.add(_generateOptions(correctAnswer));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon to black
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        title: Text(
          "Quiz",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent, // Set the background color of the AppBar to transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 5, // Adjust the elevation for a 3D effect
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffD4D166), Color(0xFF7f7d3d)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1} = ${_questions[_currentQuestionIndex][0]} x ${_questions[_currentQuestionIndex][1]}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                      (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _showResult(context, _options[_currentQuestionIndex][index]);
                      },
                      child: Text(
                        '${String.fromCharCode(index + 97)}) ${_options[_currentQuestionIndex][index]}',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.lime,
                        backgroundColor: Colors.white30,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                        elevation: 5, // Increase elevation for 3D effect
                        shadowColor: Colors.black.withOpacity(0.5), // Set shadow color for depth perception
                        // side: BorderSide(color: Colors., width: 2), // Add border to enhance 3D effect
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_currentQuestionIndex < _questions.length - 1) {
                          _currentQuestionIndex++;
                        } else {
                          _currentQuestionIndex = 0;
                          _generateQuestions();
                        }
                      });
                    },
                    child: Text('Next Question', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.lime,
                      backgroundColor: Colors.white30,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5, // Increase elevation for 3D effect
                      shadowColor: Colors.black.withOpacity(0.5), // Set shadow color for depth perception
                      // side: BorderSide(color: Colors., width: 2), // Add border to enhance 3D effect
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<int> _generateOptions(int correctAnswer) {
    List<int> options = [correctAnswer];
    int incorrect1 = correctAnswer + 10;
    int incorrect2 = correctAnswer + 20;
    options.add(incorrect1);
    options.add(incorrect2);
    options.shuffle();
    return options;
  }

  void _showResult(BuildContext context, int selectedAnswer) {
    int correctAnswer = _correctAnswers[_currentQuestionIndex];
    String resultMessage = selectedAnswer == correctAnswer
        ? 'True ${_questions[_currentQuestionIndex][0]}x${_questions[_currentQuestionIndex][1]}=$correctAnswer'
        : 'False!';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Result', style: TextStyle(color: Colors.white)),
          content: Text(resultMessage, style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF24243e),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}