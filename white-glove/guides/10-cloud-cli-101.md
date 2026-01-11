# intent solutions io
---

# Cloud CLI 101: Terminal Deployments
*For users familiar with AWS, GCP, or Vercel dashboards.*

## Why Use CLI?

You've been clicking through cloud dashboards. Now you'll type commands instead.

| Dashboard | CLI |
|-----------|-----|
| Click through menus | Type one command |
| Screenshots for docs | Commands are self-documenting |
| Hard to repeat | Easy to script |
| Slow | Fast |

## Google Cloud (gcloud)

### Install
```bash
# Mac with Homebrew
brew install google-cloud-sdk

# Verify
gcloud --version
```

### First Login
```bash
gcloud auth login
```
Browser opens. Sign in. Done.

### Set Project
```bash
# List projects
gcloud projects list

# Set default
gcloud config set project your-project-id
```

### Common Commands
```bash
# Deploy Cloud Run
gcloud run deploy myapp --source .

# Deploy Cloud Function
gcloud functions deploy myfunction --runtime python312 --trigger-http

# List services
gcloud run services list

# View logs
gcloud logging read "resource.type=cloud_run_revision"
```

## AWS CLI

### Install
```bash
# Mac with Homebrew
brew install awscli

# Verify
aws --version
```

### Configure
```bash
aws configure
# Enter: Access Key, Secret Key, Region, Output format
```

### Common Commands
```bash
# List S3 buckets
aws s3 ls

# Upload to S3
aws s3 cp myfile.txt s3://mybucket/

# Deploy Lambda
aws lambda update-function-code --function-name myfunction --zip-file fileb://function.zip

# View logs
aws logs tail /aws/lambda/myfunction --follow
```

## Vercel CLI

### Install
```bash
npm install -g vercel

# Verify
vercel --version
```

### First Login
```bash
vercel login
```

### Common Commands
```bash
# Deploy
vercel

# Deploy to production
vercel --prod

# List deployments
vercel ls

# View logs
vercel logs your-project.vercel.app
```

## Environment Variables

### The .env Pattern

Create `.env` file in project root:
```bash
# .env (never commit this)
DATABASE_URL=postgres://user:pass@host:5432/db
API_KEY=sk-abc123
SECRET_KEY=mysecret
```

**Important:** Add to `.gitignore`:
```bash
echo ".env" >> .gitignore
```

### Setting in Cloud

**Google Cloud Run:**
```bash
gcloud run deploy myapp --set-env-vars="KEY1=value1,KEY2=value2"
```

**AWS Lambda:**
```bash
aws lambda update-function-configuration \
  --function-name myfunction \
  --environment "Variables={KEY1=value1,KEY2=value2}"
```

**Vercel:**
```bash
vercel env add VARIABLE_NAME
# Or in vercel.json
```

## Using Claude Code with Cloud

### Deploy with Confidence
```
I want to deploy this project to Cloud Run.
Read my code and tell me what environment variables I need.
Then give me the gcloud deploy command.
```

### Debug Deployments
```
My Cloud Run deployment failed.
Here's the error: [paste error]
What's wrong and how do I fix it?
```

### Generate Infrastructure
```
I need a Cloud Run service that:
- Runs this Python app
- Connects to Cloud SQL
- Has 2GB memory
- Scales 0-10 instances

Give me the gcloud command.
```

## Quick Reference

### Google Cloud
| Task | Command |
|------|---------|
| Login | `gcloud auth login` |
| Set project | `gcloud config set project ID` |
| Deploy Cloud Run | `gcloud run deploy NAME --source .` |
| View logs | `gcloud logging read "resource.type=..."` |
| List services | `gcloud run services list` |

### AWS
| Task | Command |
|------|---------|
| Configure | `aws configure` |
| List S3 | `aws s3 ls` |
| Upload S3 | `aws s3 cp file s3://bucket/` |
| Deploy Lambda | `aws lambda update-function-code` |
| View logs | `aws logs tail /aws/lambda/name` |

### Vercel
| Task | Command |
|------|---------|
| Login | `vercel login` |
| Deploy preview | `vercel` |
| Deploy production | `vercel --prod` |
| List projects | `vercel ls` |
| Add env var | `vercel env add NAME` |

## From Dashboard to CLI

### Deployment
**Before:** Click Deploy → Select branch → Wait → Check status
**After:** `vercel --prod` (done)

### Logs
**Before:** Click Monitoring → Logs → Filter → Search
**After:** `gcloud logging read "text:error" --limit 50`

### Environment Variables
**Before:** Settings → Environment → Add Variable → Save
**After:** `vercel env add API_KEY`

## Common Patterns

### Deploy and Check
```bash
gcloud run deploy myapp --source . && gcloud run services describe myapp
```

### Quick Rollback
```bash
# Vercel - list revisions and promote previous
vercel ls
vercel promote [deployment-url]

# Cloud Run - list revisions
gcloud run revisions list
gcloud run services update-traffic myapp --to-revisions=REVISION=100
```

### Watch Logs Live
```bash
# Cloud Run
gcloud logging tail "resource.type=cloud_run_revision"

# AWS Lambda
aws logs tail /aws/lambda/myfunction --follow

# Vercel
vercel logs your-project.vercel.app --follow
```

---
january 2026 · v.00.00.01
