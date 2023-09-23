const mongoose = require('mongoose');

const PlayerSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  seed: {
    type: String,
    required: true
  },
  socketId: {
    type: String,
    required: true
  },
  score: {
    type: Number,
    default: 0
  }
});

const Player = mongoose.model('Player', PlayerSchema);

module.exports = Player;