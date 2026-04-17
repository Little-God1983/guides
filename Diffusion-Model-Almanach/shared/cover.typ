// Cover page template — uses the designed cover image
#let cover(edition: "") = {
  set page(margin: 0pt)
  image("../images/cover.jpg", width: 100%, height: 100%, fit: "cover")
}
