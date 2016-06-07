plot_t2_channel_effects_across <- function(df, harm, group, t2_type, topoplot_fullpath, plot_titles) {
  yquiet = scale_y_continuous("", breaks=NULL)
  xquiet = scale_x_continuous("", breaks=NULL)
  
  # Plot theme for channel topo
  pl_theme_topo <- theme(plot.title = element_text(lineheight=.8, 
                                                   face ="bold", 
                                                   vjust=2, 
                                                   size=rel(1.75)),
                         legend.title=element_text(size=0),
                         legend.text=element_text(size=rel(1)),
                         legend.position="bottom",
                         strip.text= element_text(size = rel(1.5))
                         )
  
  pl_title <- paste(init_cap(group), " Group:\nChannel-wise ", t2_type, " Effects for ", harm, sep="" )
  
  # Plot
  pl <- ggplot(data=df, aes(x=xpos, 
                            y=ypos, 
                            color=Pvals_cuts, 
                            size=Pvals_cuts)) +
    geom_point() +
    coord_fixed() + 
    xquiet + 
    yquiet +
    pl_theme_topo
  
  if (plot_titles) {
    pl + ggtitle(pl_title)
  } else {
    pl
  }
}
