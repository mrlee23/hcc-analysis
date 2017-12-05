hcc = read.csv('./datasets/hcc-data.csv');
attach(hcc)
## setwd
names(hcc)
columns = c("Gender", "Symptoms", "Alcohol", "HBsAg", "HCVAb", "Cirrhosis", "Diabetes", "Obesity", "AHT", "CRI", "HIV", "Spleno", "PHT", "PVT", "Metastasis", "Hallmark", "Age", "PS", "Encephalopathy", "Ascites", "INR", "AFP", "Hemoglobin", "MCV", "Leucocytes", "Platelets", "Albumin", "Total.Bil", "ALT", "AST", "GGT", "ALP", "TP", "Creatinine", "Nodules", "Class")
missed.rows = c()
