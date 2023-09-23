const mongoose = require('mongoose');

const CellSchema = new mongoose.Schema({
  row: {
    type: Number,
    required: true
  },
  column: {
    type: Number,
    required: true
  },
  content: {
    type: String,
    required: true
  },
  state: {
    type: String,
    required: true
  }
});

const Cell = mongoose.model('Cell', CellSchema);

module.exports = Cell;
