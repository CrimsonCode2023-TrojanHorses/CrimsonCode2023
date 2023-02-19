import math
import random
import json

def getRandomRecipe():
    rf = open("recipe.json",)
    data = json.load(rf)
    dataList = list(data)

    count = 0
    for i in dataList:
        count += 1
    rnum = math.floor((random.random() * 1000) % count)
    return dataList[rnum]

getRandomRecipe()
    

    



