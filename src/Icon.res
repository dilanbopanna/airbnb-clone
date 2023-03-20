@react.component
let make = (~name, ~size=20, ~width=size, ~className=?, ~iconType="app", ~onClick=?) => {
  let otherClasses = switch className {
  | Some(str) => str
  | None => ""
  }
  <svg
    ?onClick
    className={`fill-current ${otherClasses}`}
    width={string_of_int(width) ++ "px"}
    height={string_of_int(size) ++ "px"}>
    <use xlinkHref={`/icons/${iconType}.svg#${name}`} />
  </svg>
}
