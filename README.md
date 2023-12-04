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
1. Create the Dockerfile script: `Dockerfile`
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
2. Create a .yaml file for deployment: [".yaml"]()`dl_deployment.yaml`
3. 











<img width="1316" alt="Screenshot 2023-12-03 at 6 43 59 PM" src="https://github.com/VirajYParikh/GoogleKubernetesEngine/assets/67093208/c2d86267-656f-4434-9222-46a7ea6a63e5">
