library(glmnet)
load("features.Rdata")
load("sparcs_model.Rdata")
predict.cost <- function(user_sel)
{
    # indices <- c()
    feature_vec <- rep(0, length(feature_names))
    for(i in 1:length(user_sel)) 
    {
        #index <- pmatch(user_sel[i], feature_names)
        if(i == 2) {
            if(user_sel[i] == 'M') {
                index <- 6
            }
            else if(user_sel[i] == 'U') {
                index <- 7
            }
            
        }
        else {
            index <- grep(user_sel[i], feature_names)
        }
        
        if(length(index) > 0) {
            feature_vec[index] <- 1
        }
    }
    names(feature_vec) <- feature_names
    #print(length(feature_vec))
    #print(t(as.matrix(feature_vec)))
    pred <- predict(fit, t(as.matrix(feature_vec)), s=373)
    return(pred)
}