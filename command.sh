npx create-react-app my-app
cd my-app
git init
git add .
git commit -m "Initial commit"
gh repo create my-app --public --source=. --remote=origin
git push -u origin master
git checkout -b update_logo
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg
(Get-Content src/App.js) -replace 'href=".*"', 'href="https://www.propelleraero.com/dirtmate/"' | Set-Content src/App.js
git add src/logo.svg src/App.js
git commit -m "Update logo and link"
git push -u origin update_logo
gh pr create --title "Update logo and link" --body "Replaced logo and updated link"
gh pr merge --merge
