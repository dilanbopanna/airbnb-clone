// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as ReactDom from "react-dom";
import * as App$RescriptReactTemplate from "./App.bs.js";

require("tailwindcss/tailwind.css")
;

var container = document.querySelector("#app");

var app;

if (container == null) {
  app = undefined;
} else {
  var root = ReactDom.createRoot(container);
  root.render(React.createElement("div", {
            className: "h-auto flex flex-col "
          }, React.createElement("div", {
                className: "h-auto flex flex-col"
              }, React.createElement(App$RescriptReactTemplate.make, {}))));
  app = undefined;
}

export {
  app ,
  
}
/*  Not a pure module */
