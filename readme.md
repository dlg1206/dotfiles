```
[alias]
	# list all alias
	# usage: git ls
	ls="!git config --list | grep ^alias"

    # show pretty git log
    # usage: git lg
	lg="log --graph --abbrev-commit --decorate --all --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

	# add and commit all changes
	# usage: git ac "<commit message>"
	ac="!git add . && git commit -m"
	
	# list all branches
	# usage: git ba
	ba=branch -a
	
	# delete branch
	# usage: git dl <branch>
	dl=branch -D 
	
	# switch branch
	# usage: git sw
	sw=switch 
	
	# return to previous branch
	# usage: git bk
	bk=checkout -
	
	# prune remote branches
	# usage: git cl
	cl=remote prune origin
	
	# checkout remote branch locally and track
	# usage: git rc <remote branch>
	rc="!f() { git checkout -B "$1" origin/"$1"; }; f"
	
	# create new feature branch (feat/<name>) and switch to it
	# usage: git feat <name>
	feat="!f() { git checkout -B feature/"$1"; }; f"
	
	# create new bugfix branch (bugfix/<name>) and switch to it
	# usage: git bfix <name>
	bfix="!f() { git checkout -B bugfix/"$1"; }; f"
	
	# create new hotfix branch (feat/<name>) and switch to it
	# usage: git hfix <name>
	hfix="!f() { git checkout -B hotfix/"$1"; }; f"
	
	# show git status
	# usage: git s
	s=status

    # overwrite local changes with remote
    # usage: git rr
    rr = reset --hard @{u}
    
	# quick rebase current branch onto a target branch, will reset if merge conflicts 
	# usage: git qrb <branch>
	qrb="!f() { [ -z "$1" ] && { echo "Failed: Missing rebase branch. Usage: git qrb <branch>"; exit 1; }; git switch $1; git pull --rebase; git checkout -; git rebase $1 || { git rebase --abort && echo Failed to quick rebase; }; }; f "
    
	# PR prep / interactive quick rebase current branch onto target branch
	# usage: git pr <branch>
	pr="!f() { [ -z "$1" ] && { echo "Failed: Missing rebase branch. Usage: git pr <branch>"; exit 1; }; git pull --rebase; git switch $1; git pull --rebase; git checkout -; git rebase -i $1; }; f"
    
    # explictly make a merge commit of target branch into current branch
    # usage: git mc <branch>
	mc="!f() { [ -z "$1" ] && { echo "Failed: Missing merge branch. Usage: git mc <branch>"; exit 1; }; git pull --rebase; git merge --no-ff $1 || git merge --abort; git commit --amend;}; f "
	
	# Init npm project if one doesn't exist
	init-npm="![ -f package.json ] || npm init -y --init-author-name='Derek Garcia' --init-version='0.0.0'"

	# Init commit linting using commitlint and Husky
	init-clint="! clint(){ \
                    git init-npm & \
                    npm install --save-dev husky@8.0.3 @commitlint/config-conventional @commitlint/cli \
                    && echo 'module.exports = {extends: [\"@commitlint/config-conventional\"]}' > commitlint.config.js \
                    && npx husky install \
                    && npx husky add .husky/commit-msg  'npx --no -- commitlint --edit ${1}' \
                    && echo 'Commitlint and Husky are setup!' \
                    || echo "Failed to setup Commitlint and Husky!"; \
	            }; \
	            clint \
				"
	# Init semantic versioning using standard-version
	init-semver="! semver(){ \
	                git init-npm & \
	                npm install --save-dev standard-version \
	                && echo "First Release: npx standard-version -f" \
	                && echo "Major Release: npx standard-version -r major" \
	                && echo "Minor Release: npx standard-version -r minor" \
	                && echo "Patch: npx standard-version -r patch" \
	                || echo "Failed to setup standard-version"; \
	             }; \
	             semver \
	             "
	# Init clint and semver
	init-all="! git init-clint; git init-semver"
```
