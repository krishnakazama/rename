
# Get all FASTA files
fasta_files <- list.files(pattern = "\\.fasta$", full.names = TRUE)

# Read all files and combine into one DNAStringSet
all_sequences <- do.call(c, lapply(fasta_files, readDNAStringSet))

# Save as one combined FASTA file
writeXStringSet(all_sequences, "all_species_combined.fasta")

# Check results
cat("Total files merged:", length(fasta_files), "\n")
cat("Total sequences:", length(all_sequences), "\n")
