
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt 
  
# Read in the DataFrame
df = pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test.csv') 
df_hlsyn= pd.read_csv('/home/nanditha/Documents/ML4Accel-Dataset/hls_experiments/data/test1.csv')
  

#df['clk_estimated(ns)'] = df['clk_estimated(ns)'].apply(lambda x: x*100)
df['clk_estimated(ns)'] = df['clk_estimated(ns)'].apply(lambda x: x*100)


# plotting two histograms on the same axis 
plt.hist(df['ff'], bins=25, alpha=0.5, color='red') 
plt.hist(df_hlsyn['resources_ff_used'], bins=25, alpha=0.45, color='blue') 
print ("ff values", df['ff'])  


#plotting two histograms on the same axis 
plt.hist(df['lut'], bins=25, alpha=0.5, color='red')
plt.hist(df_hlsyn['resources_lut_used'], bins=25, alpha=0.45, color='blue')
print ("lut values", df['lut'])


plt.hist(df['bram'], bins=25, alpha=0.5, color='red')
plt.hist(df_hlsyn['resources_bram_used'], bins=25, alpha=0.45, color='blue')
print ("bram values", df['bram'])

plt.hist(df['dsp'], bins=25, alpha=0.5, color='red')
plt.hist(df_hlsyn['resources_dsp_used'], bins=25, alpha=0.45, color='blue')
print ("dsp values", df['dsp'])

plt.title("histogram with multiple variables (overlapping histogram)") 
  
#plt.legend(['individuals who are homeless',  'family members who are homeless']) 
  
plt.savefig("latency1.png")
plt.show()
