// src/Test.res
@react.component
let make = () => {
  let (openProfile, setOpenProfile) = React.useState(_ => false)
  <div className="flex flex-col font-fig-tree">
    <NavBar openProfile setOpenProfile /> <Filters openProfile />
  </div>
}
