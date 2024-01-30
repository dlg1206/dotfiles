```.
[alias]
    # Simple git log
    lg="log --graph --abbrev-commit --decorate --all --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

    # Add and Commit
    ac="!git add . && git commit -m"

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
