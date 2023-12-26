// game constants
const int defaultRowCount = 9;
const int defaultColumnCount = 9;

// online game constants
const int defaultOnlineRowCount = 2;
const int defaultOnlineColumnCount = 2;

// json snippet
Map<String, dynamic> roomJsonSnippet =  {
     "winCount": 5,
     "historyBoard": {
         "cells": {
             "0": [
                 {
                     "column": 0,
                     "row": 0,
                     "state": "normal",
                     "content": "noSeed"
                   },
                 {
                     "column": 1,
                     "row": 0,
                     "state": "normal",
                     "content": "noSeed"
                   }
               ],
             "1": [
                 {
                     "column": 0,
                     "state": "normal",
                     "row": 1,
                     "content": "noSeed"
                   },
                 {
                     "column": 1,
                     "row": 1,
                     "state": "normal",
                     "content": "noSeed"
                   }
               ]
           },
         "rowCount": 2,
         "columnCount": 2
       },
     "name": "Untitled Room",
     "historyRoundIndex": 0,
     "id": "ec483c14-f414-44ae-bea1-b84e409331f0",
     "state": "playing",
     "rounds": [
         {
             "historyTurns": [],
             "currentPlayerIndex": 0,
             "_historyPlayerIndex": 0,
             "players": [
                 {
                     "score": 0,
                     "finalScore": null,
                     "seed": "cross",
                     "name": "Player 1",
                     "initialScore": 0,
                     "index": 0
                   },
                 {
                     "score": 0,
                     "finalScore": null,
                     "seed": "nought",
                     "initialScore": 0,
                     "name": "Player 2",
                     "index": 1
                   }
               ],
             "historyTurnIndex": 0,
             "winTurnIndex": null,
             "index": 0,
             "currentTurnIndex": 0,
             "winnerIndex": null,
             "turns": []
           }
       ],
     "board": {
         "cells": {
             "0": [
                 {
                     "column": 0,
                     "state": "normal",
                     "row": 0,
                     "content": "noSeed"
                   },
                 {
                     "column": 1,
                     "row": 0,
                     "state": "normal",
                     "content": "noSeed"
                   }
               ],
             "1": [
                 {
                     "column": 0,
                     "state": "normal",
                     "row": 1,
                     "content": "noSeed"
                   },
                 {
                     "column": 1,
                     "row": 1,
                     "state": "normal",
                     "content": "noSeed"
                   }
               ]
           },
         "rowCount": 2,
         "columnCount": 2
       },
     "currentRoundIndex": 0
   };

Map<String, dynamic> cellJsonSnippet = {
  "row": null,
  "column": null,
  "content": "noSeed",
  "state": "normal"
};

Map<String, dynamic> playerJsonSnippet = {
  "index": null,
  "name": null,
  "seed": null,
  "score": 0,
  "initialScore": null,
  "finalScore": null
};

Map<String, dynamic> roundJsonSnippet = {
  "index": null,
  "players": null,
  "currentPlayerIndex": 0,
  "currentTurnIndex": 0,
  "winnerIndex": null,
  "winTurnIndex": null,
  "turns": [],
  "historyTurns": [],
  "_historyPlayerIndex": 0,
  "historyTurnIndex": 0
};

Map<String, dynamic> boardJsonSnippet = {
  "rowCount": 2,
  "columnCount": 2,
  "cells": {
    "0": [
      {
        "row": 0,
        "column": 0,
        "content": "noSeed",
        "state": "normal"
      },
      {
        "row": 0,
        "column": 1,
        "content": "noSeed",
        "state": "normal"
      }
    ],
    "1": [
      {
        "row": 1,
        "column": 0,
        "content": "noSeed",
        "state": "normal"
      },
      {
        "row": 1,
        "column": 1,
        "content": "noSeed",
        "state": "normal"
      }
    ]
  }
};