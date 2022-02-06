import pandas as pd
import matplotlib.pyplot as plt

class excellib:

    def __init__(self):
        pass

    def openexcel(self,filename, sheetname):
        self.df=pd.read_excel(filename,sheet_name=sheetname,engine='openpyxl',)
        return self.df

    def filterbasedonkey(self,keycol,val):
        df=self.df
        self.f_data=df[df[keycol]==val]
        return self.f_data
    
    def filterbasedonpagenameandfieldname(self,pagecolname,fieldcolname):
        df=self.df
        f_data=df[df['pagename']==pagecolname]
        self.f_rowdata=f_data[f_data['fieldname']==fieldcolname]
        return self.f_rowdata


    def Converttolist(self):
        df=self.f_rowdata.values.tolist()
        self.listval=df
        return self.listval





        





# e=excellib()
# e.openexcel("C:\\Users\\Sivakumar U\\Desktop\\RobotTEST\\BBAuto\\BB_Automation\\Testdata\\Objectrepo\\objectrepo.xlsx","Sheet")
# # e.filterbasedonkey("Name","Ola")
# e.filterbasedonpagenameandfieldname('landingpage','loginlink')
# print(e.Converttolist())
