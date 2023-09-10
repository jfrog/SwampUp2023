// client/src/App.js

import React from "react";
import logo from "./logo.svg";
import "./App.css";
import logger from 'log4js';
import _ from 'lodash';

function App() {
  _.defaultsDeep({ 'a': { 'b': 2 } }, { 'a': { 'b': 1, 'c': 3 } }, "./package.json");

  const [data, setData] = React.useState(null);

  React.useEffect(() => {
    fetch("/api")
        .then((res) => {
          logger.getLogger();
          res.json()
        })
        .then((data) => setData(data.message));
  }, []);

  return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>{!data ? "Loading..." : data}</p>
        </header>
      </div>
  );
}

export default App;