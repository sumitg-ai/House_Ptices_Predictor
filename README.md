Local MLOps API with Docker + Terraform
📌 Overview
This project demonstrates a simple MLOps pipeline using:
•	A LinearRegression model trained on the California Housing dataset
•	A Flask API to serve predictions
•	Docker to containerize the app
•	Terraform to manage the local Docker container infrastructure
________________________________________
📁 Project Structure
.
├── app.py               # Flask API serving predictions
├── train.py             # Trains and saves model.joblib
├── model/               # Folder where trained model is saved
├── requirements.txt     # Python dependencies
├── Dockerfile           # Builds image & runs train.py
├── .gitignore
└── terraform/
    ├── main.tf          # Terraform config to spin up Docker container locally
    └── outputs.tf       # Useful outputs like container name and API URL
________________________________________
🛠 Prerequisites
•	Docker
•	Terraform
________________________________________
🚀 Step-by-Step Instructions
✅ 1. Clone the Repo
git clone https://github.com/yourusername/mlops-flask-api.git
cd mlops-flask-api
✅ 2. Build the Docker Image (Handled by Terraform)
No need to run docker build manually — Terraform handles it.
✅ 3. Initialize Terraform
cd terraform
terraform init
✅ 4. Apply Terraform to Start the App
terraform apply
•	This will:
o	Build the Docker image
o	Train the ML model inside the image
o	Start a container running the Flask app
o	Expose the app at http://localhost:5000
________________________________________
📡 API Usage
🔗 Endpoint
POST http://localhost:5000/predict
🧾 Example Request Body
{
  "features": [8.3252, 41, 6.9841, 1.0238, 322, 2.5556, 37.88, -122.23]
}
Replace the array values with values matching the California Housing dataset format.
✅ Example Response
{
  "prediction": [4.526]
}
________________________________________
📤 Terraform Outputs
After terraform apply, you’ll see:
Outputs:

container_name = "mlops-api-container"
host_port = 5000
url = "http://localhost:5000/predict"
________________________________________
🧹 Cleanup
To stop and remove the container and image:
terraform destroy
________________________________________
📦 Dockerfile Used
FROM python:3.9-slim

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt
RUN python train.py

EXPOSE 5000
CMD ["python", "app.py"]
________________________________________
✅ Next Steps
•	Add metrics logging
•	Serve with a model versioning strategy
•	Push Docker image to DockerHub or AWS ECR
•	Expand to AWS EC2 using Terraform
________________________________________
Let me know if you want this converted into a downloadable Markdown file or want badges (like Docker build status, Python version, etc.) added.

