
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt 
  
# Read in the DataFrame
df = pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test.csv') 
df_hlsyn= pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test1.csv')
  

#df['clk_estimated(ns)'] = df['clk_estimated(ns)'].apply(lambda x: x*100)

fig, (ax1, ax2,ax3,ax4) = plt.subplots(1, 4)
fig.suptitle('Horizontally stacked subplots')

ax1.hist(df['ff'], bins=25, alpha=0.8, color='red',label ="our_work")
ax1.hist(df_hlsyn['resources_ff_used'], bins=40, alpha=0.45, color='blue',label="hlsyn")
ax1.set_xlabel("Resources- FF used")  
ax1.set_ylabel("Density")
ax1.legend(loc='upper right')
#print ("ff values", df['ff'])  


#plotting two histograms on the same axis 
ax2.hist(df['lut'], bins=25, alpha=0.8, color='red',label ="our_work")
ax2.hist(df_hlsyn['resources_lut_used'], bins=40, alpha=0.45, color='blue',label="hlsyn")
ax2.set_xlabel("Resources- LUT used")
ax2.set_ylabel("Density")
ax2.legend(loc='upper right')

#print ("lut values", df['lut'])


ax3.hist(df['bram'], bins=25, alpha=0.8, color='red',label ="our_work")
ax3.hist(df_hlsyn['resources_bram_used'], bins=40, alpha=0.45, color='blue',label="hlsyn")
ax3.set_xlabel("Resources- LUT used")
ax3.set_ylabel("Density")
ax3.legend(loc='upper right')

#print ("bram values", df['bram'])

ax4.hist(df['dsp'], bins=25, alpha=0.8, color='red',label ="our_work")
ax4.hist(df_hlsyn['resources_dsp_used'], bins=40, alpha=0.45, color='blue',label="hlsyn")
ax4.set_xlabel("Resources- DSP used")
ax4.set_ylabel("Density")
ax4.legend(loc='upper right')

#print ("dsp values", df['dsp'])

#plt.title("histogram with multiple variables (overlapping histogram)") 
  
#plt.legend(['individuals who are homeless',  'family members who are homeless']) 
  
plt.savefig("latency1.png")
plt.show()
