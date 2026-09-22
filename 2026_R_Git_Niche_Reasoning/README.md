# Occurrence-data audit: Crotalus triseriatus

**Student:** Billy Mayer  
**Course:** ECCB 689  
**Date:** August 28, 2026  

## Question and data

What ecological question can occurrence data help address? Briefly describe
the course-provided GBIF occurrence dataset.

#Occurrence data can identify the geographic range of a species. Plotting
#occurrence data on a map may reveal patterns of dispersal. 
#The provided dataset includes occurence data of a rattlesnake from mostly preserved specimens.


## Quality-control decisions

Describe your two rules. For each rule, explain:
- what concern it addresses;
- how many records it changed;
- the spatial/temporal scale where it makes sense; and
- one way it could remove a valid record.

#My first rule included coordinates only from tropical Mexico
#I thought maybe the rattlesnake might be restricted to tropical climates within Mexico. In hidnsight this was not great since pretty much all of Mexico is tropical.
#It excluded 32 records and kept 682
#It probably removed some valid records since I used the coordinates of the tropic of cancer and capricorn rather than coordinates from an actual climate map

#My second rule included records only obtained after 2000
#My reasoning was simply that older records might be innacurate.
#It excluded 430 records and kept 284
#It probably removed some valuable records since older ones such as museum specimens may have pretty good details of when and where they were found.



## What the map supports—and what it does not

Explain what the retained point cloud represents. Explain why it is not,
by itself, an estimate of the niche or a geographic-distribution model.

#My retained point cloud represents recent occurrence data of Crotalus triseriatus in the tropics of Mexico.
#It only includes observation data and not environmental barriers or restrictions that would limit the realized niche.

## Next analysis decisions

Name two environmental predictors you would obtain next and explain why. 
Explain what limiting process influences species to not occur an environmentally 
favorable place.

#I would probably restrict my coordinates with better justification since my first rule didn't exclude much.
#I would be interested in average rainfall and temperature to get a better gauge of the climate rather than relying on a map to do so.
#Species may be outcompeted in areas where they would have survived otherwise, including human disturbance.

## AI acknowledgement, if applicable

Briefly state any AI use for debugging, code clarification, or writing support.

#I did use Chatgpt to help me with understanding what some functions do as well as figuring out which coordinates to use, but all the coding is mine.


LAB 2
#Problem 2
#I modified the map by adding axis titles. I went the route of making it more presentable rather than honing the figure.

#Problem 3
#I reduced the M distance down to 50km rather than 100km. My reasoning was that snakes typically don't travel great distances so the movement area should probably be smaller than 100km.
#The distance buffer may not represent the true M distance since there is no data on barriers to dispersal being represented. Those may be geographic barriers or human disturbance which create fragments area that could actually be travelled.
#We also don't have data on the behavior of this species. If we knew their daily distance traveled or mating behaviors than we could infer a better distance buffer.

#Problem 4
#For "A" I would choose temperature. Given snakes are ectotherms, they are restricted to hotter climates in general. Their abiotically suitable area would have to be partly calculated by climate data like temperature.
#For "B" I would add occurrence data of their most eaten prey. I'm assuming they eat a variety of prey but there is probaly a staple species that takes up a large portion of their diet. They may be able to live in certain areas but without the proper prey they can't survive there.
#Neither map identifies A or B since we only defined M using the distance buffer.


LAB 3
# 1. Describe the environmental layers, including units, spatial extent, and spatial grain.
# We used climate data from WorldClim for the envrionmental layers. Those include the min, max, and mean for temperature in Celsius and rainfall in mm.
# SpatExtent : -118, -86, 14, 47 (xmin, xmax, ymin, ymax) The plot covers most of Central and North America exluding the northernmost parts. 10-arc minute (or 18.5km) was the resolution size for the E-space.

#2. What does a background point represent? Why is it not an absence?
#background points are random points chosen to represent the envrionment where a species could be. They are not true absences because the species may exist there but have not been observed or are not able to occupy the space for some reason.


# 3. Which broad-M distance did you select, and what biological assumption does it represent?
#I chose to decrease the broad-M to 150km. I chose a smaller broad distance because snakes have small bodies and probably do not travel very far. If I were using data from migratory herbivores I would likely use a much bigger broad-M distance.


# 4. How did changing M alter the sampled environmental space?
#after I changed M to 150 from 250km the boundary lines shrunk. In the 250km plot there are areas with seemingly no E-data, there is just white space within the broad M-buffer. I think the 150km plot fits the occurrence points better as there is no white space but I'm still not super confident on interpreting the plot.


# 5. Which interpretation is stable, conditional, or unstable, and what additional assumption would you test next?
#Mean precipitation decreases as the M-distance increases. Occurrences are found in spaces with higher precipitation. This is stable with both plots, the mean precipitation of the 50km plot is 800mm and the 150km plot is 776mm, which are both smaller than the occurrence mean which is 975mm. This means occurrences are concentrated in areas with high precipitation. And defining a larger M-distance will introduce more E-data where the precipitation is lower. I would play around with making M bigger and smaller to see if the pattern persists.