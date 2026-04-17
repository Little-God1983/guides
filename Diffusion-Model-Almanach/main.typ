// Diffusion Model Almanac — Main entry point

#import "shared/styles.typ": *
#import "shared/cover.typ": cover

// Cover page
#cover(edition: "")

// Apply styles to all content after cover
#show: almanac-styles

// Table of Contents
#outline(title: "Contents", indent: 1.5em, depth: 2)

// Preface (unnumbered)
#include "chapters/00-preface.typ"

// Chapters
#include "chapters/ch01-what-are-diffusion-models.typ"
#include "chapters/ch02-building-blocks.typ"
#include "chapters/ch03-model-landscape.typ"
#include "chapters/ch04-use-case-guide.typ"
#include "chapters/ch05-how-to-prompt.typ"
