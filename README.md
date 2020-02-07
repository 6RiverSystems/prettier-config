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

For more, see [the Prettier documentation](https://prettier.io/docs/en/configuration.html#sharing-configurations).
