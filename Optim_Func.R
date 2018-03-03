calc_metric <- function(data,time){
  init()
  for(i in 1:length(data)){
    dat = data
    total_cars = total_cars + dat[i]
    inflow = dat[i]
    outflow = round(a_secs*traffic_outflow_rate)
    if(inflow>outflow){
      stack = stack + inflow - outflow
      wait_time = wait_time + stack*(60 - time)/60
    }
    wait_time_car = wait_time/total_cars
    
  }
  return(wait_time_car)
}


calc_metric1 <- function(time){
  init()
  for(i in 1:length(a)){
    dat = a
    total_cars = total_cars + dat[i]
    inflow = dat[i]
    outflow = round(a_secs*traffic_outflow_rate)
    if(inflow>outflow){
      stack = stack + inflow - outflow
      wait_time = wait_time + stack*(60 - time)/60
    }
    wait_time_car = wait_time/total_cars
    
  }
  return(wait_time_car)
}

calc_metric2 <- function(time){
  init()
  for(i in 1:length(b)){
    dat = b
    total_cars = total_cars + dat[i]
    inflow = dat[i]
    outflow = round(a_secs*traffic_outflow_rate)
    if(inflow>outflow){
      stack = stack + inflow - outflow
      wait_time = wait_time + stack*(60 - time)/60
    }
    wait_time_car = wait_time/total_cars
    
  }
  return(wait_time_car)
}

calc_metric3 <- function(time){
  init()
  for(i in 1:length(c)){
    dat = c
    total_cars = total_cars + dat[i]
    inflow = dat[i]
    outflow = round(a_secs*traffic_outflow_rate)
    if(inflow>outflow){
      stack = stack + inflow - outflow
      wait_time = wait_time + stack*(60 - time)/60
    }
    wait_time_car = wait_time/total_cars
    
  }
  return(wait_time_car)
}

calc_metric4 <- function(time){
  init()
  for(i in 1:length(d)){
    dat = d
    total_cars = total_cars + dat[i]
    inflow = dat[i]
    outflow = round(a_secs*traffic_outflow_rate)
    if(inflow>outflow){
      stack = stack + inflow - outflow
      wait_time = wait_time + stack*(60 - time)/60
    }
    wait_time_car = wait_time/total_cars
    
  }
  return(wait_time_car)
}
