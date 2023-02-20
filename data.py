import math
import random
import json

trash = []

def getRandomRecipe():
    # Opens json file
    rf = open("recipe.json",)
    data = json.load(rf)  
    
    # Get number of values in list, sets rnum to a number corresponding
    # to a value in the list
    count = 0
    for i in data:
        count += 1
    
    loop = 0
    while True:
        rnum = math.floor((random.random() * 1000) % (count))
        temp = data[rnum]
        loop += 1
        if temp["key"] not in trash:
            trash.append(temp["key"])
            loop = 0
            break
        if loop >= count:
            return
    return data[rnum]    

def saveRecipe(recipe, key):
    # Opens json file
    rf = open("recipe.json", "r+")
    data = json.load(rf)
    
    # Get number of values in list, sets rnum to a number corresponding
    # to a value in the list
    count = 0
    for i in data:
        count += 1
    
    # Detector acts as boolean.
    # If a recipe with similar key in database:
    #    Detector = TRUE
    #        pass
    # If a recipe with similar key !in database:
    #    Detector = FALSE
    #        Add recipe into database
    detector = 0
    for i in range(count):
        temp = data[i]
        if temp["key"] == key:
            detector = 1
        else:
            pass
    if detector == 0:
        recipe["key"] = key
        data.append(recipe)
        with open('recipe.json', 'w') as f:
            json.dump(data, f, indent=4)
            
    rf.close()




    
        

    




    

    



