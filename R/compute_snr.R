compute_SNR <- function(chan, df, harm, bysubject=TRUE) {
  require(dplyr)
  require(tidyr)
  
  # If bysubject then group by sub
  if (bysubject) {
    df <- df %>%
      filter(Channel == chan, Harm == harm) %>%
      group_by(iSess) %>%
      summarise(gmSNR = geom.mean(SNR))
    df <- df %>%
      summarise(mSNR = geom.mean(gmSNR))
  } else { 
    df <- df %>%
      filter(Channel == chan, Harm == harm) %>%
      summarise(mSNR = geom.mean(SNR))       
  }
  df
}