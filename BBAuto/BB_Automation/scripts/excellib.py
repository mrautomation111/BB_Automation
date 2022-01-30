import pandas as pd
import matplotlib.pyplot as plt

class excellib:

    def __init__(self):
        pass

    def openexcel(self,filename, sheetname):
        self.df=pd.read_excel(filename,sheet_name=sheetname)
        return self.df

    def filterbasedonkey(self,keycol,val):
        df=self.df
        self.f_data=df[df[keycol]==val]
        return self.f_data
    
    def Converttolist(self):
        df=self.f_data.values.tolist()
        self.listval=df
        return self.listval


        





# e=excellib()
# e.openexcel("studentsNamelist.xlsx","Sheet")
# e.filterbasedonkey("Name","Ola")
# print(e.Converttolist())
