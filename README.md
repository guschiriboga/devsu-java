# Demo Devops Java

This is a simple application to be used in the technical test of DevOps.

## Getting Started

Related [infrastructure demo](https://github.com/guschiriboga/infra-demo) repository

### Prerequisites

- Java Version 17
- Spring Boot 3.0.5
- Maven
- CircleCI account
- AWS account (refer to [infra-demo](https://github.com/guschiriboga/infra-demo#readme) repo README)

### Installation

Clone this repo.

```bash
git clone https://github.com/guschiriboga/java-demo.git
```

### Database

The database is generated as a file in the main path when the project is first run, and its name is `test.mv.db`.

Consider giving access permissions to the file for proper functioning.

## Usage

### Local run
To run tests you can use this command.

```bash
mvn clean test
```

To run locally the project you can use this command.

```bash
mvn spring-boot:run
```

Open http://127.0.0.1:8000/api/swagger-ui.html with your browser to see the result.

### run in AWS

+ Refer to [infrastructure demo](https://github.com/guschiriboga/infra-demo) repository

#### Pre Configuration

CircleCI account
+ If you logged in using Github, use your same repository project.
+ Add to your project the following environmental variables with the values created in AWS
  + AWS_ACCESS_KEY_ID
  + AWS_SECRET_ACCESS_KEY
+ Configure your project pipeline
  + Use `.circleci/config.yml` file

#### Deploy infrastructure

_NOTE: Automated pipeline will exit with error if infrastructure isn't deploy before running it_

Look into the last step of the job `deploy-to-k8s` for the `kubectl get services` output to get your app base URL
+ It should look like `<<something-here>>.<<region>>.elb.amazonaws.com`

Open _<<base-url>>/api/swagger-ui.html_

## Features

These services can perform,

#### Create User

To create a user, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "errors": [
        "User not found: <id>"
    ]
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```
