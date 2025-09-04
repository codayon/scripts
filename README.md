# About

This project aims to make creating vite projects easier and faster. There will be more scripts to serve other purposes too.

## Quick Run

**About one.sh**: This script will check if you have a package manager installed (currently it only checks for pnpm and npm) then create a React.js app using vite and installs the dependencies. After that, it will setup Tailwind CSS and delete unnnecessary files and directories. Lastly, it will modify the App.jsx and displays a h1 which has no styling, and as we are using tailiwnd it should look like a paragraph.

```bash
bash <(curl -s https://raw.githubusercontent.com/codayon/vite-react.js/main/one.sh)
```

## Running Locally

```bash
git clone https://github.com/codayon/vite-react.js.git
cd vite-react.js
chmod +x one.sh
./one.sh
```

> **NOTE**: Your shell needs to be Bash (e.g., Git Bash or WSL on Windows).
