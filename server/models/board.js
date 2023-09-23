const mongoose = require('mongoose');
const Cell = require('./cell').schema;

const BoardSchema = new mongoose.Schema({
  rows: {
    type: Number,
    required: true
  },
  columns: {
    type: Number,
    required: true
  },
  cells: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Cell'
  }]
});

const Board = mongoose.model('Board', BoardSchema);
module.exports = Board;