# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 20:41:35 2019

@author: Mahmoud
"""

import os
#import numpy as np
import pandas as pd

#1 : 322+1
def pollutantmean(directory, pollutant, id=range(1,333)):
    # create the path of the directory
    path = "{}\\{}".format(os.getcwd(), directory)
    
    # create data frame df the will contain all the data according to the given id-s
    df = pd.DataFrame([])
    print(type(df))
    for i in id:
        if i < 10:
            data = pd.read_csv("{}\\00{}.csv".format(path, str(i)))
#            print("debugg <10")
            df = pd.concat([df, data])
#            print(df.dropna())
        elif 10 < i < 100:
            data = pd.read_csv("{}\\0{}.csv".format(path, str(i)))
#            print("debugg 10 < i < 100")
            df = pd.concat([df, data])
        else:
            data = pd.read_csv("{}\\{}.csv".format(path, str(i)))
#            print("debugg ELSE")
            df = pd.concat([df, data])
        
        df = df.dropna(inplace=True)
#    return(df[pollutant].mean())
    return(df.head())