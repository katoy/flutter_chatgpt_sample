import 'dart:math';

class Move {
  final int row;
  final int col;
  const Move({required this.row, required this.col});
}

Move findBestMove(List<List<String>> board, String machine, String player) {
  int bestVal = -1000;
  Move bestMove = const Move(row: -1, col: -1);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == '') {
        board[i][j] = machine;
        int moveVal = _minimax(board, 0, false, machine, player);
        board[i][j] = '';
        if (moveVal > bestVal) {
          bestMove = Move(row: i, col: j);
          bestVal = moveVal;
        }
      }
    }
  }
  return bestMove;
}
int _minimax(List<List<String>> board, int depth, bool isMax, String machine, String player) {
  int score = _evaluate(board, machine, player);

  if (score == 10) {
    return score - depth;
  }
  if (score == -10) {
    return score + depth;
  }
  if (_isMovesLeft(board) == false) {
    return 0;
  }

  if (isMax) {
    int best = -1000;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = machine;
          best = max(best, _minimax(board, depth + 1, !isMax, machine, player));
          board[i][j] = '';
        }
      }
    }
    return best;
  } else {
    int best = 1000;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = player;
          best = min(best, _minimax(board, depth + 1, !isMax, machine, player));
          board[i][j] = '';
        }
      }
    }
    return best;
  }
}

int _evaluate(List<List<String>> board, String machine, String player) {
  // 横のラインをチェック
  for (int row = 0; row < 3; row++) {
    if (board[row][0] == board[row][1] && board[row][1] == board[row][2]) {
      if (board[row][0] == machine) {
        return 10;
      }  else if (board[row][0] == player) {
        return -10;
      }
    }
  }

  // 縦のラインをチェック
  for (int col = 0; col < 3; col++) {
    if (board[0][col] == board[1][col] && board[1][col] == board[2][col]) {
      if (board[0][col] == machine) {
        return 10;
      } else if (board[0][col] == player) {
        return -10;
      }
    }
  }

  // 斜めのラインをチェック
  if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    if (board[0][0] == machine) {
      return 10;
    } else if (board[0][0] == player) {
      return -10;
    }
  }

  if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
    if (board[0][2] == machine) {
      return 10;
    } else if (board[0][2] == player) {
      return -10;
    }
  }

  // 勝敗がついていない場合
  return 0;
}

bool _isMovesLeft(List<List<String>> board) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == '') return true;
    }
  }
  return false;
}
