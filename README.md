# flutter_chatgpt_sample

tictactoe  ゲームを ChartGPT 4 で作成してみた。

## その１

```text
人間vsマシンの対戦機能を持つ tictactoe のプログラムを flutter 3.7 で書いてください。
プログラムは次の機能を持つようにします。
* マシンは絶対に人間に負けることは無い。
* 勝負がついたら その結果を表示する。
* ゲームを開始する前に先手が人間かマシンかを選べるようにする。
* "Constructors for public widgets should have a named 'key' parameter." 野警告が出ないようにしてください。

まずはファイル構成だけ示してください。

その後は、ファイル名を指定した質問をしたら、そのファイル内容を示してください。
１つのファイルの行数が50行を超える場合は、50行ごとに分割して表示してください。

日本語で回答をしてください。
ファイル構成は次のようにしてください。
main.dart
tictactoe.dart
minimax.dart
board.dart
custom_button.dart
player_selection.dart
```

あとは、次のような質問をしていきました。

```text
minimax.dart をメソッドの実装を省略しないで示してください。、
１つのファイルの行数が50行を超える場合は、50行程度ごとに分割して表示してください。
最初は、先頭部分を表示してください。
そのあとは "続き表示してください" と質問したら表示をしていくことにします。
```

テストコードも作成させてみた。

```text
https://github.com/katoy/flutter_chatgpt_sample/tree/main/lib/minimax.dart
のプログラムに対するテストコード例を示してください。
```
