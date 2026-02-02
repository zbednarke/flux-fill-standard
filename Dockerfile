# Flux Fill Inpainting + Z Image Turbo - RunPod Serverless Worker
# Includes both FLUX Fill and Z Image Turbo workflows

FROM runpod/worker-comfyui:5.7.1-base

# =============================================================================
# LORAS (FIRST - fail fast if Civitai token is missing/invalid)
# =============================================================================

# Note: Civitai requires API token - pass as build arg
ARG CIVITAI_API_TOKEN=""

# Download NSFW Master FLUX LoRA for Z-Image Turbo (1.16 GB)
RUN comfy model download \
    --url "https://civitai.com/api/download/models/2607212?type=Model&format=SafeTensor&token=${CIVITAI_API_TOKEN}" \
    --relative-path models/loras \
    --filename nsfw_master_flux_z_image_turbo.safetensors

# Download NSFW Master FLUX LoRA for FLUX.1 (164 MB)
RUN comfy model download \
    --url "https://civitai.com/api/download/models/746602?type=Model&format=SafeTensor&token=${CIVITAI_API_TOKEN}" \
    --relative-path models/loras \
    --filename nsfw_master_flux.safetensors

# =============================================================================
# FLUX FILL INPAINTING MODELS (~32.5 GB)
# =============================================================================

# Download diffusion model (Flux Fill Dev - from camenduru public mirror)
RUN comfy model download \
    --url https://huggingface.co/camenduru/FLUX.1-dev/resolve/main/flux1-fill-dev.safetensors \
    --relative-path models/diffusion_models \
    --filename flux1-fill-dev.safetensors

# Download text encoders for FLUX (CLIP L + T5-XXL)
RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors \
    --relative-path models/text_encoders \
    --filename clip_l.safetensors

RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors \
    --relative-path models/text_encoders \
    --filename t5xxl_fp16.safetensors

# =============================================================================
# Z IMAGE TURBO MODELS (~19.5 GB)
# =============================================================================

# Download Z Image Turbo diffusion model (BF16)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors \
    --relative-path models/diffusion_models \
    --filename z_image_turbo_bf16.safetensors

# Download Qwen 3 4B text encoder for Z Image Turbo
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors \
    --relative-path models/text_encoders \
    --filename qwen_3_4b.safetensors

# =============================================================================
# SHARED MODELS
# =============================================================================

# Download VAE (shared by both workflows)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors \
    --relative-path models/vae \
    --filename ae.safetensors
