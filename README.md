# BreastTumorDetection
## Project Goals 
- Use deep learning to detect breast tumor region in breast ultrasound images
- Create bounding convex hull around tumor 
- Use detected tumor region as initial guess of tumor contour for lumpNav guidelet 
## Data 
- Collected from the 2016 non-palpable lumpectomy study 
- 40 cases 
- Good example case: 37
- bmod ultrasound images of tumor in a sequence
- Linear ultrasound probe
- Expert, Surgeon or Radiologist contoured breast tumors 
- 3D contour of tumor region
- intersection of tumor region contour and ultrasound images from electromagnetic tracking data
### To View Data
- Download 3D Slicer
- Install IGT extension 
- Install LumpNavRelay module (https://github.com/PerkLab/LumpNavReplay)
#### To Save Data 
 - Load data using the lumpNav Replay module
 -	Hide all models from slice intersection
 -	Use Screen Capture to capture each individual ultrasound image 
    -	Set Animation mode: sequence 
    -	Set Number of Images
    - Set Master View: red
- Use matlab functions to crop, resize and label data
### Example Data
**Ultrasound Image with Tumor contour (this image is not cropped):** ![alt text](https://github.com/PerkLab/BreastTumorDetection/blob/master/USwithTumorContour.png)
**Ultrasouns Image of Tumor cropped:** ![alt text](https://github.com/PerkLab/BreastTumorDetection/blob/master/USImage.jpeg)


## Literature Review 
### 1. A Deep Learning Approach for Real Time Prostate Segmentation in Freehand Ultrasound Guided Biopsy
##### Objective
- Segmentation of the prostate in real time from ultrasound images to be used for registration with MRI
- Since the images of the prostate are usually spare and spaced usually 5mm apart the delineation is done in 2D images and does not use information from surrounding images
##### Data
- 2238 transrectal ultrasound images for training
- 637 images for validation
- 1017 for testing
- 18 patients
- 820 x 614 pixels
##### Methods
- convolutional networks for extracting spatial features
- recurrent networks to exploit the temporal information (using residual convolution)
- builds off of network described in [4] 
##### Outcome
- 2238 transrectal ultrasound images for training
- 637 images for validation
- 1017 for testing
- 18 patients
- 820 x 614 pixels
### 2. Tumor Detection in Automated Breast Ultrasound Using 3-D CNN and Prioritized Candidate Aggregation
##### Objective
- Automatically detect tumors from automated whole breast ultrasound
- differs from other 3D and 2D approaches to breast tumor detection because it uses a sliding volume of interest (VOI) instead identifying tumor canidates 
##### Data
- 187 patients
- 318 2D images per patients
- 230 lesions in the dataset (90 benign, 140 malignant)
- Each image was labeled by physician (bounding box around tumor)
- After data augmentation:
  - 400 000 VOI’s in training and validation of non-tumor
  - ~18000 VOI’s in training and validation of tumor
##### Methods
- 3D CNN with prioritized candidate aggregation
##### Outcome
- Compared to 2D CNNs, the proposed 3D CNN outperforms
### 3. Deep learning based classification of breast tumors with shear-wave elastography
##### Objective
- SWE differs from standard ultrasound as SWE looks at biomechanical functional properties of the tissue vs only morphological alterations
- Classify as breast lesion as either benign or malignant
##### Data
- 227 SWE images, 135 benign tumors and 92 malignant tumors
- The raw pixel matrix was transformed into a vector and used as input
- Resolution 12.26 +/- 1.62 pixel/ cm
##### Methods
- Point-wise gated Boltzmann machine (PGBM)
- Used for its ability to differentiate task relevant and irrelevant patterns
##### Outcome
- Accuracy: 93.4 %
- Sensitivity: 88.6%
- Specificity: 97.1%
- Area under ROC: 0.947
- Results were compared to results using statistical features (ie. Human crafted features like, tumor shape, etc) the DL features achieve better classifier results
### 4. Clinical Target-Volume Delineation in Prostate Brachytherapy Using Residual Neural Networks
##### Objective
- Clinical target volume (CTV) delineation of ultrasound image
  - CTV is patient-specific contour that does not necessarily follow the exact prostrate boundary and may contain neighboring tissues
##### Data
- 4284 expert labeled ultrasound images
- Tested on 1081 ultrasound images
- 598 patients
- Original US image: 415 x 490 pixels (0.15mm x 0.15 mm spacing)
- Resized Image: 224 x 224 pixels
##### Methods
- Deep convolutional neural networks (CNN)
  - Residual neural nets
  - Dilated convolution at deep layers
- Apply on-uniform weights are maximized on the CTV boundary and decrease exponentially
  - Other work does assign higher weights to pixels enclosed by boundary*
##### Outcome
- Significantly better results than two gold standard approaches
- DSC: 95%
- mSDE: 1.05mm
- HDE: 2.96mm

### 5. Breast Tumor Detection in Ultrasound Images Using Deep Learning
##### Objective
- Compare different state of the art CNN for the task of ultrasound image tumor region detection
- Tested 11 different combinations of CNNs
##### Data
- 1043 ultrasound images, 464 malignant, 579 begin
- Each image was segmented and classified by doctors
##### Outcome
- Single shot Multiple Box Detector (SSD) CCN performs the best
- Creates a bounding box around the tumor regioon
  - AP%: 98.89%
  - AR%:67.23%
  
### 6. Convolutional neural networks for medical image analysis: Full training or fine tuning?
##### Objective
- Investigate if using pre-trained CNN’s on labeled natural images and fine-tuning the CNN for medical images
- “Can the use of pre-trained deep CNNs with sufficient fine-tuning eliminate the need for training a deep CNN from scratch?”
- In general the early layers of a CNN learn the low level image features
- Later layers learn high-level features that are specific the application at hand (It is usually sufficient to fine tune only these layers)
- **Shallow tuning**: only fine-tuning the last few layers
- **Deep tuning**: fine-tuning all the layers
##### Data
- 18900 video frames for pulp detection
- 121 CT pulmonary angiography for pulmonary Embolism Detection
- 4000 colonoscopy images for frame classification
- 276 POI’s from 92 Carotid intima-media thickness (trasonography method) for boundary segmentation
##### Methods
- Fine-tuning of a pre-trained CNN in a layer-wise manner leads to incremental performance improvement
- Caffe library used
- AlexNet Architecture: for both training and retraining
  - Takes in 3 x 227 x 227
##### Outcome 
- free-response operating characteristic (FROC) analysis
  - Incrementally better results when training more layers all of which outperform network trained from scratch and the hand crafted method
- Convergence time for network is generally faster when using pre-trained network
### References
1. Anas, Emran Mohammad Abu, Parvin Mousavi, and Purang Abolmaesumi. "A Deep Learning Approach for Real Time Prostate Segmentation in Freehand Ultrasound Guided Biopsy." Medical image analysis (2018).
2. Chiang, Tsung-Chen, Yao-Sian Huang, Rong-Tai Chen, Chiun-Sheng Huang, and Ruey-Feng Chang. "Tumor Detection in Automated Breast Ultrasound Using 3-D CNN and Prioritized Candidate Aggregation." IEEE Transactions on Medical Imaging (2018).
3. Zhang, Qi, Yang Xiao, Wei Dai, Jingfeng Suo, Congzhi Wang, Jun Shi, and Hairong Zheng. "Deep learning based classification of breast tumors with shear-wave elastography." Ultrasonics 72 (2016): 150-157.
4. Anas, Emran Mohammad Abu, Saman Nouranian, S. Sara Mahdavi, Ingrid Spadinger, William J. Morris, Septimu E. Salcudean, Parvin Mousavi, and Purang Abolmaesumi. "Clinical target-volume delineation in prostate brachytherapy using residual neural networks." In International Conference on Medical Image Computing and Computer-Assisted Intervention, pp. 365-373. Springer, Cham, 2017.
5. Cao, Zhantao, Lixin Duan, Guowu Yang, Ting Yue, Qin Chen, Huazhu Fu, and Yanwu Xu. "Breast Tumor Detection in Ultrasound Images Using Deep Learning." In International Workshop on Patch-based Techniques in Medical Imaging, pp. 121-128. Springer, Cham, 2017.
6. Tajbakhsh, Nima, Jae Y. Shin, Suryakanth R. Gurudu, R. Todd Hurst, Christopher B. Kendall, Michael B. Gotway, and Jianming Liang. "Convolutional neural networks for medical image analysis: Full training or fine tuning?." IEEE transactions on medical imaging 35, no. 5 (2016): 1299-1312.
