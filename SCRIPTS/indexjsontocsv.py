## this script converts json to csv file.

import csv
import json
data_json = open('index.json', mode='r').read() #reads in the JSON file into Python as a string
data_python = json.loads(data_json) #turns the string into a json Python object

ct=0
tt=0
csv_out = open('index_'+str(tt)+'.csv', mode='w') #opens csv file
writer = csv.writer(csv_out) #create the csv writer object
fields = ['EIN','TaxPeriod','FormType','URL','OrganizationName'] #field names
writer.writerow(fields) #writes field

for i in range(len(data_python['AllFilings'])):
#for i in range(0,100):
	zz=data_python['AllFilings'][i]
	writer.writerow([zz.get('EIN'),zz.get('TaxPeriod'),zz.get('FormType'),zz.get('URL'),zz.get('OrganizationName')]) # writes each row in the csv file
	ct=ct+1
	if ct>300000:
		csv_out.close() # closing the csv file
		ct=0
		tt=tt+1
		csv_out = open('index_'+str(tt)+'.csv', mode='w') #opens csv file
		writer = csv.writer(csv_out) #create the csv writer object
		fields = ['EIN','TaxPeriod','FormType','URL','OrganizationName'] #field names
		writer.writerow(fields) #writes field
    
csv_out.close() # closing the csv file

print("Number of rows = ",i+1)
