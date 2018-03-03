install.packages("rgl")
install.packages("network")
install.packages("sna")
library(rgl)
library(network)
library(sna) 
network <- read.csv("C:\\Users\\rpankajdave\\Desktop\\Firm Initiative\\Network\\Network.csv",header = F)
network <- as.matrix(network)
nodeInfo <- read.csv("C:\\Users\\rpankajdave\\Desktop\\Firm Initiative\\Network\\NodeInfo.csv",header = T,stringsAsFactors = F)

rownames(network) <- nodeInfo$Name
colnames(network) <- nodeInfo$Name


mynetwork <- network(network,directed=F)
network.vertex.names(mynetwork)
list.vertex.attributes(mynetwork)
help(network)
mynetwork%v%"Classification" <- nodeInfo$Classification
mynetwork%v%"Importance" <- nodeInfo$Importance

list.vertex.attributes(mynetwork)

summary(mynetwork)
network.dyadcount(mynetwork) # How many dyads in nflo?
network.edgecount(mynetwork) # How many edges are present?
network.size(mynetwork) # How large is the network?
as.sociomatrix(mynetwork) # Show it as a sociomatrix
plot(mynetwork,displaylabels=T) # Plot with names

nodeColors<-ifelse(nodeInfo$Importance=="High","red",ifelse(nodeInfo$Importance=="Medium","blue","yellow"))
textColors <-ifelse(nodeInfo$Classification=="Residential","white",ifelse(nodeInfo$Classification=="Business","green","brown"))
#plot
gplot3d(mynetwork,gmode="graph", displaylabels=TRUE,vertex.col=nodeColors,jitter = F,label.col = textColors,edge.col = "green",edge.alpha = 0.1,vertex.alpha = 0.3,edge.lwd = .3,bg.col = "black")



