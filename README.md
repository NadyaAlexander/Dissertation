# Dissertation

This repository will cover 4-5 different functions, each of which represent a chapter or major element to the chapter of the dissertation. The functions are listed below.

## 1. function Gate  
    1.1. Q = f(USL, G)  
        1.1.1. Q run as a Monte Carlo (MC) with USL and G probability distribution.  
        1.1.2. There is an accuracy to the equation itself which comes from the manufacturer.  
        1.1.3. The manufacturer's accuracy may be a distribution if they are willing to share their results with us, but may also be just a +/- X% that we need to decide to turn into a distribution.  
    1.2. V = f(USL, G, t)  
        1.2.1. V run as MC with all variables defined by probability distributions, t may have a skew that the others do not.  
  
## 2. function Gate_Series
  2.1. for i = 1 to n, Vi = f(USLi, Gi, ti)
    2.1.1. USL may be one value for all i or may be f(i)
    2.1.2. in later steps we may try to tie this to a mass balance based on the flow from the lateral head and end of channel            spill.

## 3. function Lateral
  3.1. Qj = fj
    3.1.1. There are 8 different lateral heading flow equations, each with a different accuracy.
    3.1.2. At this point we start to have data, so we can actually look at field data for some of the variables if we want.
  3.2. Vj = f(Qj, tj)
    3.2.1. USL will be one value for laterals along the same reach. There is the option to add f(j) to USL if we wish later. 
          If there is a control structure inbetween laterals, then f(j) no longer holds.

## 4. function Main?
  4.1. This would be a different type of mass balance. 
  4.2. Most flow travels further down the main and isn't used along the channel.
  4.3. There are turnouts along the main canal.
  4.4. Change in storage volume (ie change in level) is often determined by operators' need for a certain amount of water           available.
  4.5. There is the ability to use data to back-calculate the accuracy of the flow equations at the main canal flow control         structures.
  4.6. It may be difficult to do a mass balance since this is an unlined canal and there is a significant amount of seepage.        The district does have estimates for this.

## 5. function Cost-Efficiency
  5.1. cost (c) of improved accuracy at laterals
  5.2. c of improved accuracy at turnouts
  5.3. ability to decide on improvement for each i or j and look at cost - build a marginal cost function
  5.4. penalty function based on the size of the parcel or the number of turnouts along the lateral length.
  
None of these models currently include drain water or re-use as part of their function.
