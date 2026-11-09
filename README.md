# Belle's Bachelorette Party Planner

A small static website for collecting party preferences and availability.

## Shared planner data

Guest responses are stored in Supabase and update across devices in real time. The site uses the Supabase publishable key in the browser; that key is designed to be public and must be paired with the row-level security rules in `supabase/setup.sql`.

**Privacy note:** this link-based version lets anyone who can access the website view and edit the planner. Only share the site link with the intended guests. If you need access limited to invited people, add sign-in or another server-verified access check before sharing.

### Configure Supabase once

1. Create a Supabase project and keep its database password private.
2. In the Supabase dashboard, open **SQL Editor → New query**.
3. Open `supabase/setup.sql` in this project, copy all of its contents into the SQL Editor, and click **Run**. This creates the shared state table, its policies, and its Realtime publication entry.
4. Open the website and confirm the status badge says **Shared planner · live**. The first visit creates Belle's initial planner record.

The website is already configured with the Project URL and publishable key for this Supabase project. Never put a Supabase secret or service-role key in this repository.

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
- `supabase/setup.sql` — shared data table, access policies, and Realtime setup
