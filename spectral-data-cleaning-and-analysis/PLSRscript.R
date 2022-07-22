

library(signal)
library(plyr)
library(pracma)
library(reshape2)
library(prospectr)

list.files()

data_spec <- read.csv("AllData4PLSRReflectance.csv")
TOC <- data_spec$TOC_percent
ids <- data_spec$ids
colnames(data_spec) <- gsub("X", "", colnames(data_spec))
rownames(data_spec) <- data_spec[,1]
data_spec <- data_spec[,-1:-2]

reflec <- (data_spec/100)
reflec_rev <- rev(reflec)
plot(seq(1,671,1), reflec_rev[5,], type = 'l')

absorbance_spec = log((1/reflec_rev))
plot(seq(1,671,1), absorbance_spec[4,], type = 'l')


#running the Saviskty Golay filter
spc_golay <- savitzkyGolay(absorbance_spec, m = 0, p = 2, w = 11)

plot(spc_golay[1,], type = 'l')

spc_golay_rev <- as.data.frame(spc_golay)

spec_matrix <- as.matrix(spc_golay_rev)

dat1 <- as.data.frame(TOC)
colnames(dat1) <- 'TOC'

dat1$spec <- spec_matrix 

## You dataframe dat1 has two columns, one is the TOC value and the second column has the whole spectra.

require(pls)

maxc <- 30

soilCPlsModel <- plsr(TOC ~ spec,
                      data = dat1,
                      method = "oscorespls",
                      ncomp = maxc,
                      validation = "CV")


soilCPlsModel

