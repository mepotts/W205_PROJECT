#import wget
import os
import csv
import xml.etree.ElementTree as ET

#filename=wget.download('https://s3.amazonaws.com/irs-form-990/201543089349301829_public.xml')
#print(filename)

csv_out = open('xmldata.csv', mode='w') #opens csv file
writer = csv.writer(csv_out) #create the csv writer object
fields = [] #field names
with open('xmltags.csv','r') as f:
    reader = csv.reader(f)
    for row in reader:
        fields.append(row[0])
        #print (row[0],':',tree.findtext('.//{http://www.irs.gov/efile}'+row[0]))
writer.writerow(fields) #writes field

dirname=os.getcwd()
for file in os.listdir(dirname):
    
    if file.endswith(".xml"):
        print(file)
        tree=ET.parse(dirname + "\\" + file)
        field_data=[]        
        for i in range(len(fields)):
            field_data.append(tree.findtext('.//{http://www.irs.gov/efile}'+fields[i]))

        writer.writerow(field_data)
csv_out.close() # closing the csv file