# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY main.py .

COPY train_model.py .

# Run the training script to generate model.pkl
RUN python train_model.py

# Expose port
EXPOSE 8080

# Run the app
CMD ["python", "main.py"]
