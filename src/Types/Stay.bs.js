// Generated by ReScript, PLEASE EDIT WITH CARE

import * as LogicUtils$RescriptReactTemplate from "../Utilities/LogicUtils.bs.js";

function itemToObjectMapper(dict) {
  return {
          name: LogicUtils$RescriptReactTemplate.getString(dict, "name", ""),
          images: LogicUtils$RescriptReactTemplate.getStrArrayFromDict(dict, "images", []),
          rating: LogicUtils$RescriptReactTemplate.getString(dict, "rating", ""),
          distance: LogicUtils$RescriptReactTemplate.getString(dict, "distance", ""),
          price: LogicUtils$RescriptReactTemplate.getString(dict, "price", "")
        };
}

export {
  itemToObjectMapper ,
  
}
/* No side effect */
