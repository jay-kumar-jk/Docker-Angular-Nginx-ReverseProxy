# Docker-Angular-Nginx-ReverseProxy

In this repository, we have 3 files to build a Docker image of Angular application with Nginx reverse proxy configuration.
It also includes Enable CORS with Proxy Configuration Settings in Angular.

**Docker Image with Nginx Reverse proxy**

1. Create a Angular application and add Dockerfile and nginx.conf into the application.
2. Build a Docker Image using docker build command so the image can be deployed into Containers.

**Purpose of nginx.conf**
We have default nginx configuration in our Alpine base image. Once we deploy a default Angular Docker image into any Containers like AWS ECS/EKS, we can access the UI. But whenerver if we reload the page, it doesn't know the entry path and throw 404.
For this purpose we have added nginx.conf to perform reverse proxy. Whenever location is / it will redirect request to default index.html and routing happens from there.

**Enable CORS by reverse proxy**
We can enable CORS while calling another API by using reverse proxy technique. Either we can specify the location like /api and provide redirection request.
But in this repo, we have used proxy.conf.json to Enable CORS with Proxy Configuration Settings in Angular.

To enable CORS via proxy configuration, 
1. we need to generate a src/proxy.conf.json file inside the Angular root folder
2. Define Proxy Configuration values in angular.json
To register a proxy configuration, we need to go to the angular.json file and place the following code inside the serve/options. It will set the src/proxy.conf.json file in our Angular app.

"architect": {
    "serve": {
            "builder": "@angular-devkit/build-angular:dev-server",
            "options": {
                "browserTarget": "project-name:build",
                **"proxyConfig": "src/proxy.conf.json"**
            },
          }
}

Now you can start dev server and test the proxy configuration.
Try hit http://localhost:4200/api/* -> This will be route to http://localhost:3000/ by our proxy configuration. So that CORS issue never arise.
