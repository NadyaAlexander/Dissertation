### 1. Section 7: Disaggregation of Results

The code up to the this point treats all the gates as if they are the same. In this section I would like to assign each gate and each lateral a standard deviation based on the total flow through the lateral. 

I have included a spreadsheet with a rough cut of the different flows through different laterals. For now, all the gates are being treated the same, although ideally that would change if I get some data to show the differences there. 

One thing I forgot to mention earlier - this may be expanded in the future, to include a more accurate picture of "real time" operations, but for now, I am just using the total seasonal flow.

Ouputs:<br />
  1.1. a csv that shows the mean and standard deviation / error for the flow through each lateral. <br />
  1.2 graph like "gcid_mean_flowerror_C1SA".<br />

### 2. Section 8: Unsteady flow propegation

I am working on in an outside program. My advisor has asked that I model the flow using the 1/2/3- D unsteady flow modeling software HEC-RAS. I haven't used that before, so I'm learning it right now. Because of this, we probably won't finish this section right now. But I do want to work on it just for the sake of getting a chapter submitted while I learn HEC-RAS.

So, what I would like to do is write this code in a kind of "dummy" version, where I just choose some inputs, and then those inputs will change once I run the flow simulations.

The goal of this model is to run the model as it exists with two changes.

  2.1. Create a "stable" and "chaotic" lateral scheme. The idea is that some laterals have water levels that fluctuate, and some do not. It's based on the geometry, if there are any long crested weirs, and how deliveries are run. <br />
    - For the stable lateral, initial USL sd of 0.2 ft. <br />
    - For the chaotic lateral, initial USL sd of let's pick 0.5 ft. <br />
    
 2.2. Add a value of sd that increases based on how many gates are upstream of the gate in question.<br />
    2.2.1 There is an input in the "Inputs" folder  "gcid_lateral_gates.csv" where all the laterals are laid out. <br />
    2.2.2. There are two columns that apply here. The values in column "L" are for how many gates are upstream of each lateral. This is because the laterals branch off each other. Column "C", that you don't need to use here, shows which lateral is the "parent" of each sub-lateral. So I counted the gates above the junction for each lateral, and that's column "L". <br />
    2.2.3. The other column you need to use is column "H". Column "H" shows how many gates there are along the lateral in question. <br />
    2.2.4. To calculate the USL sd for each gate in the system, we would need to combine the initial USL sd with (USL sd per gate) x (number of upstream gates). I believe these numbers are combined by taking the square root of the sum of the squares?<br />
    2.2.5. For the stable lateral, let's have USL_sd_ngates = 0.01/gate and for the chaotic lateral let's try 0.05/gate. That might be too much, but let's start there.<br />

Outputs: <br />
  2.3. A graph like "gcid_mean_flowerror_C1SA"<br />
  2.4.  A csv that shows the mean flow and standard deviation for the flow for each lateral.<br />
    
### Next Steps.
I wanted to start to write out what the remaining steps of the model are, although without final details (file names, etc.)

### 3. Section 9: Compare the Gate Accuracy to the Lateral Heading Accuracy

The idea here is to examine what is the cost-benefit of improving accuracy at the farmgate level instead of the lateral heading level. There are a variety of lateral heading measurement devices. Some of them have published accuracies (flow meter), and some do not (operator puts a stick on top of the weir and records the result).

I would like to do the following steps:

3.1 Create an adjustable proportion between chaotic and stable laterals. This would be assigned on a *parent* lateral level, we couldn't have a chaotic lateral that then had a stable lateral branch off of it. Ideally the proportion would be randomly assigned across the laterals (i.e., if we choose 50/50, the program will make 50% of the laterals chaotic and 50% stable).

3.2. Create an adjustable assignment for lateral heading measurement. I will choose 4-ish devices (they have more than this, but some are being pulled out and replaced, so I want to ignore those). Each device will have a designated variance. I will choose a couple different scenarios for how the devices are assigned to the headings.

3.3. Run scenarios in 3.1 and 3.2 to see what the total standard deviation for the system is as well as the expected total flow error in volume (acre-feet).

### 4. Add in Costs

4.1. Add in costs. Include three scenarios: <br />
4.1.1 The cost of upgrading the gates in 3.1 only <br />
4.1.2. The cost of upgrading gates in 3.1 and the lateral headings in 3.2 <br />
4.1.3. The cost of upgrading the lateral headings in 3.2 only. 

4.2. Calculate the cost-benefit, the decrease in total volume flow error per dollar. I expect that this will heavily favor not upgrading the gates, because there is no mathematical reason to favor a bunch of small measurement points instead of one big one.

4.3. Create what I am calling a "granularity factor". I haven't totally worked this out in my head yet, but the basic idea is - how do I use a multiplier to weight the results so that upgrading all the gates is "preferred" in the cost-benefit over upgrading the lateral headings? Granularity refers to the fact that the lateral heading measurement is for a large area - say 1,000 acres, while each gate is for a small area - 50 acres. I want to represent the ratio of that area difference and show how much money is being spent to get the more granular measurement.

And that's it! 
Once it's running I will probably want to loop back around and make changes to some pieces, especially if we get more data, but that's the general conclusions I'm going after.
