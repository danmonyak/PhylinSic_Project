source('smoothing.R')

sample <- 'PCA_033_TUMOR'

repo <- '/hpc/group/ryserlab/scRNA-seq'
indir <- paste(repo, 'glmvc/site-analysis', paste(sample, '_inputs', sep=''), sep='/')

ALT_readCountMatrix <- read.csv(paste(indir, 'ALT_readCountMatrix.csv', sep='/'))
REF_readCountMatrix <- read.csv(paste(indir, 'REF_readCountMatrix.csv', sep='/'))

ALT_readCountMatrix <- ALT_readCountMatrix[, 2:ncol(ALT_readCountMatrix)]
REF_readCountMatrix <- REF_readCountMatrix[, 2:ncol(REF_readCountMatrix)]

ALT_readCountMatrix <- ALT_readCountMatrix[, 1:10]
REF_readCountMatrix <- REF_readCountMatrix[, 1:10]

make.genotype.and.probability.matrices(M.ref=REF_readCountMatrix, M.alt=ALT_readCountMatrix,
                                       DELTA=0, num.cores=4)
