#plotting differences
library(ggplot2)
library(grid)

setwd("/home/andresh/Documents/software/Javeriana")
# setwd("/Users/Andres/Documents/JAVERIANA/ScriptsPaper")
data = read.csv("./outputFile.csv", header = FALSE, sep='\t')
names(data) <- c('gluteoMedial', 'rectoFemoral', 'vastoLateral', 'gastrocnemioLateral', 'gastrocnemioMedial', 'goniometroSenal', 'goniometroRef', 'footSwitch', 'bwsLevel', 'speed', 'stridePhase', 'file')
data$footSwitch <- as.factor(data$footSwitch)
data$bwsLevel <- as.factor(data$bwsLevel)
data$speed <- as.factor(data$speed)
levels(data$speed)[levels(data$speed)=="1A"] <- 1
data$file <- as.factor(data$file)

#dataPhaseStance <- data[data$footSwitch %in% c(0), ]
#dataPhaseSwing <- data[data$footSwitch %in% c(1), ]

# bws 0 speed 1
bwsLevelFilter <- 30
filterTreshold <- 0.6

data2 <- data[data$bwsLevel %in% c(bwsLevelFilter), ]
data2 <- data2[data2$speed %in% c(1), ]
lastElement = length(data2$footSwitch) - 1

data2$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data2$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$gluteoMedial, spar = filterTreshold)$y
data2$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$rectoFemoral, spar = filterTreshold)$y
data2$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$vastoLateral, spar = filterTreshold)$y
data2$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$gastrocnemioLateral, spar = filterTreshold)$y
data2$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$gastrocnemioMedial, spar = filterTreshold)$y
data2$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$goniometroSenal, spar = filterTreshold)$y
data2$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data2$goniometroRef, spar = filterTreshold)$y

# bws 0 speed 2
data3 <- data[data$bwsLevel %in% c(bwsLevelFilter), ]
data3 <- data3[data3$speed %in% c(2), ]
lastElement = length(data3$footSwitch) - 1
data3$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data3$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$gluteoMedial, spar = filterTreshold)$y
data3$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$rectoFemoral, spar = filterTreshold)$y
data3$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$vastoLateral, spar = filterTreshold)$y
data3$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$gastrocnemioLateral, spar = filterTreshold)$y
data3$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$gastrocnemioMedial, spar = filterTreshold)$y
data3$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$goniometroSenal, spar = filterTreshold)$y
data3$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data3$goniometroRef, spar = filterTreshold)$y

# bws 0 speed 3
data4 <- data[data$bwsLevel %in% c(bwsLevelFilter), ]
data4 <- data4[data4$speed %in% c(3), ]
lastElement = length(data4$footSwitch) - 1
data4$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data4$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$gluteoMedial, spar = filterTreshold)$y
data4$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$rectoFemoral, spar = filterTreshold)$y
data4$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$vastoLateral, spar = filterTreshold)$y
data4$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$gastrocnemioLateral, spar = filterTreshold)$y
data4$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$gastrocnemioMedial, spar = filterTreshold)$y
data4$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$goniometroSenal, spar = filterTreshold)$y
data4$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data4$goniometroRef, spar = filterTreshold)$y

# bws 0 speed 4
data5 <- data[data$bwsLevel %in% c(bwsLevelFilter), ]
data5 <- data5[data5$speed %in% c(4), ]
lastElement = length(data5$footSwitch) - 1

data5$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data5$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$gluteoMedial, spar = filterTreshold)$y
data5$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$rectoFemoral, spar = filterTreshold)$y
data5$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$vastoLateral, spar = filterTreshold)$y
data5$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$gastrocnemioLateral, spar = filterTreshold)$y
data5$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$gastrocnemioMedial, spar = filterTreshold)$y
data5$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$goniometroSenal, spar = filterTreshold)$y
data5$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data5$goniometroRef, spar = filterTreshold)$y

dataCompiled <- rbind(data2, data3, data4, data5)
dataCompiled$BWSFilter <- c(bwsLevelFilter)

dataCompiledBws30 <- dataCompiled


lastElement <- length(dataCompiled$footSwitch) - 1

dataCompiledPhs1 <- dataCompiled[dataCompiled$stridePhase %in% c('loadingResponse'), ]
dataCompiledPhs2 <- dataCompiled[dataCompiled$stridePhase %in% c('midStance'), ]
dataCompiledPhs3 <- dataCompiled[dataCompiled$stridePhase %in% c('terminalStance'), ]
dataCompiledPhs4 <- dataCompiled[dataCompiled$stridePhase %in% c('preSwing'), ]
dataCompiledPhs5 <- dataCompiled[dataCompiled$stridePhase %in% c('initialSwing'), ]
dataCompiledPhs6 <- dataCompiled[dataCompiled$stridePhase %in% c('midSwing'), ]
dataCompiledPhs7 <- dataCompiled[dataCompiled$stridePhase %in% c('terminalSwing'), ]

dataPlot <- dataCompiledBws30
numberSamples <- 1000

#Speed1
dataSetTempSpd1 <- dataPlot[dataPlot$speed %in% c(1), ]
datasetSpd1 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetSpd1$smoothDataGM <- spline(dataSetTempSpd1$smoothDataGM, n = numberSamples)$y
datasetSpd1$smoothDataRF <- spline(dataSetTempSpd1$smoothDataRF, n = numberSamples)$y
datasetSpd1$smoothDataVL <- spline(dataSetTempSpd1$smoothDataVL, n = numberSamples)$y
datasetSpd1$smoothDataGSL <- spline(dataSetTempSpd1$smoothDataGSL, n = numberSamples)$y
datasetSpd1$smoothDataGSM <- spline(dataSetTempSpd1$smoothDataGSM, n = numberSamples)$y
datasetSpd1$smoothDataGOS <- spline(dataSetTempSpd1$smoothDataGOS, n = numberSamples)$y
datasetSpd1$speed <- c(1)

dataSetTempSpd2 <- dataPlot[dataPlot$speed %in% c(2), ]
datasetSpd2 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetSpd2$smoothDataGM <- spline(dataSetTempSpd2$smoothDataGM, n = numberSamples)$y
datasetSpd2$smoothDataRF <- spline(dataSetTempSpd2$smoothDataRF, n = numberSamples)$y
datasetSpd2$smoothDataVL <- spline(dataSetTempSpd2$smoothDataVL, n = numberSamples)$y
datasetSpd2$smoothDataGSL <- spline(dataSetTempSpd2$smoothDataGSL, n = numberSamples)$y
datasetSpd2$smoothDataGSM <- spline(dataSetTempSpd2$smoothDataGSM, n = numberSamples)$y
datasetSpd2$smoothDataGOS <- spline(dataSetTempSpd2$smoothDataGOS, n = numberSamples)$y
datasetSpd2$speed <- c(2)

dataSetTempSpd3 <- dataPlot[dataPlot$speed %in% c(3), ]
datasetSpd3 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetSpd3$smoothDataGM <- spline(dataSetTempSpd3$smoothDataGM, n = numberSamples)$y
datasetSpd3$smoothDataRF <- spline(dataSetTempSpd3$smoothDataRF, n = numberSamples)$y
datasetSpd3$smoothDataVL <- spline(dataSetTempSpd3$smoothDataVL, n = numberSamples)$y
datasetSpd3$smoothDataGSL <- spline(dataSetTempSpd3$smoothDataGSL, n = numberSamples)$y
datasetSpd3$smoothDataGSM <- spline(dataSetTempSpd3$smoothDataGSM, n = numberSamples)$y
datasetSpd3$smoothDataGOS <- spline(dataSetTempSpd3$smoothDataGOS, n = numberSamples)$y
datasetSpd3$speed <- c(3)

dataSetTempSpd4 <- dataPlot[dataPlot$speed %in% c(4), ]
datasetSpd4 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetSpd4$smoothDataGM <- spline(dataSetTempSpd4$smoothDataGM, n = numberSamples)$y
datasetSpd4$smoothDataRF <- spline(dataSetTempSpd4$smoothDataRF, n = numberSamples)$y
datasetSpd4$smoothDataVL <- spline(dataSetTempSpd4$smoothDataVL, n = numberSamples)$y
datasetSpd4$smoothDataGSL <- spline(dataSetTempSpd4$smoothDataGSL, n = numberSamples)$y
datasetSpd4$smoothDataGSM <- spline(dataSetTempSpd4$smoothDataGSM, n = numberSamples)$y
datasetSpd4$smoothDataGOS <- spline(dataSetTempSpd4$smoothDataGOS, n = numberSamples)$y
datasetSpd4$speed <- c(4)

dataPlot <- rbind(datasetSpd1, datasetSpd2, datasetSpd3, datasetSpd4)
dataPlot$speed <- as.factor(dataPlot$speed)
dataPlot$bwsLevel <- c(30)
dataPlot$bwsLevel <- as.factor(dataPlot$bwsLevel)

dataplotBWS30 <- dataPlot

dataPlot <- rbind(dataplotBWS0,dataplotBWS10, dataplotBWS20, dataplotBWS30)
maxSamplesGM <- max(abs(dataPlot$smoothDataGM))
maxSamplesRF <- max(abs(dataPlot$smoothDataRF))
maxSamplesVL <- max(abs(dataPlot$smoothDataVL))
maxSamplesGSL <- max(abs(dataPlot$smoothDataGSL))
maxSamplesGSM <- max(abs(dataPlot$smoothDataGSM))
maxSamplesGOS <- max(abs(dataPlot$smoothDataGOS))

my_palette <- colorRampPalette(c("black", "red", "#FFFF99"))(n = 4)
resultsPlotPrecision20 <- qplot(
                              x=dataPlot$rowName,
                              y=dataPlot$smoothDataGOS/maxSamplesGOS,
                              data=dataPlot, 
                              fill=dataPlot$speed,
                              colour=dataPlot$speed
                              ) 

# resultsPlotPrecision20 <-  resultsPlotPrecision20 +  geom_line(size=0.1)
resultsPlotPrecision20 <-  resultsPlotPrecision20 + geom_area(position = 'identity', alpha=0.2)
resultsPlotPrecision20 <-  resultsPlotPrecision20 + scale_fill_manual(values = my_palette, name="Walking Speed", labels=c("Speed 1", "Speed 2", "Speed 3", "Speed 4"))
resultsPlotPrecision20 <-  resultsPlotPrecision20 + scale_colour_manual(values =  my_palette, name="Walking Speed", labels=c("Speed 1", "Speed 2", "Speed 3", "Speed 4"))
resultsPlotPrecision20 <-  resultsPlotPrecision20 + xlab("Gait Cycle (%)") + ylab("Knee Angle (Normalized)")
resultsPlotPrecision20 <-  resultsPlotPrecision20 + theme (
  legend.position = "bottom",
  axis.text.x =   element_text(colour="grey70", size=15),
  axis.text.y =   element_text(colour="grey70", size=20),  
  axis.title.x =  element_text(colour="grey20", size=30),
  axis.title.y =  element_text(colour="grey20", size=30),
  strip.text.x =  element_text(colour="grey20", size=20), 
  legend.text =   element_text(colour="grey20", size=20),
  legend.title =  element_text(colour="grey20", size=28),
  legend.key.size = unit(0.5, "cm")
)
resultsPlotPrecision20 <- resultsPlotPrecision20 + facet_wrap(~ bwsLevel)
plot(resultsPlotPrecision20)

#--------------------------------------------------------------------------------------------------------------------------------------#
dataAnova <- dataCompiledPhs2

#Speed Phase loading Response
anova(lm(dataAnova$smoothDataGM ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataAnova$smoothDataRF ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataAnova$smoothDataVL ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataAnova$smoothDataGSL ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataAnova$smoothDataGSM ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataAnova$smoothDataGOS ~ dataAnova$speed, dataAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
TukeyHSD(aov(dataAnova$smoothDataGM ~  dataAnova$speed, data=dataAnova, conf.level=0.95))

#By Speed
speedLevelFilter <- 1

data6 <- data[data$speed %in% c(speedLevelFilter), ]
data6 <- data6[data6$bwsLevel %in% c(0), ]
lastElement = length(data6$footSwitch) - 1
data6$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data6$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$gluteoMedial, spar = filterTreshold)$y
data6$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$rectoFemoral, spar = filterTreshold)$y
data6$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$vastoLateral, spar = filterTreshold)$y
data6$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$gastrocnemioLateral, spar = filterTreshold)$y
data6$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$gastrocnemioMedial, spar = filterTreshold)$y
data6$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$goniometroSenal, spar = filterTreshold)$y
data6$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data6$goniometroRef, spar = filterTreshold)$y

data7 <- data[data$speed %in% c(speedLevelFilter), ]
data7 <- data7[data7$bwsLevel %in% c(10), ]
lastElement = length(data7$footSwitch) - 1
data7$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data7$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$gluteoMedial, spar = filterTreshold)$y
data7$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$rectoFemoral, spar = filterTreshold)$y
data7$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$vastoLateral, spar = filterTreshold)$y
data7$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$gastrocnemioLateral, spar = filterTreshold)$y
data7$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$gastrocnemioMedial, spar = filterTreshold)$y
data7$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$goniometroSenal, spar = filterTreshold)$y
data7$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data7$goniometroRef, spar = filterTreshold)$y

data8 <- data[data$speed %in% c(speedLevelFilter), ]
data8 <- data8[data8$bwsLevel %in% c(20), ]
lastElement = length(data8$footSwitch) - 1
data8$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data8$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$gluteoMedial, spar = filterTreshold)$y
data8$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$rectoFemoral, spar = filterTreshold)$y
data8$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$vastoLateral, spar = filterTreshold)$y
data8$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$gastrocnemioLateral, spar = filterTreshold)$y
data8$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$gastrocnemioMedial, spar = filterTreshold)$y
data8$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$goniometroSenal, spar = filterTreshold)$y
data8$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data8$goniometroRef, spar = filterTreshold)$y

data9 <- data[data$speed %in% c(speedLevelFilter), ]
data9 <- data9[data9$bwsLevel %in% c(30), ]
lastElement = length(data9$footSwitch) - 1
data9$rowNames <- sapply(X=0:lastElement, FUN=function(x) x )
data9$smoothDataGM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$gluteoMedial, spar = filterTreshold)$y
data9$smoothDataRF <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$rectoFemoral, spar = filterTreshold)$y
data9$smoothDataVL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$vastoLateral, spar = filterTreshold)$y
data9$smoothDataGSL <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$gastrocnemioLateral, spar = filterTreshold)$y
data9$smoothDataGSM <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$gastrocnemioMedial, spar = filterTreshold)$y
data9$smoothDataGOS <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$goniometroSenal, spar = filterTreshold)$y
data9$smoothDataGOR <- smooth.spline(sapply(X=0:lastElement, FUN=function(x) x ),data9$goniometroRef, spar = filterTreshold)$y

dataSpeedCompiled <- rbind(data6, data7, data8, data9)
lastElement <- length(dataSpeedCompiled$footSwitch) - 1

dataSpeedCompiledPhs1 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('loadingResponse'), ]
dataSpeedCompiledPhs2 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('midStance'), ]
dataSpeedCompiledPhs3 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('terminalStance'), ]
dataSpeedCompiledPhs4 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('preSwing'), ]
dataSpeedCompiledPhs5 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('initialSwing'), ]
dataSpeedCompiledPhs6 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('midSwing'), ]
dataSpeedCompiledPhs7 <- dataSpeedCompiled[dataSpeedCompiled$stridePhase %in% c('terminalSwing'), ]

dataSpeedAnova <- dataSpeedCompiled
# dataSpeedPlot <- rbind(dataSpeedCompiledPhs1,dataSpeedCompiledPhs2, dataSpeedCompiledPhs3)

dataSpeedPlot <- dataSpeedCompiled

dataSpeedPlot <- dataSpeedCompiled
numberSamples <- 1000

dataSetTempBws1 <- dataSpeedPlot[dataSpeedPlot$bwsLevel %in% c(0), ]
datasetBws1 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetBws1$smoothDataGM <- spline(dataSetTempBws1$smoothDataGM, n = numberSamples)$y
datasetBws1$smoothDataRF <- spline(dataSetTempBws1$smoothDataRF, n = numberSamples)$y
datasetBws1$smoothDataVL <- spline(dataSetTempBws1$smoothDataVL, n = numberSamples)$y
datasetBws1$smoothDataGSL <- spline(dataSetTempBws1$smoothDataGSL, n = numberSamples)$y
datasetBws1$smoothDataGSM <- spline(dataSetTempBws1$smoothDataGSM, n = numberSamples)$y
datasetBws1$smoothDataGOS <- spline(dataSetTempBws1$smoothDataGOS, n = numberSamples)$y
datasetBws1$bwsLevel <- c(0)

dataSetTempBws2 <- dataSpeedPlot[dataSpeedPlot$bwsLevel %in% c(10), ]
datasetBws2 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetBws2$smoothDataGM <- spline(dataSetTempBws2$smoothDataGM, n = numberSamples)$y
datasetBws2$smoothDataRF <- spline(dataSetTempBws2$smoothDataRF, n = numberSamples)$y
datasetBws2$smoothDataVL <- spline(dataSetTempBws2$smoothDataVL, n = numberSamples)$y
datasetBws2$smoothDataGSL <- spline(dataSetTempBws2$smoothDataGSL, n = numberSamples)$y
datasetBws2$smoothDataGSM <- spline(dataSetTempBws2$smoothDataGSM, n = numberSamples)$y
datasetBws2$smoothDataGOS <- spline(dataSetTempBws2$smoothDataGOS, n = numberSamples)$y
datasetBws2$bwsLevel <- c(10)

dataSetTempBws3 <- dataSpeedPlot[dataSpeedPlot$bwsLevel %in% c(20), ]
datasetBws3 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
datasetBws3$smoothDataGM <- spline(dataSetTempBws3$smoothDataGM, n = numberSamples)$y
datasetBws3$smoothDataRF <- spline(dataSetTempBws3$smoothDataRF, n = numberSamples)$y
datasetBws3$smoothDataVL <- spline(dataSetTempBws3$smoothDataVL, n = numberSamples)$y
datasetBws3$smoothDataGSL <- spline(dataSetTempBws3$smoothDataGSL, n = numberSamples)$y
datasetBws3$smoothDataGSM <- spline(dataSetTempBws3$smoothDataGSM, n = numberSamples)$y
datasetBws3$smoothDataGOS <- spline(dataSetTempBws3$smoothDataGOS, n = numberSamples)$y
datasetBws3$bwsLevel <- c(20)

dataSetTempBws4 <- dataSpeedPlot[dataSpeedPlot$bwsLevel %in% c(30), ]
dataSetBws4 <- data.frame(rowName=sapply(X=0:(numberSamples-1), FUN=function(x) x*0.1 )) 
dataSetBws4$smoothDataGM <- spline(dataSetTempBws4$smoothDataGM, n = numberSamples)$y
dataSetBws4$smoothDataRF <- spline(dataSetTempBws4$smoothDataRF, n = numberSamples)$y
dataSetBws4$smoothDataVL <- spline(dataSetTempBws4$smoothDataVL, n = numberSamples)$y
dataSetBws4$smoothDataGSL <- spline(dataSetTempBws4$smoothDataGSL, n = numberSamples)$y
dataSetBws4$smoothDataGSM <- spline(dataSetTempBws4$smoothDataGSM, n = numberSamples)$y
dataSetBws4$smoothDataGOS <- spline(dataSetTempBws4$smoothDataGOS, n = numberSamples)$y
dataSetBws4$bwsLevel <- c(30)

maxSamplesGM <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataGM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws2$smoothDataGM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws3$smoothDataGM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws4$smoothDataGM, n = numberSamples)$y))
  )


maxSamplesRF <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataRF, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws2$smoothDataRF, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws3$smoothDataRF, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws4$smoothDataRF, n = numberSamples)$y))
  )


maxSamplesVL <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataVL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws2$smoothDataVL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws3$smoothDataVL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws4$smoothDataVL, n = numberSamples)$y))
  )


maxSamplesGSL <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataGSL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempSpd2$smoothDataGSL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempSpd3$smoothDataGSL, n = numberSamples)$y)),
    max(abs(spline(dataSetTempSpd4$smoothDataGSL, n = numberSamples)$y))
  )


maxSamplesGSM <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataGSM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws2$smoothDataGSM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws3$smoothDataGSM, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws4$smoothDataGSM, n = numberSamples)$y))
  )


maxSamplesGOS <-
  max(
    max(abs(spline(dataSetTempBws1$smoothDataGOS, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws2$smoothDataGOS, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws3$smoothDataGOS, n = numberSamples)$y)),
    max(abs(spline(dataSetTempBws4$smoothDataGOS, n = numberSamples)$y))
  )

dataSpeedPlot <- rbind(datasetBws1, datasetBws2, datasetBws3, dataSetBws4)
dataSpeedPlot$bwsLevel <- as.factor(dataSpeedPlot$bwsLevel)

dataSpeedPlotSp1 <- dataSpeedPlot
dataSpeedPlotSp1$SpeedFilter <- c("1")

dataSpeedPlot <- rbind(dataSpeedPlotSp1, dataSpeedPlotSp2, dataSpeedPlotSp3, dataSpeedPlotSp4)
dataSpeedPlot$SpeedFilter <- as.factor(dataSpeedPlot$SpeedFilter)

my_palette <- colorRampPalette(c("yellow", "red", "black"))(n = 5)
resultsPlotPrecision30 <- qplot(
  x=dataSpeedPlot$rowName,
  y=dataSpeedPlot$smoothDataGOS/maxSamplesGOS,
  data=dataSpeedPlot, 
  fill=dataSpeedPlot$bwsLevel,
  colour=dataSpeedPlot$bwsLevel
) 

# resultsPlotPrecision20 <-  resultsPlotPrecision20 +  geom_line(size=0.1)
resultsPlotPrecision30 <-  resultsPlotPrecision30 + geom_area(position = 'identity', alpha=0.1)
resultsPlotPrecision30 <-  resultsPlotPrecision30 + scale_fill_manual(values = my_palette, name="BWS Level", labels=c("10%", "20%", "30%", "40%"))
resultsPlotPrecision30 <-  resultsPlotPrecision30 + scale_colour_manual(values =  my_palette, name="BWS Level", labels=c("10%", "20%", "30%", "40%"))
resultsPlotPrecision30 <-  resultsPlotPrecision30 + xlab("Gait Cycle (%)") + ylab("Knee Angle (Normalized)")
resultsPlotPrecision30 <-  resultsPlotPrecision30 + theme (
  legend.position = "bottom",
  axis.text.x =   element_text(colour="grey70", size=15),
  axis.text.y =   element_text(colour="grey70", size=20),  
  axis.title.x =  element_text(colour="grey20", size=30),
  axis.title.y =  element_text(colour="grey20", size=30),
  strip.text.x =  element_text(colour="grey20", size=20), 
  legend.text =   element_text(colour="grey20", size=20),
  legend.title =  element_text(colour="grey20", size=28),
  legend.key.size = unit(0.5, "cm")
)
resultsPlotPrecision30 <- resultsPlotPrecision30 + facet_wrap(~ SpeedFilter)
plot(resultsPlotPrecision30)

#Speed
anova(lm(dataSpeedAnova$smoothDataGM ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataSpeedAnova$smoothDataRF ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataSpeedAnova$smoothDataVL ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataSpeedAnova$smoothDataGSL ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataSpeedAnova$smoothDataGSM ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
anova(lm(dataSpeedAnova$smoothDataGOS ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 

anova(lm(dataSpeedAnova$smoothDataVL ~ dataSpeedAnova$bwsLevel, dataSpeedAnova)) #anova(lm(dependent variable ~ independent variable, data = dataframe) 
TukeyHSD(aov(dataSpeedAnova$smoothDataVL ~ dataSpeedAnova$bwsLevel, data=dataSpeedAnova, conf.level=0.95))
