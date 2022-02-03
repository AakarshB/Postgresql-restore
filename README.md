![Postgresql-backup-restore-architecture](https://user-images.githubusercontent.com/85996087/152223067-bf76710e-18cc-4e4e-8345-bc272c6bed62.jpg)

PG-Restore Pre-requisites	
Requirements	Variables names
Storage Account name	azurestorageaccountname
Storage Account key	azurestorageaccountkey
File Share name	fileShareName
Back up file name	tarfilename
Postgresql db destination host name	PGDESTHOST
Postgresql db destination Port number	PGDESTPORT
Postgresql db destination database name	PGDATABASE
Postgresql db destination username name	PGDESTUSER
Postgresql db destination password	PGDESTPASSWORD
![image](https://user-images.githubusercontent.com/85996087/152306934-b556bd9f-9294-4d84-8b41-684c4a335b0e.png)

## Goal

Easily Restore your PostgreSQL Database from the tar file created using the backup job

Intended to be used with Kubernetes for creating Jobs that restores your postgresql database in the desired server.

## Running the Restore Job in Azure Kubernetes Service (AKS) or any Kubernetes Clusters

### Step 1. find and replace the neccessary ENV variables in the kubernetes yaml files

find the name of the .tar dump file stored in azure fileshare along with the storage account keys and replace in the ENV of the Secrets and yamls

### Step 2. Replace your Database creds.
Replace database creds in [pg-restore-Job.yaml]

### Step 3. Update the secret.yaml and cronjob.yaml with the DB and storage connectionstrings

Update the secret.yaml and job.yaml with the DB and storage connectionstrings

## Running manually on your computer

### Step 1. Replace the image name with the lastest image provided, below is the defualt provided in the cronjob yaml

aakarsh94/postgresql-restore:v1.0 `

### Step 2. Run and map to your drive (e.g. /d/backup)

 Apply the job and secrets.yaml in your kubernetes cluster

 NOTE: The target database is to be created in the destination server before the restore job is applied Below is the command to create a database in postgresql or pgadmin tool can be used.

CREATE DATABASE adventureworks
    WITH 
    OWNER = "$USERNAME"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1; 

