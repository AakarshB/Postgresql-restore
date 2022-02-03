## Goal

Easily Restore your PostgreSQL Database from the tar file created using the backup job

Intended to be used with Kubernetes for creating Jobs that restores your postgresql database in the desired server.

![Postgresql-backup-restore-architecture](https://user-images.githubusercontent.com/85996087/152223067-bf76710e-18cc-4e4e-8345-bc272c6bed62.jpg)

## Pre-requisites	to gather

![image](https://user-images.githubusercontent.com/85996087/152312138-6cfa2018-f656-494c-90c5-320269b372a6.png)

## Running the Restore Job in Azure Kubernetes Service (AKS) or any Kubernetes Clusters

### Step 1. find and replace the neccessary ENV variables in the kubernetes yaml files

find the name of the .tar dump file stored in azure fileshare along with the storage account keys and replace in the ENV of the Secrets and yamls

### Step 2. Replace your Database creds.
Replace database creds in [pg-restore-Job.yaml]

### Step 3. Update the secret.yaml and cronjob.yaml with the DB and storage connectionstrings

Update the secret.yaml and job.yaml with the DB and storage connectionstrings

## Running on your Destination Cluster

### Step 1. Replace the image name with the version specific to your PostgreSQL server.

Below is an example of the image name which is specific to PostgreSQL version 11

aakarsh94/postgresql-restore:v11 `

### Step 2. Run and map to your backup drive 

Apply the job and secrets.yaml in your kubernetes cluster

NOTE: The target database is to be created in the destination server before the restore job is applied Below is the command to create a database in postgresql or pgadmin tool can be used.

CREATE DATABASE adventureworks
    WITH 
    OWNER = "$USERNAME"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1; 

