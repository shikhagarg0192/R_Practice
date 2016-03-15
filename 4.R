x <- c(8.2, 9.4, 9.6, 9.7, 10.0, 14.5, 15.2, 16.1, 17.6, 21.5)
y <- c(4.2, 5.2, 5.8, 6.4, 7.0, 7.3, 10.1, 11.2, 11.3, 11.5)
# A Wilcoxon rank sum test:
wilcox.test(x, y)

hist(x)

hist(y)
wilcox.test(x, y, alternative = "less", exact = FALSE,
            correct = FALSE, conf.int = TRUE, conf.level = 0.9)
wilcox.test(x)
wilcox.test(x, y, paired = TRUE)
wilcox.test(x, y, alternative = "greater", exact = FALSE,
            mu = 0.01, paired = TRUE, correct = FALSE, conf.int = TRUE)


