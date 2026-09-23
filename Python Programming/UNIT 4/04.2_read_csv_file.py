import csv

file = open("students.csv", "r")
reader = csv.reader(file)

for row in reader:
    print("{:<15} {:<10} {:<10}".format(row[0], row[1], row[2]))

file.close()