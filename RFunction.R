library(ctmm)
library(purrr)

rFunction = function(data) {

  s1 <- map2(data[[1]], data[[2]], ~ speed(.x, .y, units = FALSE, trace = FALSE))
  
  map(s1, ~ {
    if (.$DOF == 0) {
      "Speed estimate was not possible, not enough data points."
    } else {
      ci <- signif(.$CI, 4)
      paste0("Speed (m/s) ", ci[2], " (", ci[1], " - ", ci[3], ")")
    }
  })
  
  xx <- map(s1, ~ .x$CI)
  xx <- do.call(rbind, xx)
  xx |> as_tibble() |> 
    mutate(id = names(hr), unit = rownames(xx)) |> 
    select(id, unit, low, est, high) |> 
    write.csv(appArtifactPath("speed.csv"))
  
  duration <- map_dbl(data[[1]], ~ diff(range(.x$t)))
  
  xx <- map(s1, ~ .x$CI)
  xx <- do.call(rbind, xx)
  xx |> as_tibble() |> 
    mutate(id = names(hr), unit = rownames(xx)) |> 
    mutate(low = low * duration, est = est * duration, high = high * duration, unit = "distance (meters)") |> 
    select(id, unit, low, est, high) |> 
    write.csv(appArtifactPath("duration.csv"))
  
  return(data)
}
