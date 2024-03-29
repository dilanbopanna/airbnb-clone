// Generated by ReScript, PLEASE EDIT WITH CARE

import * as $$Array from "rescript/lib/es6/array.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Js_json from "rescript/lib/es6/js_json.js";
import * as Js_math from "rescript/lib/es6/js_math.js";
import * as Caml_array from "rescript/lib/es6/caml_array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import StaysJson from "./stays.json";
import * as Stay$RescriptReactTemplate from "./Types/Stay.bs.js";
import * as Carousel$RescriptReactTemplate from "./Components/Carousel.bs.js";

var stays = StaysJson;

function swapElements(arr, i, j) {
  var newArray = $$Array.copy(arr);
  var temp = Caml_array.get(newArray, i);
  Caml_array.set(newArray, i, Caml_array.get(newArray, j));
  Caml_array.set(newArray, j, temp);
  return newArray;
}

function shuffleArray(_arr, _i) {
  while(true) {
    var i = _i;
    var arr = _arr;
    if (i === 0) {
      return arr;
    }
    var j = Js_math.random_int(0, i);
    var newArr = swapElements(arr, i, j);
    _i = i - 1 | 0;
    _arr = newArr;
    continue ;
  };
}

function ViewStays$DisplayCarousel(Props) {
  var stays = Props.stays;
  var i = Props.i;
  var match = React.useState(function () {
        return true;
      });
  var setIsLoading = match[1];
  setTimeout((function (param) {
          return Curry._1(setIsLoading, (function (param) {
                        return false;
                      }));
        }), Math.imul(i + 1 | 0, 100));
  return React.createElement(Carousel$RescriptReactTemplate.make, {
              stays: stays,
              loading: match[0]
            });
}

var DisplayCarousel = {
  make: ViewStays$DisplayCarousel
};

function ViewStays(Props) {
  var selected = Props.selected;
  var stays$1 = React.useMemo((function () {
          var arr = Belt_Option.getWithDefault(Js_json.decodeArray(stays), []);
          return shuffleArray(arr, arr.length - 1 | 0);
        }), [selected]);
  return React.createElement("div", {
              className: "px-5 md:px-10 lg:px-16 my-10 flex flex-wrap flex-row gap-10 overflow-scroll justify-center lg:justify-start lg"
            }, stays$1.map(function (item, i) {
                  var stays = Stay$RescriptReactTemplate.itemToObjectMapper(Belt_Option.getWithDefault(Js_json.decodeObject(item), {}));
                  return React.createElement(ViewStays$DisplayCarousel, {
                              stays: stays,
                              i: i
                            });
                }));
}

var make = ViewStays;

export {
  stays ,
  swapElements ,
  shuffleArray ,
  DisplayCarousel ,
  make ,
  
}
/* stays Not a pure module */
