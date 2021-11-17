# Using git commit hooks

What's the adage, why spent 2 minutes doing something when you can spend 2 hours automating it?

With [Husky](https://typicode.github.io/husky/#/), you can add any number of commit hooks to your repository so you can run commands before every commit. In my demo, I talked about how I added hooks for formatting my files and running my unit tests.

## Setting up Husky
Setting up Husky is incredibly easy as Husky provides a command that will install, initialize, and create all files needed for Husky to start working. There is a manual process if the single set up command doesn't work so if you run into problems, you can try the set up step by step.
```
npx husky-init && yarn
```

## Setting up Formatting
To set up [Prettier](https://prettier.io/), and [pretty-quick](https://github.com/azz/pretty-quick). If Prettier has already been set up in the repo, the only necessary package that should be added is pretty-quick.

### Yarn
```
yarn add --dev prettier pretty-quick
```
### NPM
```
npm install --save-dev prettier pretty-quick
```

This is just what I needed to set up Prettier in my repo as it was being added fresh. It can be added manually as well. 

**Mac Command**
```
echo '{"singleQuote": true}'> .prettierrc.json && echo '# Ignore artifacts: 
build
coverage'> .prettierignore
```

## Hooks
The hooks I used to set up the formatting and unit tests being run before every commit. Important to note that if you set up unit tests to run it should abort at the end. I ran into an issue where the command was watching for the tests to change and this caused my commit to never fail or succeed so it ran indefinitely.
This sets up the formatter. Notice how it uses `set` over `add` as the second command does. This is because this was the first hook I was adding. The `set` command will overwrite all commands in the file. I also had the files format first and the unit tests run second. This is because regardless of if the unit tests pass or fail, I want my files to be formatted. If any of the commands error out, the commit will be aborted and no other hooks will be run, therefore, my unit tests are run last. 
### Yarn
```
yarn husky set ./husky/pre-commit "npx pretty-quick --staged"
yarn husky add .husky/pre-commit "yarn test --watchAll=false"
```

### NPM
```
npx husky set ./husky/pre-commit "npx pretty-quick --staged"
npx husky add .husky/pre-commit "npm test --watchAll=false"
```
