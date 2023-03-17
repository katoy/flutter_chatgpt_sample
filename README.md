# flutter_chatgpt_sample

FlutterでChatGPT APIを使ってみるサンプルです。

[dart_openai](https://pub.dev/packages/dart_openai)を使っています。

## プレビュー

<img src="https://user-images.githubusercontent.com/90010509/222900797-379e3678-a3ed-4502-b805-946f3a17a66a.png" width="70%" />

## 設定

1. APIキーを `.env.example` ファイルに記述します。

```
OPEN_AI_API_KEY=<YOUR_KEY_HERE>
```

2. `.env.example` ファイルを `.env`　に変更します。

## Zennの記事
https://zenn.dev/toridori/articles/25c310b2dad300


## その２

```
人間vsマシンの対戦機能を持つ tictaxtoe のプログラムを flutter 3.7 で書いてください。
マシンは絶対に人間に負けることは無いようにしてください。
まずはファイル構成だけ示してください。
その後は、ファイル名を指定した質問をしたら、そのファイル内容を示してください。
１つのファイルの行数が50行を超える場合は、50行ごとに分割して表示してください。
```

## その3

```text
人間vsマシンの対戦機能を持つ tictaxtoe のプログラムを flutter 3.7 で書いてください。
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
