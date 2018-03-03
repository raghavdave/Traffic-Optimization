library('nloptr')


a = round(rnorm(60,10,2))
b = round(rnorm(60,5,2))
c = round(rnorm(60,12,5))
d = round(rnorm(60,3,1))


init <- function(){
  traffic_outflow = 20
  traffic_outflow_rate = traffic_outflow/60
  stack = 0
  wait_time = 0
  total_cars = 0
}


#Optimized Function
opt_fun <- function(x){
  Y = calc_metric1(x[1]) + calc_metric2(x[2]) + calc_metric3(x[3]) + calc_metric4(x[4])
  return(Y)
}

#Constraint
eval_g0 <- function(x){
  return(x[1] + x[2] + x[3] + x[4] - 60)
}

nl.opts(list(xtol_rel = 1e-4,maxeval = 1000))

res <- nloptr(x0 = c(5,5,5,5),
              eval_f = opt_fun,
              lb = c(4,4,4,4),
              ub = c(45,45,45,45),
              opts=list(algorithm="NLOPT_GN_ISRES"),
              eval_g_eq = eval_g0
              )

a_secs2 = round((res$solution[1]/sum(res$solution))*60)
b_secs2 = round((res$solution[2]/sum(res$solution))*60)
c_secs2 = round((res$solution[3]/sum(res$solution))*60)
d_secs2 = round((res$solution[4]/sum(res$solution))*60)
print(paste(a_secs2,b_secs2,c_secs2,d_secs2, round(res$objective,2),sep = " "))
result1 = sum(calc_metric(a,a_secs2),calc_metric(b,b_secs2),calc_metric(c,c_secs2),calc_metric(d,d_secs2))

a_secs = 15
b_secs = 15
c_secs = 15
d_secs = 15

a_secs1 = (mean(a)/(mean(b) + mean(c) + mean(d) + mean(a)))*60
b_secs1 = (mean(b)/(mean(b) + mean(c) + mean(d) + mean(a)))*60
c_secs1 = (mean(c)/(mean(b) + mean(c) + mean(d) + mean(a)))*60
d_secs1 = (mean(d)/(mean(b) + mean(c) + mean(d) + mean(a)))*60

result = sum(calc_metric(a,a_secs),calc_metric(b,b_secs),calc_metric(c,c_secs),calc_metric(d,d_secs))
print(paste(round(a_secs),round(b_secs),round(c_secs),round(d_secs), round(result,2),sep = " "))

res1 = sum(calc_metric(a,a_secs1),calc_metric(b,b_secs1),calc_metric(c,c_secs1),calc_metric(d,d_secs1))
print(paste(round(a_secs1),round(b_secs1),round(c_secs1),round(d_secs1), round(res1,2),sep = " "))


