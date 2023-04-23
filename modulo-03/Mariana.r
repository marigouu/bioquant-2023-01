library(MASS)
View(crabs)
modelo <- lm(crabs$FL ~ crabs$sp + crabs$sex)
summary(modelo)
anova(modelo)
boxplot(crabs$FL ~ crabs$sp)
boxplot(crabs$FL ~ crabs$sex)
boxplot(crabs$FL ~ crabs$sp+crabs$sex)
anova2 <- aov(crabs$FL ~ crabs$sp+crabs$sex+crabs$sp:crabs$sex)
summary(anova2)
# A partir dos resultados da ANOVA é possível interpretar que a variância explicada pela 
# espécie (F = 48,6, p = 4.63e-11) é mais significativa que a variância explicada pela interação espécie-sexo,
# que também é significativa (F = 8,4, p = 0,004 < 0,05) na variância do tamanho do lobo frontal desses animais. 
# Já o sexo não é significativo, com p = 0,49 > 0,05. Como é possível observar no terceiro boxplot, 
# para a espécie B, a média do tamanho do lobo frontal é maior nos machos, já para a 
# espécie O, isso se inverte, e a média do tamnho do lobo frontal é maior nas fêmeas.
shapiro.test(crabs$FL)
# Premissa da normalidade OK
install.packages("lawstat")
library(lawstat)
levene.test(crabs$FL, group = crabs$sex)
levene.test(crabs$FL, group = crabs$sp)
# Premissa da homocedasticidade OK
