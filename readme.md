```
[alias]
	# list all alias
	ls="!git config --list | grep ^alias"

    # Simple git log
	lg="log --graph --abbrev-commit --decorate --all --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

	# Add and Commit
	ac="!git add . && git commit -m"
	
	# list all branches
	ba=branch -a
	
	# delete branch
	dl=branch -D 
	
	# switch branch
	sw=switch 
	
	# return to previous branch
	bk=checkout -
	
	# prune remote branches
	cl=remote prune origin
	
	# checkout remote branches and track
	rc="!f() { git checkout -B "$1" origin/"$1"; }; f"
	
	# checkout branches from current
	feat="!f() { git checkout -B feature/"$1"; }; f"
	bfix="!f() { git checkout -B bugfix/"$1"; }; f"
	hfix="!f() { git checkout -B hotfix/"$1"; }; f"
	
	# show status
	s=status

	# quick rebase
	qrb="!f() { [ -z "$1" ] && { echo "Failed: Missing rebase branch. Usage: git qrb branch"; exit 1; }; git switch $1; git pull --rebase; git checkout -; git rebase $1 || { git rebase --abort && echo Failed to quick rebase; }; }; f "
    
	# PR prep
	pr="!f() { [ -z "$1" ] && { echo "Failed: Missing rebase branch. Usage: git pr branch"; exit 1; }; git pull --rebase; git switch $1; git pull --rebase; git checkout -; git rebase -i $1; }; f"
    
    # Explictly make a merge commit
	mc="!f() { [ -z "$1" ] && { echo "Failed: Missing merge branch. Usage: git mc branch"; exit 1; }; git pull --rebase; git merge --no-ff $1 || git merge --abort; git commit --amend;}; f "
	
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
