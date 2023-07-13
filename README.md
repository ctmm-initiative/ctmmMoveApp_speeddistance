# Estimate the average Speed and Distance of a tracked Animal from a fitted Continuous-Time Movement Model

MoveApps

Github repository: https://github.com/ctmm-initiative/ctmmMoveApp_speeddistance

## Description
This app estimates the average speed an animal moves. Once the speed is estimated it is then multiplied with the time the animal is tracked to get estimate of the distance that the animal moved, while it was tracked. 

## Documentation
This app can can be used in a ctmm-worklfow, once a continuous time model was estimated. For more details about the method, please refer to the accompanying publication (https://movementecologyjournal.biomedcentral.com/articles/10.1186/s40462-019-0177-1). 

### Input data
The app requires a *ctmm model with data* as input. 

### Output data
The app returns a *ctmm model with data* as output. 

### Artefacts

`speed.csv`: The estimated speed for each animal. The artefacts consists of five columns, which are: `est` the estimated speed with a lower (`low`) and upper (`high`) confidence interval, the units (`unit`) and `id` of the animal. 

`distance.csv`: The estimated distance travel for each animal. The artefacts consists of five columns, which are: `est` the estimated distance with a lower (`low`) and upper (`high`) confidence interval, the units (`unit`) and `id` of the animal. 


### Settings 
none

### Most common errors
Please make an issue [here](https://github.com/ctmm-initiative/ctmmMoveApp_speeddistance/issues) if you repeatedly encounter a specific error.

### Null or error handling
If the few data points are available, speed can not be estiamted and `NA` is returned. 
