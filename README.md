# `Automated Deployments to IC Mainnet`

# Continuous Deployment to the Internet Computer

This guide will help you set up a continuous deployment (CD) pipeline for deploying your project to the Internet Computer using GitHub Actions. The pipeline is defined in a file named `cd.yml`.

## Prerequisites

- You need to have a GitHub account and a repository where your project is stored.
- You need to have the DFINITY Canister SDK (`dfx`) installed on your machine. If you don't have it installed, you can download it from the [DFINITY SDK documentation page](https://sdk.dfinity.org/docs/download.html).

## Steps

1. **Create a GitHub Actions Workflow**

   In your GitHub repository, create a new file under `.github/workflows/` named `cd.yml` and paste the provided code into it.

2. **Add a Secret Token in GitHub**

   The `cd.yml` file references a secret named `DFX_IDENTITY`. This secret should contain your exported identity file in base64 format.

   To add this secret:
   - Go to your GitHub repository and click on `Settings`.
   - Click on `Secrets` in the left sidebar.
   - Click on `New repository secret`.
   - Enter `DFX_IDENTITY` as the name.
   - For the value, you need to provide your exported identity file in base64 format. Follow the next step to create this.

3. **Export and Encode Your Identity**

   You can export your identity using the `dfx` command-line tool with the following command:

   ```bash
   dfx identity export identityname > exported_identity.pem
   ```

   Replace `identityname` with the name of your identity. Be careful with storing this file as it is not protected with your password.

   To convert this file into base64 format, you can use the `base64` command:

   ```bash
   base64 exported_identity.pem
   ```

   This will output a base64-encoded string. Copy this string and paste it as the value for the `DFX_IDENTITY` secret in GitHub.

4. **Push to Master**

   Once you have set up the `cd.yml` file and added the `DFX_IDENTITY` secret, you can trigger the CD pipeline by pushing to the `master` branch of your repository. The pipeline will automatically deploy your project to the Internet Computer.