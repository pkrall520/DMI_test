# DMI test
***Purpose:*** Your task is to deploy nginx to a kubernetes cluster that I've already set up for you. You're done when you can give me a URL and I can `curl <your url>` and I get the nginx welcome page. I'll also inspect
 the cluster to see how you set it up.

# My Process
- Connect to the existing Kubernetes cluster
- Validate that everything looked good
   - Create a dummy namespace `isthisworking`
   - deploy a dummy app (I redeployed this at the end to show it was there)
   - ```kubectl create deployment hello-server --image=us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 -n isthisworking```
   - validate that the autoscaling nodes got generated
- create an nignx namespace
  - I made a namespaces for this test because they are easy to delete and clean up. In general, you would likely have multiple nginx deployments in multiple namespaces (depending on your app structure: multi-single tenant, multi-app ect) and one in the default namespace to proxy them.

# Folder Structure
I used a basic folder structure without any code of course.
|
|--/k8s
|----/<APP>
|------deployment.yaml
|------service.yaml
|------ect
|--/code (for whatever your project is)
|-- deployment_file (if applicable)

# Yaml Structure
I find it is best to break up my yaml files into the smallest parts. This makes them easier to read, easier to reuse, easier to version control, ect. For the purpose of this test, I over commented to show my commenting style, but normally I would not comment things like 'name of the app'. Additionally, I break my yaml configuration down at the app/module level. For this example, there is just an nginx folder, but, for example, if your application cannot exist without an nginx service, then the app and nginx would be combined in the same folder.

# App Deployment
I created a ```deploy.sh``` file to help deploy the nginx app. Normally this file would be a groovy file (if you use jenkins), or a yaml file if you use something like github/bitbucket, ect.
