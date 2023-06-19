
# Devsu Demo DevOps

For this Demo DevOps project, I have chosen a stack of technologies and tools to ensure an efficient development and deployment. Here are the key components:

* **Source Code Management**: The project is hosted on GitHub, which serves as the central repository for storing all the project's code.

* **Continuous Integration/Continuous Deployment (CI/CD) Pipelines**: GitHub Actions is utilized to automate the CI/CD pipelines, enabling seamless integration and deployment of the application.

* **Static Code Analysis**: NPM's "audit" tool is employed for static code analysis. This helps in identifying potential vulnerabilities and issues within the codebase. The analysis can be performed by running the command `npm audit`.

* **Unit Testing and Code Coverage**: Jest, a testing framework, is used for unit testing and code coverage analysis. The command `jest --coverage` runs the tests and generates coverage reports.

* **Containerization**: Docker is utilized to containerize the application, facilitating consistent and isolated deployment across various environments.

* **Kubernetes Platform**: The application is deployed on the Google Kubernetes Engine (GKE), which provides a managed Kubernetes environment for efficient orchestration and scalability.

* **Images Registry**: Google Artifact Registry (GAR) is used to store and manage container images. After the build process, the images are pushed to the GAR using the CI/CD pipeline.

* **Cloud Provider**: The project leverages the Google Cloud Platform (GCP) as the cloud provider, enabling seamless integration with GKE and GAR.

* **Infrastructure as Code**: Terraform is utilized to define and provision the necessary resources for the GKE cluster, including the VPC, subnets, node pools, IAM roles, and GKE configurations.

* **Kustomize**: Kustomize is employed to customize and manage the Kubernetes manifests for different environments within the GKE cluster. It allows for efficient configuration management and generation of environment-specific secrets, such as the `DATABASE_NAME`, `DATABASE_USER`, and `DATABASE_PASSWORD` required by the application.

The project architecture resembles the diagram depicted below:

![alt text](https://cloud.google.com/static/kubernetes-engine/images/gke-internal-lb.svg)

# Repo Secrets Configuration
To authenticate with GCP and its services, a secret named **``GCP_CREDENTIALS``** is configured within the repository. This secret contains the necessary credentials for authenticating with GCP and accessing its services.

# Deployment Configuration
The GKE cluster configuration includes the following manifests:

* **``autoscaler.yaml``** for automatic horizontal scaling of application pods based on specified resources.
* **``deployment.yaml``** for defining the deployment of the application, including container configuration, such as the image, ports, and resource requirements.
* **``ingress.yaml``** for specifying the Ingress Controller's functionality and behavior.
* **``namespace.yaml``** for organizing the workload within a specific namespace.
* **``service.yaml``** for defining the service that allows access to the pods.

## Liveness Probe
A liveness probe is set up for the deployment on path "/api/users" to verify the application's health and ensure it is running correctly.

## DNS and TLS Certificates
Nginx Ingress Controller is utilized along with DNS and TLS certificates to enable HTTPS traffic. A public static IP is reserved on Google to be associated with the Ingress Controller for handling HTTPS requests.
