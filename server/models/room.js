// roomShema based on game.dart file
const mongoose = require("mongoose");
const PlayerSchema = require("./player").schema;
const BoardSchema = require("./board").schema;
const RoundSchema = require("./round").schema;

const RoomSchema = new mongoose.Schema({
  players: [PlayerSchema],
  currentPlayer: PlayerSchema,
  board: {
    type: BoardSchema,
    required: true
  },
  state: {
    type: String,
    required: true
  },
  roundCount: {
    type: Number,
    required: true
  },
  rounds: [RoundSchema],
  currentRound: RoundSchema,
  winCount: {
    type: Number,
    required: true
  },
  // checkingCells: [cellSchema],   unecessary
  // check if the room is unable to join or not
  isJoin: {
    type: Boolean,
    default: true,
  },
});

const roomModel = mongoose.model("Room", RoomSchema);
module.exports = roomModel;
