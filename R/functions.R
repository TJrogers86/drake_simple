doubling <- function(x) {
	return(x*2)
}

is_even <- function(phy) {
	number_of_tips <- ape::Ntip(phy)
	even <- FALSE
	if(number_of_tips%%2==0) {
		even <- TRUE
	}
	return(even)
}

plot_tree <- function(phy, file) {
  pdf(file=file, width=20, height=20)
  plot(phy)
  plot(phy, type="fan")
  plot(phy, type="fan", show.tip.label=FALSE, edge.width=0.1)
  dev.off()
}