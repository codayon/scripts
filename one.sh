#!/bin/bash

set -euo pipefail

if command -v pnpm >/dev/null 2>&1; then
	pm="pnpm"
	create_args=(create vite)
	extra_args=(--template react --no-interactive)
	extra_packages=(add tailwindcss @tailwindcss/vite)
elif command -v yarn >/dev/null 2>&1; then
    pm="yarn"
    create_args=(create vite)
    extra_args=(--template react --no-interactive)
    extra_packages=(add tailwindcss @tailwindcss/vite)
elif command -v npm >/dev/null 2>&1; then
	pm="npm"
	create_args=(create vite@latest)
	extra_args=(-- --template react --no-interactive)
	extra_packages=(install tailwindcss @tailwindcss/vite)
else
	echo "Please install a package manager."
	exit 1
fi

if [[ -z "${1-}" ]]; then
    read -p "Enter project name (default: my-app): " app_name
    app_name=${app_name:-my-app}
else
    app_name=$1
fi

$pm "${create_args[@]}" "$app_name" "${extra_args[@]}"
cd "$app_name"
$pm install
$pm "${extra_packages[@]}"

rm -rf ./public ./README.md ./src/assets ./src/App.css
sed -i "2a\import tailwindcss from '@tailwindcss/vite'" ./vite.config.js
sed -i 's|react()|react(), tailwindcss()|' ./vite.config.js
sed -i 's|/vite.svg|https://vite.dev/logo.svg|' ./index.html
echo '@import "tailwindcss";' > ./src/index.css

cat <<EOF > ./src/App.jsx
const App = () => {
  return <h1>working</h1>;
};

export default App;
EOF
