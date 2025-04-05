# Use the official Python image with Jupyter preinstalled
FROM jupyter/base-notebook:python-3.11

# Set working directory inside the container
WORKDIR /home/jovyan/work

# Copy your whole project (data, notebooks, scripts) into the container
COPY . .

# Install Python dependencies (listed in requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Expose Jupyter port
EXPOSE 8888

# Run Jupyter when container starts
CMD ["start-notebook.sh"]