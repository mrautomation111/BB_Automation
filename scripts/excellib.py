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

    def filterbasedonnumber(self,alphabet):
        df=self.df
        #f_data=df[df['Position']==alphabet]
        f_data=df[df['Position']==alphabet]
        self.f_rowdata=f_data[f_data['Position']==alphabet]
        #self.f_rowdata=df.loc[alphabet-1]
        return self.f_rowdata

    def converttolist(self):
        df=self.f_rowdata.values.tolist()
        self.listval=df
        return self.listval

e=excellib()
e.openexcel("I:\OLA_Robot_Framework\git_automation\BB_Automation\Testdata\PaymentsAndTransfers.xlsx", 'Maintain batch template' )
#print(e)
#e.filtervalue("name","ola")
e.filterbasedonnumber('b')
result = e.converttolist()
print(result[0][1])