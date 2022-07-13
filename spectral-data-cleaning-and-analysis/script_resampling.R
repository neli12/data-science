library(spectrolab)

list.files()

dat1 <- read.csv("df_def.csv")

colnID <- dat1$Sample.ID
TOC <- dat1$X.TOC

dat2 <- dat1[,-1:-3]

colnames(dat2) <- seq(650, 4245, 1)

dat4 <- cbind(colnID, dat2)

dat1_matrix <- as.matrix(dat4)



spec = as_spectra(dat1_matrix, name_idx = 1)
spec = resample(spec, new_bands = seq(650, 4000, 5), parallel = FALSE)
  
spectral <- as.data.frame(spec$value)
waves <- spec$bands
colnames(spectral) <- waves
ids <- spec$names

data_spec <- cbind(ids, TOC, spectral)
write.csv(data_spec, 'data_owen_def.csv', sep = ',')
