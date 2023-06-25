#Srividya Panchagnula , infs580 fall2022, due december 5th 2022

library(ggplot2)
library(grid)
library(plyr)

masterData <- read.csv("/Users/srividyapanchagnula/GMU/Master_data.csv")

str(masterData)
summary(masterData)
head(masterData) 
tail(masterData)

# sorts by number of users
userPlot <- ggplot(masterData, aes(x = reorder(masterData$Occupation, masterData$Occupation, function(x) -length(x)), 
                                   fill = masterData$Gender)) + geom_bar()
# fix axis
userPlot <- userPlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
userPlot <- userPlot + ylab("number of users rated") + xlab("genre")
# flip axis to make professions easier to read
userPlot <- userPlot + coord_flip()

gender_dat <- ddply(masterData, ~masterData$Occupation, summarize, perc_male = (length(masterData$Gender[masterData$Gender =="M"])/length(masterData$Gender)), counts = -length(masterData$UserID))

# sorts by number of users
genderPlot <- ggplot(gender_dat, aes(x = reorder(gender_dat$`masterData$Occupation`, counts), perc_male)) + 
  geom_bar(stat = "identity")
# fix axis
genderPlot <- genderPlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
genderPlot <- genderPlot + ylab("percent male") + xlab("occupation")
# flip axis to make professions easier to read
genderPlot <- genderPlot + coord_flip()

agePlot <- ggplot(masterData, aes(x = reorder(masterData$Occupation, masterData$Occupation, function(x) -length(x)), 
                                  masterData$Age)) + geom_violin()
# fix axis
agePlot <- agePlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
agePlot <- agePlot + ylab("age") + xlab("occupation")
# flip axis to make professions easier to read
agePlot <- agePlot + coord_flip()
# for plotting for age information
agePlot <- ggplot(masterData, aes(x = reorder(Occupation, Occupation, function(x) -length(x)), 
                                  Age)) + geom_violin()
# fix axis
agePlot <- agePlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
agePlot <- agePlot + ylab("age") + xlab("occupation")
# flip axis to make professions easier to read
agePlot <- agePlot + coord_flip()

# for plotting rating trends
rankPlot <- ggplot(masterData, aes(x = reorder(Occupation, Occupation, function(x) -length(x)), 
                                   mean(masterData$Rating))) + geom_violin()
# fix axis
rankPlot <- rankPlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
rankPlot <- rankPlot + ylab("Average rating on Movies") + xlab("occupation")
# flip axis to make professions easier to read
rankPlot <- rankPlot + coord_flip()

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 4)))
print(userPlot, vp = vplayout(1, 1))
print(genderPlot, vp = vplayout(1, 2))
print(agePlot, vp = vplayout(1, 3))
print(rankPlot, vp = vplayout(1, 4))
