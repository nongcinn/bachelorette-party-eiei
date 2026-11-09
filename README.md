# Belle's Bachelorette Party Planner

A small static website for collecting party preferences and availability.

## Important: how guest answers are saved

The current version stores answers in the browser's local storage. That means each guest sees only the answers saved in their own browser and device. Publishing the site makes the page available online, but does not create a shared guest list or calendar. Do not use this version to coordinate real group availability until shared storage has been added.

## Publish with GitHub Pages

This repository is prepared to deploy automatically from its `main` branch using GitHub Actions. The repository must be public for GitHub Pages on a GitHub Free account. The website itself is public once published.

### One-time setup

1. Create or sign in to your GitHub account at [github.com](https://github.com/).
2. Install [GitHub Desktop](https://desktop.github.com/) and sign in to it with your GitHub account. Never share your password or an access token.
3. In GitHub Desktop, choose **File → Add Local Repository…** and select this project folder, `Bachelorette Party`.
4. Choose **Publish repository**. Give it a name, such as `belle-bachelorette-planner`. Turn off **Keep this code private** so the repository is public, then publish it.
5. On GitHub.com, open the new repository and choose **Settings → Pages**.
6. Under **Build and deployment**, set **Source** to **GitHub Actions**.
7. Open the **Actions** tab and wait for **Deploy to GitHub Pages** to finish successfully. The first deployment may take a few minutes.
8. The published address will look like `https://YOUR-GITHUB-USERNAME.github.io/REPOSITORY-NAME/`. GitHub also shows the exact link under **Settings → Pages**.

### Publish future changes

After editing files, open the project in GitHub Desktop, write a short summary in the **Summary** box, choose **Commit to main**, then choose **Push origin**. The Pages workflow will publish the new version automatically.

## Project files

- `index.html` — the website
- `.github/workflows/deploy.yml` — automatic GitHub Pages deployment
