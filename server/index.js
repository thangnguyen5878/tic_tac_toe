const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const Room = require("./models/room");

const app = express();
const port = process.env.PORT || 3000;
const server = http.Server(app);

const io = require("socket.io")(server);

require("dotenv").config();

io.on("connection", (socket) => {
  console.log("server connected to client");
  socket.on("createRoom", async ({ playerName }) => {
    console.log(playerName);
    try {
      // room is created
      let room = new Room();
      let player = {
        name: playerName,
        seed: "X",
        socketID: socket.id,
        score: 0,
      };
      let board = {
        rows: 10,
        columns: 10,
      };
      room.players.push(player);
      room.currentPlayer = player;
      room.board = board;

      room = await room.save();
      console.log(room);
      const roomId = room._id.toString();

      socket.join(roomId);
      // io -> send data to everyone
      // socket -> sending data to yourself
      io.to(roomId).emit("createRoomSuccess", room);
    } catch (e) {
      console.log(e);
    }
  });
});

mongoose
  .connect(process.env.MONGODB_URL)
  .then(() => {
    console.log("DB Connection successfull");
  })
  .catch((e) => {
    console.log(e);
  });

// app.use(express.json());

server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port ${port}`);
});
