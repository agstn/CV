# ```{r fig.align='left'}
# remotes::install_github("JohnCoene/echarts4r.assets")
pacman::p_load(echarts4r, echarts4r.assets)
pacman::p_load(airportr)

# data
eze <- airport_detail("EZE") 
mrs <- airport_detail("MRS")
cdg <- airport_detail("CDG")
rdu <- airport_detail("RDU")
dtw <- airport_detail("DTW")
san <- airport_detail("SAN")

flights <- tribble(
   ~start_lat,    ~start_lon,     ~end_lat,      ~end_lon, ~airline,  ~airport1,  ~airport2,  ~cnt,
   eze$Latitude, eze$Longitude, mrs$Latitude, mrs$Longitude,   "AA",    eze$IATA,  mrs$IATA,  1,
   cdg$Latitude, cdg$Longitude, rdu$Latitude, rdu$Longitude,   "AA",    cdg$IATA,  rdu$IATA,  1,
   rdu$Latitude, rdu$Longitude, dtw$Latitude, dtw$Longitude,   "AA",    rdu$IATA,  dtw$IATA,  1,
   dtw$Latitude, dtw$Longitude, rdu$Latitude, rdu$Longitude,   "AA",    dtw$IATA,  rdu$IATA,  1,
   rdu$Latitude, rdu$Longitude, san$Latitude, san$Longitude,   "AA",    rdu$IATA,  san$IATA,  1)

# plot
flights %>% 
   e_charts(height = '150%',
            width  = '150%',
            render = 'svg') %>%
   e_globe(
      base_texture = ea_asset("world"),
      globeOuterRadius = 100,
      shading = 'color'
   ) %>% 
   e_lines_3d(
      start_lon, 
      start_lat, 
      end_lon, 
      end_lat,
      name = "flights",
      lineStyle = list(color = 'black',
                       width = 2),
      effect = list(show = TRUE)
   ) %>% 
   e_legend(FALSE)


pacman::p_load(tidyverse)
pacman::p_load(htmlwidgets, sparkline)

ypc <- tribble (
   ~year, ~publications, ~ citations,
   2005, NA,  NA,
   2006,  5,  NA,
   2007,  1,  NA,
   2008,  0,  NA,
   2009,  7,  28, 
   2010,  5,  99,
   2011,  5,  191,
   2012,  3,  277,
   2013,  4,  313,
   2014,  3,  373,
   2015,  4,  453,
   2016,  4,  582,
   2017, 11,  594,
   2018,  7,  653,
   2019,  8,  795,
   2020,  6,  688)


sparkline(0)
sparkline(rnorm(10))
sparkline(ypc$citations)
sparkline(ypc$publications, type = "bar")

pacman::p_load(htmlwidgets, sparkline)

# 05
c(NA, 5, 1, 0, 7, 5, 5, 3, 4, 3, 4, 4, 11, 7, 8, 6) %>% 
   sparkline(type = "bar")

# 05
c(NA, NA, NA, NA, 28, 99, 191, 277, 313, 373, 453, 582, 594, 653, 795, 688) %>% 
   sparkline()



   
   ## Publications
   
   ###
   pacman::p_load(htmlwidgets, sparkline)

# 05
c(NA, 5, 1, 0, 7, 5, 5, 3, 4, 3, 4, 4, 11, 7, 8, 6) %>% 
   sparkline(type = "bar")

# 05
c(NA, NA, NA, NA, 28, 99, 191, 277, 313, 373, 453, 582, 594, 653, 795, 688) %>% 
   sparkline()

tribble (
   ~year, ~publications, ~ citations,
   2005, NA,  NA,
   2006,  5,  NA,
   2007,  1,  NA,
   2008,  0,  NA,
   2009,  7,  28, 
   2010,  5,  99,
   2011,  5,  191,
   2012,  3,  277,
   2013,  4,  313,
   2014,  3,  373,
   2015,  4,  453,
   2016,  4,  582,
   2017, 11,  594,
   2018,  7,  653,
   2019,  8,  795,
   2020,  6,  688) %>% 
   e_chart(year, range = c(2000, 2020)) %>%
   e_scatter(citations)

# 
# pacman::p_load(echarts4r)
# pacman::p_load(tidyverse)
# 
# ypc <- tribble (
#    ~Year, ~Publications, ~ Citations,
#    2005, NA,  NA,
#    2006,  5,  NA,
#    2007,  1,  NA,
#    2008,  0,  NA,
#    2009,  7,  28, 
#    2010,  5,  99,
#    2011,  5,  191,
#    2012,  3,  277,
#    2013,  4,  313,
#    2014,  3,  373,
#    2015,  4,  453,
#    2016,  4,  582,
#    2017, 11,  594,
#    2018,  7,  653,
#    2019,  8,  795,
#    2020,  6,  688) 
# 
# ypc %>% 
#    mutate(Year = as.factor(Year)) %>% 
#    e_charts(Year,
#             width = '200px',
#             height = '300px') %>% 
#    e_bar(Publications,
#          color = '#9ecae1') %>%
#    e_line(Citations, 
#           color = '#fa9fb5',
#           y_index = 1) %>% 
#    e_legend(FALSE) %>%
#    e_mark_point(data = list(name = "Max",
#                             type = "max")                
#    ) %>%
#    e_x_axis(show = FALSE) %>%
#    e_y_axis(splitLine = list(show = FALSE)) %>%
#    e_tooltip(trigger = "axis",
#              left = TRUE)
