# Colors ----
black_0_soft <- "#241d1a"
black_1_soft <- "#362b27"
black_2_soft <- "#473933"
black_3_soft <- "#594740"

black_0_hard <- "#241c19"
black_1_hard <- "#352a25"
black_2_hard <- "#473731"
black_3_hard <- "#59453d"

white_0_soft <- "#dcd2ce"
white_1_soft <- "#cabbb5"
white_2_soft <- "#b8a59d"
white_3_soft <- "#a78e84"

white_0_hard <- "#efeae8"
white_1_hard <- "#dfd6d1"
white_2_hard <- "#d0c1bb"
white_3_hard <- "#c0aca4"

red_light      <- "#e78c82"
red_bright     <- "#cb7268"
red_dark       <- "#a75045"

orange_light   <- "#f59c7a"
orange_bright  <- "#dd8662"
orange_dark    <- "#bd6942"

yellow_light   <- "#f7ba6e"
yellow_bright  <- "#e5aa5a"
yellow_dark    <- "#ce943e"

green_light    <- "#abbb7f"
green_bright   <- "#96a568"
green_dark     <- "#7a894a"

cyan_light     <- "#b5b1d0"
cyan_bright    <- "#a09bba"
cyan_dark      <- "#847f9e"

blue_light     <- "#a195b4"
blue_bright    <- "#857998"
blue_dark      <- "#625574"

purple_light   <- "#ca95a3"
purple_bright  <- "#af7b89"
purple_dark    <- "#8d5968"

magenta_light  <- "#e5a38c"
magenta_bright <- "#ce8d75"
magenta_dark   <- "#b07158"

# Build themes ----
library(yaml)

build_theme <- function(scheme, author, ...) {
	colors <- unlist(list(...))
	colors <- sub("#", "", colors)
	numbers <- as.raw(seq(from = 0, by = 1, length.out = length(colors)))
	names(colors) <- paste0("base", numbers)
	c(list(scheme = scheme, author = author), as.list(colors))
}

yaml::write_yaml(
	build_theme(
		scheme = "Terracotta",
		author = "Alexander Rossell Hayes (alexander@rossellhayes.com)",
		white_0_hard, white_1_hard, white_2_hard, white_3_hard,
		black_3_hard, black_2_hard, black_1_hard, black_0_hard,
		red_dark,
		orange_dark,
		yellow_dark,
		green_dark,
		cyan_dark,
		blue_dark,
		purple_dark,
		magenta_dark
	),
	"../terracotta.yaml"
)

yaml::write_yaml(
	build_theme(
		scheme = "Terracotta Dark",
		author = "Alexander Rossell Hayes (alexander@rossellhayes.com)",
		black_0_soft,
		black_1_soft,
		black_2_soft,
		black_3_soft,
		white_3_soft,
		white_2_soft,
		white_1_soft,
		white_0_soft,
		red_light,
		orange_light,
		yellow_light,
		green_light,
		cyan_light,
		blue_light,
		purple_light,
		magenta_light
	),
	"../terracotta-dark.yaml"
)
