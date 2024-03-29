// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_int32 from "rescript/lib/es6/caml_int32.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Icon$RescriptReactTemplate from "../Icon.bs.js";

function Carousel(Props) {
  var stays = Props.stays;
  var loading = Props.loading;
  var match = React.useState(function () {
        return false;
      });
  var setLike = match[1];
  var match$1 = React.useState(function () {
        return 0;
      });
  var setCurrentIndex = match$1[1];
  var currentIndex = match$1[0];
  var match$2 = React.useState(function () {
        return false;
      });
  var setShowActions = match$2[1];
  var showActions = match$2[0];
  return React.createElement("div", {
              className: "flex flex-col gap-2 w-80 md:w-64"
            }, React.createElement("div", {
                  className: "w-80 h-80 md:w-64 md:h-64 max-h-72 max-w-72 rounded-2xl relative select-none " + (
                    loading ? "bg-gray-300" : ""
                  ),
                  onMouseEnter: (function (param) {
                      return Curry._1(setShowActions, (function (param) {
                                    return true;
                                  }));
                    }),
                  onMouseLeave: (function (param) {
                      return Curry._1(setShowActions, (function (param) {
                                    return false;
                                  }));
                    })
                }, loading ? null : React.createElement(React.Fragment, undefined, React.createElement(Icon$RescriptReactTemplate.make, {
                            name: "like",
                            size: 20,
                            className: (
                              match[0] ? "text-[#ff385c]" : "text-[#00000080]"
                            ) + " absolute right-0 top-0 m-3 stroke-white cursor-pointer",
                            onClick: (function (param) {
                                return Curry._1(setLike, (function (prev) {
                                              return !prev;
                                            }));
                              })
                          }), showActions && currentIndex !== 0 ? React.createElement("div", {
                              className: "h-[1.9rem] w-[1.9rem] rounded-full  flex justify-center items-center self-center -ml-8 bg-white cursor-pointer flex-row absolute left-10 top-[47%]",
                              style: {
                                zIndex: "2"
                              },
                              onClick: (function (param) {
                                  return Curry._1(setCurrentIndex, (function (prevIndex) {
                                                return Caml_int32.mod_((prevIndex - 1 | 0) + stays.images.length | 0, stays.images.length);
                                              }));
                                })
                            }, React.createElement(Icon$RescriptReactTemplate.make, {
                                  name: "left-chevron",
                                  size: 12
                                })) : null, React.createElement("img", {
                            className: "h-full w-full object-cover rounded-2xl cursor-pointer",
                            src: Belt_Option.getWithDefault(Belt_Array.get(stays.images, currentIndex), "/stays/thumbnail.png")
                          }), showActions && currentIndex !== (stays.images.length - 1 | 0) ? React.createElement("div", {
                              className: "h-[1.9rem] w-[1.9rem] rounded-full  flex justify-center items-center self-center -ml-8 bg-white cursor-pointer flex-row absolute right-2 top-[47%]",
                              style: {
                                zIndex: "2"
                              },
                              onClick: (function (param) {
                                  return Curry._1(setCurrentIndex, (function (prevIndex) {
                                                return Caml_int32.mod_(prevIndex + 1 | 0, stays.images.length);
                                              }));
                                })
                            }, React.createElement(Icon$RescriptReactTemplate.make, {
                                  name: "right-chevron",
                                  size: 12
                                })) : null)), React.createElement("div", undefined, React.createElement("div", {
                      className: "flex flex-row justify-between items-center"
                    }, React.createElement("div", {
                          className: "font-semibold font-[#222222]"
                        }, stays.name), React.createElement("div", {
                          className: "flex flex-row gap-1 items-center justify-center"
                        }, React.createElement(Icon$RescriptReactTemplate.make, {
                              name: "star",
                              size: 13,
                              className: "mt-[-0.26px]"
                            }), React.createElement("div", {
                              className: ""
                            }, stays.rating))), React.createElement("div", {
                      className: "font-light text-base text-[#717171] mt-[-0.1em]"
                    }, stays.distance + " kilometers away"), React.createElement("div", {
                      className: "flex flex-row gap-1  mt-[0.5rem] text-[0.9375rem]"
                    }, React.createElement("div", {
                          className: "font-semibold"
                        }, "₹ " + stays.price), React.createElement("div", {
                          className: ""
                        }, "night"))));
}

var make = Carousel;

export {
  make ,
  
}
/* react Not a pure module */
