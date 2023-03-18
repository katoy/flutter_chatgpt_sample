import 'package:flutter/material.dart';

typedef OnPlayerSelected = void Function({
  required String player,
  required bool playerFirst,
});

class PlayerSelection extends StatefulWidget {
  final OnPlayerSelected onPlayerSelected;

  const PlayerSelection({Key? key, required this.onPlayerSelected})
      : super(key: key);

  @override
  PlayerSelectionState createState() => PlayerSelectionState();
}

class PlayerSelectionState extends State<PlayerSelection> {
  String _player = 'X';
  bool _playerFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('プレイヤー:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRadioButton('X', true),
            _buildRadioButton('O', false),
          ],
        ),
        const Text('先手:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRadioButton('プレイヤー', true, isPlayerSelection: false),
            _buildRadioButton('マシン', false, isPlayerSelection: false),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButton(String value, bool groupValue, {bool isPlayerSelection = true}) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: isPlayerSelection ? _player : (_playerFirst ? 'プレイヤー' : 'マシン'),
          onChanged: (newValue) {
            setState(() {
              if (isPlayerSelection) {
                _player = newValue!;
              } else {
                _playerFirst = newValue == 'プレイヤー';
              }
              widget.onPlayerSelected(player: _player, playerFirst: _playerFirst);
            });
          },
        ),
        Text(value),
      ],
    );
  }
}
