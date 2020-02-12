# `@6river/prettier-config`

6 River Systems Prettier configuration.

## Installation

`npm install --save-dev @6river/prettier-config`

The simplest way to use it is `package.json`:

```json
"prettier": "@6river/prettier-config"
```

You can also use a standalone file like `.prettierrc.json`:

```json
"@6river/prettier-config"
```

To extend the configuration, use `.prettierrc.js`:

```javascript
module.exports = {
	...require("@6river/prettier-config"),
	semi: false
};
```

For more information, see [the Prettier documentation](https://prettier.io/docs/en/configuration.html#sharing-configurations).

### With ESLint

`npm install --save-dev eslint-config-prettier`

In your ESLint configuration, add `"prettier"` to `extends`. For example, with `.eslintrc.json` and [the 6 River ESLint configuration](https://github.com/6RiverSystems/eslint-config-6river):

```json
{
	"extends": ["6river", "prettier"]
}
```

If you are using Typescript and the ESLint plugin `@typescript-eslint/eslint-plugin`, add `"prettier/@typescript-eslint"`
to `extends` as well. For example, with `.eslintrc.json` and [the 6 River ESLint configuration](https://github.com/6RiverSystems/eslint-config-6river):

```json
{
	"extends": ["6river/typescript", "prettier", "prettier/@typescript-eslint"]
}
```

For more information, see [the `eslint-config-prettier` documentation](https://github.com/prettier/eslint-config-prettier#installation).

## Usage

### Editor Plugins

The most common way to use Prettier is through an editor plugin that automatically formats files on every save. If you use VS Code, the most popular Prettier plugin is [`esbenp.prettier-vscode`](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode).

There are Prettier plugins for most editors. See the full list on [prettier.io](https://prettier.io/).

### Commit Hooks

In projects that use Prettier, it can be useful to set up a commit hook to ensure that no new code is committed without being formatted. This can also be used for a gradual migration to Prettier.

To format staged files with Prettier before each commit, you can use [`pretty-quick`](https://github.com/azz/pretty-quick) with [`husky`](https://github.com/typicode/husky/).

`npm install --save-dev pretty-quick husky`

Add the following to `package.json`:

```json
"husky": {
	"hooks": {
		"pre-commit": "pretty-quick --staged"
	}
}
```

### Continuous Integration

To ensure that code is formatted as part of the continuous integration (CI) process, you can use [`pretty-quick`](https://github.com/azz/pretty-quick). Since `pretty-quick` only looks at changed files, it will only fail CI when there are unformatted files in the current branch.

Add the following to your CI configuration:

```shell
npx pretty-quick --check
```

Optionally, use [the `--branch` flag](https://github.com/azz/pretty-quick#--branch) to set the base branch to something other than `master`.

### Converting an Entire Project

To convert an entire project to Prettier format:

1. Add ignored directories and files to `.prettierignore`. Most of the time, this can be done with `cp .gitignore .prettierignore`.
2. Run the following command, adding or removing file extensions from the list to meet your needs:

```shell
npx prettier --write '**/*.{js,ts,md,json,yml,yaml,css,scss,less,graphql,mdx,jsx,tsx}'
```
