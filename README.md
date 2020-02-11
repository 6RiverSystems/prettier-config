# `@6river/prettier-config`

6 River Systems Prettier configuration.

## Usage

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
