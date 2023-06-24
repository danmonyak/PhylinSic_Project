source('smoothing.R')

sample <- 'PCA_033_TUMOR'

repo <- '/hpc/group/ryserlab/scRNA-seq'
indir <- paste(repo, 'glmvc/site-analysis', paste(sample, '_inputs', sep=''), sep='/')

ALT_readCountMatrix = read.csv(paste(indir, 'ALT_readCountMatrix.csv', sep='/'))
REF_readCountMatrix = read.csv(paste(indir, 'REF_readCountMatrix', sep='/'))

make.genotype.and.probability.matrices(M.ref=REF_readCountMatrix, M.alt=ALT_readCountMatrix,
                                       DELTA=0, num.cores=4)
