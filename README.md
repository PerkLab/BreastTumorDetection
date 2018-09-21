# BreastTumorDetection
## Project Goals 
- Use deep learning to detect breast tumor region in breast ultrasound images
- Create bounding convex hull around tumor 
- Use detected tumor region as initial guess of tumor contour for lumpNav guidelet 
## Data 
- Collected from the 2016 non-palpable lumpectomy study 
- 40 cases 
- bmod ultrasound images of tumor in a sequence
- 3D contour of tumor region
- intersection of tumor region contour and ultrasound images from electromagnetic tracking data
## Liturature Review 
#### 1. A Deep Learning Approach for Real Time Prostate Segmentation in Freehand Ultrasound Guided Biopsy
##### Objective
- Automatically detect tumors from automated whole breast ultrasound
- differs from other 3D and 2D approaches to breast tumor detection because it uses a sliding volume of interest (VOI) instead identifying tumor canidates 
##### Data
##### Methods
##### Outcome
#### 2. Tumor Detection in Automated Breast Ultrasound Using 3-D CNN and Prioritized Candidate Aggregation
##### Objective
##### Data
##### Methods
##### Outcome

### References
1. Anas, Emran Mohammad Abu, Parvin Mousavi, and Purang Abolmaesumi. "A Deep Learning Approach for Real Time Prostate Segmentation in Freehand Ultrasound Guided Biopsy." Medical image analysis (2018).
2. Chiang, Tsung-Chen, Yao-Sian Huang, Rong-Tai Chen, Chiun-Sheng Huang, and Ruey-Feng Chang. "Tumor Detection in Automated Breast Ultrasound Using 3-D CNN and Prioritized Candidate Aggregation." IEEE Transactions on Medical Imaging (2018).
