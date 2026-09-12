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