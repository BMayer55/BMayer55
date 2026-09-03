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