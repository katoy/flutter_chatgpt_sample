import 'package:flutter/material.dart';
import 'board.dart';
import 'player_selection.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  TicTacToeState createState() => TicTacToeState();
}

class TicTacToeState extends State<TicTacToe> {
  late bool _playerFirst;
  late String _player;
  late String _machine;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _playerFirst = true;
    _player = 'X';
    _machine = 'O';
  }

  void _handleSelection({required String player, required bool playerFirst}) {
    setState(() {
      _player = player;
      _machine = player == 'X' ? 'O' : 'X';
      _playerFirst = playerFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Board(
              player: _player,
              machine: _machine,
              playerFirst: _playerFirst,
            ),
            const SizedBox(height: 20),
            PlayerSelection(onPlayerSelected: _handleSelection),
          ],
        ),
      ),
    );
  }
}
