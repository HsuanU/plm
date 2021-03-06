#### Testfile to see the attr(vcov, which="cluster") for various vcovXX methods
#
# see also testfile tests/test_pwaldtest.R for general tests of the F test and Chisq test

options(scipen = 999)
options(digits = 8)
library(plm)
data("Grunfeld", package="plm")
gp <- plm(inv ~ value + capital, data = Grunfeld, model = "pooling")
gi <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "individual", model = "within")
gt <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "time", model = "within")
gd <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "twoways", model = "within")

# vcovHC
print(attr(vcovHC(gi), which="cluster"))                     # group - default
print(attr(vcovHC(gi, cluster="group"), which="cluster"))    # group
print(attr(vcovHC(gi, cluster="time"), which="cluster"))     # time

# vcovBK
print(attr(vcovBK(gi), which="cluster"))                    # group - default
print(attr(vcovBK(gi, cluster="group"), which="cluster"))   # group
print(attr(vcovBK(gi, cluster="time"), which="cluster"))    # time

# vcovSCC
print(attr(vcovSCC(gi), which="cluster"))                    # time - default and should be the only option for SCC
print(attr(vcovSCC(gi, cluster="group"), which="cluster"))   # group
print(attr(vcovSCC(gi, cluster="time"), which="cluster"))    # time

# vcovNW
print(attr(vcovNW(gi), which="cluster"))                    # time - default and should be the only option for NW
print(attr(vcovNW(gi, cluster="group"), which="cluster"))   # group
print(attr(vcovNW(gi, cluster="time"), which="cluster"))    # time

# vcovDC
print(attr(vcovDC(gi), which="cluster"))                    # group-time - nothing else possible


# pooling model F test - robust - function
plm::pwaldtest(gp, test = "F", vcov = vcovHC)
plm::pwaldtest(gp, test = "F", vcov = vcovBK)
plm::pwaldtest(gp, test = "F", vcov = vcovSCC)
plm::pwaldtest(gp, test = "F", vcov = vcovNW)
plm::pwaldtest(gp, test = "F", vcov = vcovDC) # no finite-sample adj. for df2 done, because not yet clear how to handle "group-time" clustering

# within model individual F test - robust - function
plm::pwaldtest(gi, test = "F", vcov = vcovHC)
plm::pwaldtest(gi, test = "F", vcov = vcovBK)
plm::pwaldtest(gi, test = "F", vcov = vcovSCC)
plm::pwaldtest(gi, test = "F", vcov = vcovNW)
plm::pwaldtest(gi, test = "F", vcov = vcovDC) # no finite-sample adj. for df2 done, because not yet clear how to handle "group-time" clustering

# within model time F test - robust - function
plm::pwaldtest(gt, test = "F", vcov = vcovHC)
plm::pwaldtest(gt, test = "F", vcov = vcovBK)
plm::pwaldtest(gt, test = "F", vcov = vcovSCC)
plm::pwaldtest(gt, test = "F", vcov = vcovNW)
plm::pwaldtest(gt, test = "F", vcov = vcovDC) # no finite-sample adj. for df2 done, because not yet clear how to handle "group-time" clustering

# within model twoways F test - robust - function
plm::pwaldtest(gd, test = "F", vcov = vcovHC)
plm::pwaldtest(gd, test = "F", vcov = vcovBK)
plm::pwaldtest(gd, test = "F", vcov = vcovSCC)
plm::pwaldtest(gd, test = "F", vcov = vcovNW)
plm::pwaldtest(gd, test = "F", vcov = vcovDC) # no finite-sample adj. for df2 done, because not yet clear how to handle "group-time" clustering

# pooling model Chisq - robust - function
plm::pwaldtest(gp, test = "Chisq", vcov = vcovHC)
plm::pwaldtest(gp, test = "Chisq", vcov = vcovBK)
plm::pwaldtest(gp, test = "Chisq", vcov = vcovSCC)
plm::pwaldtest(gp, test = "Chisq", vcov = vcovNW)
plm::pwaldtest(gp, test = "Chisq", vcov = vcovDC) # finite-sample adj. for df2 irrelevant b/c Chisq test

# within model individual Chisq - robust - function
plm::pwaldtest(gi, test = "Chisq", vcov = vcovHC)
plm::pwaldtest(gi, test = "Chisq", vcov = vcovBK)
plm::pwaldtest(gi, test = "Chisq", vcov = vcovSCC)
plm::pwaldtest(gi, test = "Chisq", vcov = vcovNW)
plm::pwaldtest(gi, test = "Chisq", vcov = vcovDC) # finite-sample adj. for df2 irrelevant b/c Chisq test

# within model time Chisq - robust - function
plm::pwaldtest(gt, test = "Chisq", vcov = vcovHC)
plm::pwaldtest(gt, test = "Chisq", vcov = vcovBK)
plm::pwaldtest(gt, test = "Chisq", vcov = vcovSCC)
plm::pwaldtest(gt, test = "Chisq", vcov = vcovNW)
plm::pwaldtest(gt, test = "Chisq", vcov = vcovDC) # finite-sample adj. for df2 irrelevant b/c Chisq test

# within model twoways Chisq - robust - function
plm::pwaldtest(gd, test = "Chisq", vcov = vcovHC)
plm::pwaldtest(gd, test = "Chisq", vcov = vcovBK)
plm::pwaldtest(gd, test = "Chisq", vcov = vcovSCC)
plm::pwaldtest(gd, test = "Chisq", vcov = vcovNW)
plm::pwaldtest(gd, test = "Chisq", vcov = vcovDC) # finite-sample adj. for df2 irrelevant b/c Chisq test



