install.packages(c("sf", "ggplot2", "rnaturalearth", "rnaturalearthdata"))

library(sf)
library(ggplot2)
library(rnaturalearth)

source("analysis/01_occurrence_audit.R")
stopifnot(exists("occ_retained"))
nrow(occ_retained)

occ_raw_sf <- st_as_sf(
  occ_raw,
  coords = c("decimalLongitude", "decimalLatitude"),
  crs = 4326,
  remove = FALSE
)

occ_sf <- st_as_sf(
  occ_retained,
  coords = c("decimalLongitude", "decimalLatitude"),
  crs = 4326,
  remove = FALSE
)

head(st_coordinates(occ_sf))

st_crs(occ_sf)
st_geometry_type(occ_sf)
st_bbox(occ_sf)

plot(occ_sf["year"])
plot(st_geometry(occ_sf))

ggplot() +
  geom_sf(data = occ_sf,
  color = "black",
  size = 1.5
  )
ggplot() +
  geom_sf(
    data = occ_sf,
    aes(color = year),
    size = 1.5
  )

world <- ne_countries(
  scale = "medium",
  returnclass = "sf"
)
st_crs(world)

ggplot() +
  geom_sf(
    data = world, fill = "grey95",
    color = "grey70", linewidth = 0.2) +
  geom_sf(
    data = occ_sf, color = "red",
    size = 1.2, alpha = 0.7) +
  labs(title = "C. triseriatus occurrence records") +
  theme_minimal(base_size = 12)

ggplot() +
  geom_sf(data = world,
          fill = "grey95", color = "grey70", linewidth = 0.2) +
  geom_sf(data = occ_raw_sf, size = 1, alpha = 0.7, color = "red") +
  geom_sf(data = occ_sf, size = 1, alpha = 0.7, color = "blue3") +
  labs(title = "C. triseriatus occurrence records") +
  theme_minimal(base_size = 12)

map_output <- ggplot() +
  geom_sf(data = world, fill = "grey95",
          color = "grey70", linewidth = 0.2) +
  geom_sf(data = occ_raw_sf,
          color = "red", size = 1, alpha = 0.7) +
  geom_sf(data = occ_sf,
          color = "blue3", size = 1, alpha = 0.7) +
  labs(title = "C. triseriatus occurrence records") +
  theme_minimal(base_size = 12) + 
  labs(x = "Latitude") +
  labs(y = "Longitude")

bb <- st_bbox(occ_raw_sf)

x_pad <- max(0.25, 0.10 * (bb["xmax"] - bb["xmin"]))
y_pad <- max(0.25, 0.10 * (bb["ymax"] - bb["ymin"]))

map_output +
  coord_sf(
    xlim = c(bb["xmin"] - x_pad, bb["xmax"] + x_pad),
    ylim = c(bb["ymin"] - y_pad, bb["ymax"] + y_pad),
    expand = FALSE)

ggsave("output/occurrence_map_sf.png", plot = map_output, width = 7, height = 6, dpi =
         300)

st_crs(occ_sf)
st_coordinates(occ_sf)[1:5, ]

occ_projected <- st_transform(occ_sf, 32614)
st_crs(occ_projected)
st_coordinates(occ_projected)[1:5, ]
st_bbox(occ_projected)

st_coordinates(occ_sf)[1:5, ]

m_buffer <- st_buffer(occ_projected, dist = 100000)
m_area <- st_union(m_buffer)

ggplot() +
  geom_sf(data = world, fill = "grey95", color = "grey70") +
  geom_sf(data = st_transform(m_area, 4326), fill = "lightblue",
          color = "blue", alpha = 0.3) + geom_sf(data = occ_sf, color = "black") +
  coord_sf( xlim = c(bb["xmin"] - x_pad, bb["xmax"] + x_pad),
            ylim = c(bb["ymin"] - y_pad, bb["ymax"] + y_pad), expand = FALSE) +
  theme_minimal(base_size = 12)


#Problem 1

st_crs(occ_sf)
dim(occ_sf)
head(occ_sf)
st_geometry_type(occ_sf)
st_bbox(occ_sf)
st_coordinates(occ_sf)[1:5, ]
st_coordinates(occ_projected)[1:5, ]
#The crs is the coordinate reference system, it converts curved coordinate values like longitude and latitude into flat coordinates
#The original coordinates use long and lat to visualize the points and the projected coordinates use meters even though the geographic points are the same
#This way you can compare the raw distance between points using meters which is easier to understand than using raw coordinates

#Problem 2
#I modified the map by adding axis titles on the x and y.
#I added them because even though the coordinates are visible, it is still standard to have axis titles.
#I wanted to add a legend showing the raw data being red and the retained data as blue but I couldn't figure it out.

#Problem 3
m_buffer <- st_buffer(occ_projected, dist = 50000)
m_area <- st_union(m_buffer)


