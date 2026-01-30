# Flux Fill Inpainting (Standard) - RunPod Serverless Worker
# Uses the original flux1-fill-dev model (not OneReward)

FROM runpod/worker-comfyui:5.7.1-base

# Download diffusion model (Flux Fill Dev - standard, ~24GB)
RUN comfy model download \
    --url https://huggingface.co/black-forest-labs/FLUX.1-Fill-dev/resolve/main/flux1-fill-dev.safetensors \
    --relative-path models/diffusion_models \
    --filename flux1-fill-dev.safetensors

# Download VAE (~335MB)
RUN comfy model download \
    --url https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors \
    --relative-path models/vae \
    --filename ae.safetensors

# Download text encoders (CLIP L + T5-XXL, ~10GB total)
RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors \
    --relative-path models/text_encoders \
    --filename clip_l.safetensors

RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors \
    --relative-path models/text_encoders \
    --filename t5xxl_fp16.safetensors
