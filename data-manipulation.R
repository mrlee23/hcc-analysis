hcc = read.csv('./datasets/hcc-data.csv');
attach(hcc)
available.data <- function (csv.data, withPrint = FALSE) {
    row.count = length(csv.data[,1])
    col.count = length(csv.data[1,])
    col.names = names(csv.data)
    data.counts = c()
    var.counts = c()
    for (missing.count in 1:row.count) {
        all.data = replace(c(1:row.count), c(1:row.count), TRUE)
        var.count = 0
        var.names = replace(c(1:col.count), c(1:col.count), NA)
        for (col.num in 1:col.count) {
            if (length(which(csv.data[col.num] == '?')) <= missing.count) {
                var.count = var.count + 1
                var.names[col.num] = col.names[col.num]
                na <- is.na(replace(c(1:row.count), csv.data[col.num] == '?', NA))
                all.data = replace(all.data, na, FALSE)
            }
        }
        if (withPrint) {
            print(paste('Missing count less than', missing.count))
            print(paste('instances: ', length(which(all.data == 1))))
            print(paste('variable count: ', var.count))
            print('variable names: ')
            print(var.names)
        }
        data.counts[missing.count] = c(length(which(all.data == 1)))
        var.counts[missing.count] = var.count
    }
    return(data.frame(missing = 1:row.count, instance = data.counts, variable = var.counts))
}
result = available.data(hcc)
png('plots/data-missing.png')
plot(x = result$instance, y = result$variable, xlab = 'instances', ylab = 'variables')
dev.off()

columns = c("Gender", "Symptoms", "Alcohol", "HBsAg", "HCVAb", "Cirrhosis", "Diabetes", "Obesity", "AHT", "CRI", "HIV", "Spleno", "PHT", "PVT", "Metastasis", "Hallmark", "Age", "PS", "Encephalopathy", "Ascites", "INR", "AFP", "Hemoglobin", "MCV", "Leucocytes", "Platelets", "Albumin", "Total.Bil", "ALT", "AST", "GGT", "ALP", "TP", "Creatinine", "Nodules", "Class")

drop.empty <- function (csv.data) {
    row.count = length(csv.data[,1])
    col.count = length(csv.data[1,])
    row.drop = c()
    result = csv.data
    for (col.num in 1:col.count) {
        for (row.num in which(csv.data[[col.num]] == '?')) {
            row.drop = c(row.drop, row.num)
            }
    }
    if (length(row.drop) > 0) {
        result = result[-row.drop,]
        rownames(result) <- 1:nrow(result)
    }
    return(result)
}
drop.empty(hcc[columns])
