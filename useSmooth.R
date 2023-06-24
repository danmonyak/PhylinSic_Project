source('smoothing.R')

sample <- 'PCA_033_TUMOR'

repo <- '/hpc/group/ryserlab/scRNA-seq'
indir <- paste(repo, 'glmvc/site-analysis', paste(sample, '_inputs', sep=''), sep='/')

ALT_readCountMatrix <- read.csv(paste(indir, 'ALT_readCountMatrix.csv', sep='/'))
REF_readCountMatrix <- read.csv(paste(indir, 'REF_readCountMatrix.csv', sep='/'))

picked_sites <- ALT_readCountMatrix[, 1]
ALT_readCountMatrix <- ALT_readCountMatrix[, 2:ncol(ALT_readCountMatrix)]
REF_readCountMatrix <- REF_readCountMatrix[, 2:ncol(REF_readCountMatrix)]

ALT_readCountMatrix <- ALT_readCountMatrix[, 1:20]
REF_readCountMatrix <- REF_readCountMatrix[, 1:20]

res <- make.genotype.and.probability.matrices(M.ref=REF_readCountMatrix, M.alt=ALT_readCountMatrix,
                                       DELTA=0.5, num.cores=8)
genotypes <- as.data.frame(res[1])
names(genotypes) <- names(REF_readCountMatrix)
rownames(genotypes) <- picked_sites

write.csv(genotypes, paste(sample, 'smoothedGenotypes.csv', sep='-'), quote=FALSE)
