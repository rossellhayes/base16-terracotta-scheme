library(colorspace)
library(dplyr)
library(imager)
library(magick)
library(scales)

# Pull brightest colors from an image
"path/to/file" %>%
	magick::image_read() %>%
	imager::magick2cimg() %>%
	imager::RGBtoHSV() %>%
	as.data.frame(wide = "c") %>%
	as_tibble() %>%
	mutate(
		hex = hsv(rescale(c.1, from = c(0, 360)), c.2, c.3),
		hue = c.1,
		sat = c.2,
		value = c.3
	) %>%
	count(hex, hue, sat, value, sort = TRUE) %>%
	arrange(desc(0.5 * value + 0.5 * sat))

colors <- c(
	"#8D3729",
	"#A65426",
	"#BD8423",
	"#667531",
	"#706B8A",
	"#493B5C",
	"#754050",
	"#9A5C41"
)

#Colors for light theme
stringr::str_to_lower(
	purrr::map_chr(colors, colorspace::lighten, 0.15)
)

# Bright colors
stringr::str_to_lower(
	purrr::map_chr(colors, colorspace::lighten, 0.35)
)

#Colors for dark theme
stringr::str_to_lower(
	purrr::map_chr(colors, colorspace::lighten, 0.5)
)
