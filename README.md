# Google Kubernetes Engine
## Assignment 2: Deploy Ml model (Docker and Kubernetes using Google Kubernetes Engine)

### Objective:


The objective of this assignment revolves around running a Deep Learning model utilizing Docker and Kubernetes with the help of the Google Kubernetes Engine provided by Google. 


There are several steps involved while doing the same, which are documented and explained below:


Steps:

Step 1: 
Creating the script to be run which comprises the deep learning model and the data. This script is present in mnist/main.py file. 

Step 2: 
Getting the Google Kubernetes Engine ready for deployment of the docker image and k8s cluster:
1. Login to Google Cloud Console
2. Enable the Kubernetes Engine API along with the Cloud Computing Engine API.
3. Create the k8s cluster using the GCP interface by going to the Kubernetes engine console 


![image](https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/43604755-454a-47ed-8653-5129089a3ee1)


4. Install the Google Cloud SDK using: `brew install google-cloud-sdk`
5. Initialize CLI: `gcloud init`
6. Install the GKE Cloud auth plugin using: `gcloud components install gke-gcloud-auth-plugin`


Step 3: 
Build and Move the Docker image to Google Kubernetes Engine:
1. Create the Dockerfile script: ["Dockerfile"](https://github.com/VirajYParikh/GoogleKubernetesEngine/blob/main/Dockerfile)
2. Build the docker image using the following syntax:


`docker build -t gcr.io/{project-id}/{app-name} .`


`docker build -t gcr.io/my-project-27779-401121/my-dl-app:latest .`


<img width="1316" alt="Screenshot 2023-12-03 at 7 11 22 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/bdc83f8b-f486-4b1e-a45a-a865082749d6">


3. Push the docker image to the Google Cloud engine repository (container repo) using the following syntax:


`docker push gcr.io/{project-id}/{app-name}`


`docker push gcr.io/my-project-27779-401121/my-dl-app:latest`


<img width="1316" alt="Screenshot 2023-12-03 at 7 16 36 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/906ca47b-1bee-492b-8835-f5470aab1bc8">


Step 4: Fetch the k8s cluster endpoint to deploy the yaml file using the format: 


`gcloud container clusters get-credentials {cluster-name} --zone={zone-name}`;


`gcloud container clusters get-credentials autopilot-cluster-1 --zone=us-central1`


Step 5: Deploy the application on GKE using Kubectl and the yaml file
1. Install Kubernetes on your machine: `brew install kubectl`
2. Create persistent volume claim yaml file for Storage (In GKE we do not need to create a PV yaml since GKE automatically assigns volume): ["pvc.yaml"](https://github.com/VirajYParikh/GoogleKubernetesEngine/blob/main/pvc.yaml)
3. Create a .yaml file for deployment: ["dl_deployment.yaml"](https://github.com/VirajYParikh/GoogleKubernetesEngine/blob/main/dl_deployment.yaml)
4. Run the command to deploy the pvc yamil in gke: `kubectl apply -f pvc.yaml`
5. Run the command to check the status of your deployment: `kubectl get pvc`


<img width="1341" alt="Screenshot 2023-12-03 at 11 51 46 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/b958d1bf-8fd7-45f4-8bf1-ccd1abc15c64">


6. Run the command to deploy the .yaml file in gke: `kubectl apply -f dl_deployment.yaml`
7. Run the command to check the status of your deployment: `kubectl get pods`



<img width="552" alt="Screenshot 2023-12-03 at 8 36 10 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/aa479151-cfba-4b75-b2da-77a8eada9ecd">


5. To see the final output in the pod use the following command syntax:


`kubectl logs {pod-name}`


`kubectl logs my-dl-app-6957f4d4-d76nq`


<img width="1341" alt="Screenshot 2023-12-03 at 8 38 22 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/1b4f0a51-e644-49eb-b1ff-4cbafa948cc4">



## END ##
