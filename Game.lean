import Game.Levels.DemoWorld

-- Here's what we'll put on the title screen
Title "自然数ゲーム"
Introduction
"
こんにちは。自然数ゲームへようこそ。
このゲームは、Leanを使って様々な自然数の性質を証明します。
おっと、そんなに身構える必要はありませんよ。
"

Info "
Here you can put additional information about the game. It is accessible
from the starting through the drop-down menu.

For example: Game version, Credits, Link to Github and Zulip, etc.

Use markdown.
"

/-! Information to be displayed on the servers landing page. -/
Languages "Japanese"
CaptionShort "自然数ゲーム"
CaptionLong "自然数の性質を証明してみましょう"
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
