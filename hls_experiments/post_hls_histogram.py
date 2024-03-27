import pandas as pd
import os, glob
path="/home/nanditha/work/ML4Accel-Dataset/fpga_ml_dataset/HLS_dataset/polybench" 

csv_file_list=[]
for root, dirs, files in os.walk(path):
    for name in files:
         if name.endswith("_hls_info.csv"):
              file_path = os.path.join(root, name)
              csv_file_list.append(file_path)
              #print ("File path", file_path)

path="/home/nanditha/work/ML4Accel-Dataset/fpga_ml_dataset/HLS_dataset/machsuite"
for root, dirs, files in os.walk(path):
    for name in files:
         if name.endswith("_hls_info.csv"):
              file_path = os.path.join(root, name)
              csv_file_list.append(file_path)
              #print ("File path", file_path)



#dfs = [pd.read_csv(f) for f in csv_file_list]
merged_data=pd.DataFrame()
for f in csv_file_list:
    df=pd.read_csv(f)
    merged_data=pd.concat([merged_data, df], ignore_index=True)

df = merged_data.drop(columns=['c_num_arith'])


#c_num_arith	c_num_logic	rtl_num_arith	rtl_num_logic	data_input_port(numxbits)	data_output_port(numxbits)

merged_data.to_csv("merged_post_hls_poly_mach.csv", index=False)



