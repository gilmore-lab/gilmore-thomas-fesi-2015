moco_render_all <- function(all_stats= FALSE, plot_hires = FALSE, p_thresh = .0005, n_top = 9) {
# moco_render_all <- function(plot_hires = FALSE, p_thresh = .0005, n_top = 9)
# Renders all .Rmd files
  
  # Change dpi, plot_dev, and plot_titles depending on plot resolution
  if (plot_hires){
    dpi = 300
    plot_dev = 'quartz_tiff'
    plot_titles = FALSE
  } else {
    dpi = 72
    plot_dev = 'png'
    plot_titles = TRUE
  }
  
  if (all_stats) {
    myfn = "gilmore-thomas-fesi-2015-all-stats.Rmd"
  } else {
    myfn = "gilmore-thomas-fesi-2015-figs-only.Rmd"
  }
  
  # Create moco_render function
  moco_render <- function(fn=myfn, group="child", harmonic="1F1") {
    rmarkdown::render(fn, 
                      output_file=paste('html/', paste(group, harmonic, 'html', sep="."), sep=''),
                      params=list(group=group, 
                                  harmonic=harmonic, 
                                  dpi=dpi, 
                                  plot_dev=plot_dev, 
                                  p_thresh = p_thresh, 
                                  n_top = n_top,
                                  plot_titles = plot_titles)
    )
  }
  
  # Apply it to child and adult groups
  mapply(moco_render, group=list("child"), harmonic=list("1F1", "2F1", "3F1", "1F2"))
  mapply(moco_render, group=list("adult"), harmonic=list("1F1", "2F1", "3F1", "1F2"))
  
  # Print EGI channel figure, too
  rmarkdown::render("make-egi-channel-plot.Rmd", 
                    output_file = 'html/egi-channel-plot.html',
                    params = list(dpi=dpi, plot_dev=plot_dev))
}

