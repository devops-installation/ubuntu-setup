git config --global user.name "shubham94github"
git config --global user.email "phanases@gmail.com"

git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/devops-installation/ubuntu-setup.git
git push -u origin main

#Enable Git credential storage:
git config --global credential.helper store

#other
git branch
git branch -r
git branch -a  #View all local and remote branches
git branch dev #new branch
git checkout -b branch-name  #Create and switch to the new branch
git checkout main #switch branch
# Delete a Branch
git branch -d branch-name
git branch -D branch-name #force delete
# Delete a remote branch
git push origin --delete branch-name

# Rename a Branch
git branch -m new-branch-name
git merge branch-name
# save  uncommit change
git stash
git stash list
git stash apply
git stash drop   #Delete the most recent stash
git stash clear  #all delete stash

# Revert Changes
git reset --soft HEAD~1   #Undo the last commit
git reset --hard HEAD~1   #discard change 


#Rebase Branches
git rebase branch-name

# Cherry-Pick a Commit
git cherry-pick commit-hash


#history 
git log



