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




    

    



