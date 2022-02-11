/*jshint esversion: 8 */
require('dotenv').config();
const request = require('request');
const mysql = require('mysql');
const express = require('express');
const bodyParser = require("body-parser");
const NewsAPI = require('newsapi');
const newsapi = new NewsAPI(process.env.NEWS);
const querystring = require('querystring');
const app = express();
app.disable('x-powered-by');
app.set('trust proxy',true); 
var rawBodySaver = function (req, res, buf, encoding) {
  if (buf && buf.length) {
    req.rawBody = buf.toString(encoding || 'utf8');
  }
};
app.use(bodyParser.json({ verify: rawBodySaver, limit:'50mb' }));
app.use(bodyParser.urlencoded({ verify: rawBodySaver, extended: true, limit:'50mb' }));
app.use(bodyParser.raw({ verify: rawBodySaver, type: '*/*', limit:'50mb' }));

app.all('/', (req, res) => res.send('Hello world'));

app.listen(8000, '0.0.0.0', () => {
    console.log(`Webserver running on port 8000.`);
});

app.get('/news', (req, res) => {
    if(!req.query.country) res.status(400).json({success:false, reason:"No country provided."});
    newsapi.v2.topHeadlines({
        country: req.query.country
      }).then(response => {
        res.json({success:true, data: response});
      });
});