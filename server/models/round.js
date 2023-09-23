const mongoose = require('mongoose');

const RoundSchema = new mongoose.Schema({
  roundNumber: {
    type: Number,
    required: true
  },
  winner: {
    type: String,
    required: false
  },
  score: {
    type: Number,
    required: false
  }
});

module.exports = mongoose.model('Round', RoundSchema);