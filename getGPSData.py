import re
import csv


f = open('history-Aug-3-Sep1.kml', 'r')
contents = f.read()


gps_raw = re.findall('<gx:coord>([\-0-9\., ]*)', contents)

gps = []

for coord in gps_raw:
    gps.append(coord.split(" ")[0:2])

writer = csv.writer(open('Aug3-Sep1_gps_coords.csv', 'w'))
for row in gps:
    writer.writerow(row)
