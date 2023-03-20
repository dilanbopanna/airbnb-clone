// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as NavBar$RescriptReactTemplate from "./NavBar.bs.js";
import * as Filters$RescriptReactTemplate from "./Filters.bs.js";

function App(Props) {
  var match = React.useState(function () {
        return false;
      });
  var openProfile = match[0];
  return React.createElement("div", {
              className: "flex flex-col font-fig-tree"
            }, React.createElement(NavBar$RescriptReactTemplate.make, {
                  openProfile: openProfile,
                  setOpenProfile: match[1]
                }), React.createElement(Filters$RescriptReactTemplate.make, {
                  openProfile: openProfile
                }));
}

var make = App;

export {
  make ,
  
}
/* react Not a pure module */
