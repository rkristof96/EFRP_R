#function for plotting
dyplot <- function(correl_data){
  dygraph(data=correl_data, main = "Cross-correlation") %>% 
    dyRangeSelector(fillColor = "grey")  %>%
    dyHighlight(highlightSeriesOpts = list(strokeWidth = 3), 
                highlightCircleSize = 4,
                highlightSeriesBackgroundAlpha = 0.75) %>% 
    dyLegend(show = "follow", hideOnMouseOut = T, width = 300,
             labelsSeparateLines= TRUE) %>% 
    dyAxis("y", label = "Cross-correlation of WTI", axisLabelFontSize=15,labelWidth=20, axisLabelWidth=40) %>% 
    dyAxis("x", label = "Date", axisLabelFontSize=20,labelWidth=30, axisLabelWidth=60)
}
