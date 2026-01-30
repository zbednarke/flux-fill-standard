# Flux Fill Standard - RunPod Serverless Worker

RunPod serverless worker for Flux Fill inpainting using the original `flux1-fill-dev` model.

## Models Included

- **Diffusion Model**: `flux1-fill-dev.safetensors` (full precision, ~24GB)
- **VAE**: `ae.safetensors` (~335MB)
- **Text Encoders**: `clip_l.safetensors` + `t5xxl_fp16.safetensors` (~10GB)

## vs OneReward Version

| Model | Size | Quality | Speed |
|-------|------|---------|-------|
| flux1-fill-dev (this) | ~24GB | Original | Slower |
| OneReward fp8 | ~12GB | Enhanced | Faster |

## Deployment

1. Go to [RunPod Serverless](https://www.runpod.io/console/serverless)
2. **+ New Endpoint** → **GitHub Repo**
3. Select this repository
4. **Container Disk**: 60GB (larger model)
5. **GPU**: 24GB+ (RTX 4090, L40S, A5000)
6. Deploy

## GPU Requirements

- **VRAM**: 24GB recommended (larger model)
- **Disk**: 60GB container disk
