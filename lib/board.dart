import 'package:flutter/material.dart';
import 'minimax.dart';

class Board extends StatefulWidget {
  final String player;
  final String machine;
  final bool playerFirst;
  const Board({Key? key, required this.player, required this.machine, required this.playerFirst})
      : super(key: key);

  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  late List<List<String>> _board;
  late String _message;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ''));
    _message = '';

    if (!widget.playerFirst) {
      _machineMove();
    }
  }

  Widget _buildTile(int row, int col) {
    return GestureDetector(
      onTap: () => _handleTap(row, col),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            _board[row][col],
            style: TextStyle(fontSize: 36),
          ),
        ),
      ),
    );
  }

  void _handleTap(int row, int col) {
    if (_board[row][col] == '' && _message == '') {
      setState(() {
        _board[row][col] = widget.player;
      });

      if (!_checkWinner() && !_checkDraw()) {
        _machineMove();
      }
    }
  }

  void _machineMove() {
    Move bestMove = findBestMove(_board, widget.machine, widget.player);
    setState(() {
      _board[bestMove.row][bestMove.col] = widget.machine;
    });
    _checkWinner();
    _checkDraw();
  }

  bool _checkWinner() {
    const List<List<List<int>>> lines = [
      // Horizontal
      [
        [0, 0],
        [0, 1],
        [0, 2]
      ],
      [
        [1, 0],
        [1, 1],
        [1, 2]
      ],
      [
        [2, 0],
        [2, 1],
        [2, 2]
      ],
      // Vertical
      [
        [0, 0],
        [1, 0],
        [2, 0]
      ],
      [
        [0, 1],
        [1, 1],
        [2, 1]
      ],
      [
        [0, 2],
        [1, 2],
        [2, 2]
      ],
      // Diagonal
      [
        [0, 0],
        [1, 1],
        [2, 2]
      ],
      [
        [0, 2],
        [1, 1],
        [2, 0]
      ],
    ];

    for (final line in lines) {
      final a = _board[line[0][0]][line[0][1]];
      final b = _board[line[1][0]][line[1][1]];
      final c = _board[line[2][0]][line[2][1]];

      if (a.isNotEmpty && a == b && b == c) {
        setState(() {
          _message = '$a wins!';
        });
        return true;
      }
    }
    return false;
  }

  bool _checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board[i][j] == '') {
          return false;
        }
      }
    }
    setState(() {
      _message = "It's a draw!";
    });
    return true;
  }

    @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (row) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (col) => _buildTile(row, col),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _message,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _initialize();
            });
          },
          child: const Text('Restart'),
        ),
      ],
    );
  }
}
