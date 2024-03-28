
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt 
import numpy as np

# Read in the DataFrame
#df = pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test.csv') 
#df_hlsyn= pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test1.csv')
df= pd.read_csv('/home/nanditha/work/ML4Accel-Dataset/hls_experiments/data/merged_post_hls_poly_mach.csv')
df_hlsyn = pd.read_csv('/home/nanditha/work/ML4Accel-Dataset/hls_experiments/data/hlsyn_design_space_plot_data.csv')


fig, (ax1, ax2,ax3,ax4) = plt.subplots(1, 4)
fig.suptitle('Resource utilization comparison')

   # Make default density plot
sns.kdeplot(df['ff'], clip= (0,100000), color='blue',fill=True,ax=ax1,label="our work")
sns.kdeplot(df_hlsyn['resources_ff_used'], clip= (0,100000), color='red',fill=True,ax=ax1, label="hlsyn")
ax1.set_xlabel("FF used")  
ax1.set_ylabel("Density")
ax1.legend(loc='upper right')



sns.kdeplot(df['lut'], color='blue',clip= (0,100000), fill=True,ax=ax2,label='our_work')
sns.kdeplot(df_hlsyn['resources_lut_used'], clip= (0,100000), color='red',fill=True,ax=ax2,label="hlsyn")
#plotting two histograms on the same axis 
ax2.set_xlabel("LUTs used")
ax2.set_ylabel("Density")
ax2.legend(loc='upper right')

#print ("lut values", df['lut'])

sns.kdeplot(df['bram'], color='blue',fill=True,ax=ax3,label='our_work')
sns.kdeplot(df_hlsyn['resources_bram_used'], color='red',fill=True,ax=ax3,label="hlsyn")

ax3.set_xlabel("BRAMs used")
ax3.set_ylabel("Density")
ax3.legend(loc='upper right')

#print ("bram values", df['bram'])
sns.kdeplot(df['dsp'],clip= (0,1000), color='blue',fill=True,ax=ax4,label='our_work')
sns.kdeplot(df_hlsyn['resources_dsp_used'],clip= (0,1000), color='red',fill=True,ax=ax4,label="hlsyn")

ax4.set_xlabel("DSPs used")
ax4.set_ylabel("Density")
ax4.legend(loc='upper right')

#print ("dsp values", df['dsp'])

#plt.title("histogram with multiple variables (overlapping histogram)") 
  
#plt.legend(['individuals who are homeless',  'family members who are homeless']) 
  
plt.savefig("figures/sns_resources_histogram.png")
plt.show()
