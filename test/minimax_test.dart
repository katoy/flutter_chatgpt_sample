import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_chatgpt_sample/minimax.dart';

void main() {
  group('MiniMax bestMove', () {
    test('Finds the best move for a winning position', () {
      final board = [
        ['O', 'X', 'O'],
        ['X', 'X', 'O'],
        ['', '', ''],
      ];
      final bestMove = findBestMove(board, 'X', 'O');
      expect(bestMove.row, 2);
      expect(bestMove.col, 1);
    });

    test('Finds the best move for a drawing position', () {
      final board = [
        ['O', 'X', 'O'],
        ['X', 'X', 'O'],
        ['X', 'O', ''],
      ];
      final bestMove = findBestMove(board, 'X', 'O');
      expect(bestMove.row, 2);
      expect(bestMove.col, 2);
    });

    test('Finds the best move for an empty board', () {
      final board = [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ];
      final bestMove = findBestMove(board, 'X', 'O');
      expect(bestMove.row, 0);
      expect(bestMove.col, 0);
    });
  });
}
