#!/bin/bash

pd=$(pwd)
Iam_user_login_link="https://345529994823.signin.aws.amazon.com/console"
echo " Please enter appropriate option  
 1. Admin
 2. Developer
 Ex:- to create Admin user type 1 or to create developer user type 2"


terraform_steps(){
	echo "You are creating $1 role user"
	mkdir $pd/$1
	cd $pd/$1
	pwd
	cp $pd/$1.tf $1.tf
	cp $pd/$1.json $1.json
	terraform init 
	terraform apply 
	username=$(terraform output username)
	password=$(terraform output password | base64 --decode | keybase pgp decrypt )
	echo "Login Url : $Iam_user_login_link"
	echo "User name : $username"
	echo "Password : $password"
	rm -rf mkdir $pd/$1
}


read role
if [[ $role -eq 1 ]]; then 
	terraform_steps "admin"
elif [[ $role -eq 2 ]]; then 
	terraform_steps "developer"
else 
	echo "Please select valid role"
fi