const express = require('express');

const app = express();

app.set('view engine', 'ejs');

app.get('/', (req, res) => {
  res.send('Fundamentals of DevOps');
});

app.get('/name/:name', (req, res) => {

  res.send('hello', {name: req.params.name});
});

module.exports = app;