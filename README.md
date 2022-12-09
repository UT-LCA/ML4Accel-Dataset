# HLSDataset

## File Architecture
    .
    ├── dataset                         # Paper dataset
    │   ├── benchmark                   # Benchmark application
    │   └── graph_sample                # Graph sample dataset used in HEC_GNN                             
    ├── hec_gnn                         # The HEC_GNN model
    │   ├── cov                         # Graph convolution layer
    │   ├── ensemble_model              # Ensemble model
    │   ├── single_model                # Single model
    │   ├── HEC_GNN_env_install.sh      # The environment installation script
    │   └── README.md                   
    ├── graph_construction              # The graph construction
    │   ├── README.md                 
    │   ├── feature_extraction          # Feature extraction flow
    │   └── sample_generation           # Sample generation flow
    ├── paper_model                     # Trained model in our paper
    │   ├── test_result                 # The test results for each dataset in our paper.
    │   └── trained_model               # The trained model for each dataset in our paper.
    ├── pic                             
    ├── utils                           # Some basic functions
    └── DATE_22_PowerGear.pdf           # Paper
