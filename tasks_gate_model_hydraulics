### 1. Section 7: Disaggregation of Results

The code up to the this point treats all the gates as if they are the same. In this section I would like to assign each gate and each lateral a standard deviation based on the total flow through the lateral. 

I have included a spreadsheet with a rough cut of the different flows through different laterals. For now, all the gates are being treated the same, although ideally that would change if I get some data to show the differences there. 

Ouputs:
  1.1. a csv that shows the mean and standard deviation / error for the flow through each lateral. 
  1.2 graph like "gcid_mean_flowerror_C1SA".

### 2. Section 8 Unsteady flow propegation

I am working on in an outside program. My advisor has asked that I model the flow using the 1/2/3- D unsteady flow modeling software HEC-RAS. I haven't used that before, so I'm learning it right now. Because of this, we probably won't finish this section right now. But I do want to work on it just for the sake of getting a chapter submitted while I learn HEC-RAS.

So, what I would like to do is write this code in a kind of "dummy" version, where I just choose some inputs, and then those inputs will change once I run the flow simulations.

The goal of this model is to run the model as it exists with two changes.

  2.1. Create a "stable" and "chaotic" lateral scheme. The idea is that some laterals have water levels that fluctuate, and some do not. It's based on the geometry, if there are any long crested weirs, and how deliveries are run. 
    - For the stable lateral, initial USL sd of 0.2 ft. 
    - For the chaotic lateral, initial USL sd of let's pick 0.5 ft. 
    
 2.2. Add a value of sd that increases based on how many gates are upstream of the gate in question.
    2.2.1 There is an input in the "Inputs" folder  "gcid_lateral_gates.csv" where all the laterals are laid out. 
    2.2.2. There are two columns that apply here. The values in column "L" are for how many gates are upstream of each lateral. This is because the laterals branch off each other. Column "C", that you don't need to use here, shows which lateral is the "parent" of each sub-lateral. So I counted the gates above the junction for each lateral, and that's column "L". 
    2.2.3. The other column you need to use is column "H". Column "H" shows how many gates there are along the lateral in question. 
    2.2.4. To calculate the USL sd for each gate in the system, we would need to combine the initial USL sd with (USL sd per gate)*(number of upstream gates). I believe these numbers are combined by taking the square root of the sum of the squares?
    2.2.5. For the stable lateral, let's have USL_sd_ngates = 0.01/gate and for the chaotic lateral let's try 0.05/gate. That might be too much, but let's start there.

Outputs: 
  2.3. A graph like "gcid_mean_flowerror_C1SA"
  2.4.  A csv that shows the mean flow and standard deviation for the flow for each lateral.
