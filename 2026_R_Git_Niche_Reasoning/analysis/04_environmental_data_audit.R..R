library(sf)
library(terra)
source("analysis/03_environmental_space_background.R")

env
names(env)
crs(env)
res(env)
ext(env)
global(env, c("min", "max", "mean"), na.rm = TRUE)



env_broad_lab4 <- mask(
  crop(env, vect(m_broad)),
  vect(m_broad)
)
png(
  "output/04_bio1_broad_M.png",
  width = 1800, height = 1400, res = 180
)
plot(env_broad_lab4[["bio1_c"]],
     main = "Annual mean temperature within broad M")
plot(vect(m_broad), add = TRUE, border = "firebrick3", lwd = 2)
points(vect(occ_sf), pch = 16, cex = 0.45)
dev.off()



occ_env_lab4 <- extract(env_broad_lab4, vect(occ_sf))
occ_env_lab4 <- cbind(
  occ[, c("record_id", "species",
          "decimalLongitude", "decimalLatitude")],
  occ_env_lab4[, c("bio1_c", "bio12_mm")])
head(occ_env_lab4)
summary(occ_env_lab4[, c("bio1_c", "bio12_mm")])
colSums(is.na(occ_env_lab4[, c("bio1_c", "bio12_mm")]))



precip_log10 <- log10(env_broad_lab4[["bio12_mm"]])
names(precip_log10) <- "bio12_log10"
occ_env_lab4$bio12_log10 <- log10(occ_env_lab4$bio12_mm)
hist(env_broad_lab4[["bio12_mm"]],
     main = "Annual precipitation", xlab = "mm")
hist(precip_log10,
     main = "Log10 annual precipitation", xlab = "log10(mm)")
write.csv(occ_env_lab4, "output/04_occurrence_environment_values.csv",
          row.names = FALSE)




env_coarse <- aggregate(env_broad_lab4, fact = 2, fun = mean)
res(env_broad_lab4)
res(env_coarse)
occ_env_coarse <- extract(env_coarse, vect(occ_sf))
resolution_comparison <- data.frame(
  record_id = occ$record_id,
  bio1_fine_c = occ_env_lab4$bio1_c,
  bio1_coarse_c = occ_env_coarse$bio1_c,
  bio12_fine_mm = occ_env_lab4$bio12_mm,
  bio12_coarse_mm = occ_env_coarse$bio12_mm
)
write.csv(resolution_comparison,
          "output/04_resolution_extraction_comparison.csv", row.names = FALSE)



env_coarse_resampled <- resample(
  env_coarse,
  env_broad_lab4,
  method = "bilinear"
)
res(env_coarse_resampled)

