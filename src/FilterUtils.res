type filter = {
  icon: React.element,
  name: string,
  type_: string,
}
let filters = [
  {
    icon: <img
      src="https://a0.muscache.com/pictures/d7445031-62c4-46d0-91c3-4f29f9790f7a.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Earth homes",
    type_: "earthhomes",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/4d4a4eba-c7e4-43eb-9ce2-95e1d200d10e.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Treehouses",
    type_: "treehouses",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/8e507f16-4943-4be9-b707-59bd38d56309.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Islands",
    type_: "islands",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/c8e2ed05-c666-47b6-99fc-4cb6edcde6b4.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Luxe",
    type_: "luxe",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/78ba8486-6ba6-4a43-a56d-f556189193da.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Mansions",
    type_: "mansions",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/1d477273-96d6-4819-9bda-9085f809dad3.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "A-frames",
    type_: "aframes",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/f0c5ca0f-5aa0-4fe5-b38d-654264bacddf.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Play",
    type_: "play",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/eb7ba4c0-ea38-4cbb-9db6-bdcc8baad585.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Private Rooms",
    type_: "privaterooms",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/aaa02c2d-9f0d-4c41-878a-68c12ec6c6bd.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Farms",
    type_: "farms",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/c5a4f6fc-c92c-4ae8-87dd-57f1ff1b89a6.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Omg",
    type_: "omg",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/3726d94b-534a-42b8-bca0-a0304d912260.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Trending",
    type_: "trending",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/6ad4bd95-f086-437d-97e3-14d12155ddfe.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Countryside",
    type_: "countryside",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/35919456-df89-4024-ad50-5fcb7a472df9.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Tiny homes",
    type_: "tinyhomes",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/a4634ca6-1407-4864-ab97-6e141967d782.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Lake",
    type_: "lake",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/50861fca-582c-4bcc-89d3-857fb7ca6528.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Design",
    type_: "design",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/3b1eb541-46d9-4bef-abc4-c37d77e3c21b.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Amazing views",
    type_: "amazingviews",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/ee9e2a40-ffac-4db9-9080-b351efc3cfc4.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Tropical",
    type_: "tropical",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/bcd1adc0-5cee-4d7a-85ec-f6730b0f8d0c.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Baechfront",
    type_: "beachfront",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/33dd714a-7b4a-4654-aaf0-f58ea887a688.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Historical homes",
    type_: "historicalhomes",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/3fb523a0-b622-4368-8142-b5e03df7549b.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Amazing pools",
    type_: "amazingpools",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/c0a24c04-ce1f-490c-833f-987613930eca.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "National parks",
    type_: "nationalparks",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/10ce1091-c854-40f3-a2fb-defc2995bcaf.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Beach",
    type_: "beach",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/732edad8-3ae0-49a8-a451-29a8010dcc0c.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Cabins",
    type_: "cabins",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/31c1d523-cc46-45b3-957a-da76c30c85f9.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Camper vans",
    type_: "campervans",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/8b44f770-7156-4c7b-b4d3-d92549c8652f.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Arctic",
    type_: "arctic",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/ca25c7f3-0d1f-432b-9efa-b9f5dc6d8770.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Camping",
    type_: "camping",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/677a041d-7264-4c45-bb72-52bff21eb6e8.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Lakefront",
    type_: "lakefront",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/6b639c8d-cf9b-41fb-91a0-91af9d7677cc.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Golfing",
    type_: "golfing",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/60ff02ae-d4a2-4d18-a120-0dd274a95925.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Vineyards",
    type_: "vineyards",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/51f5cf64-5821-400c-8033-8a10c7787d69.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Hanoks",
    type_: "hanoks",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/ed8b9e47-609b-44c2-9768-33e6a22eccb2.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "Iconic cities",
    type_: "iconiccities",
  },
  {
    icon: <img
      src="https://a0.muscache.com/pictures/c027ff1a-b89c-4331-ae04-f8dee1cdc287.jpg"
      alt=""
      width="24"
      height="24"
    />,
    name: "House boats",
    type_: "houseboats",
  },
]
