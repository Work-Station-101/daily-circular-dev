#!/bin/bash

cd ..

cp daily-circular-dev/docker-compose.yml .

docker-compose down

echo "------------------------------"
echo "cloning project repos ...."
echo "------------------------------"

clone_project() {
  echo -e "\ncloning $1 ...\n"
  
  if [ -d "$1" ]; then
    echo -e "$1 already exits! cloning aborted!!!\n\n"
    cd $1
    git add .
    git stash
    git checkout main
    git fetch dc main
    git reset --hard dc/main
    cd ..
    return -1
  fi
  
  git clone "git@github.com:Work-Station-101/$1.git"
  cd $1
  git remote rename origin dc
  cd ..
  echo -e "\ncloning completed!\n\n"

  return 1
}

projects[0]="daily-circular-client"

for project in $projects; do
  clone_project $project
done

echo -e "\n------------------------------"
echo "cloning complete !!!"
echo "------------------------------"
echo "start docker containers ..."
echo "------------------------------"

docker-compose up -d --build
