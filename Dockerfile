# Flux Fill Inpainting - RunPod Serverless Worker
# Only includes FLUX Fill models and LORA

FROM runpod/worker-comfyui:5.7.1-base

# =============================================================================
# LORA
# =============================================================================

# NSFW Master FLUX LoRA (164 MB)
RUN comfy model download \
    --url "https://storage.googleapis.com/parabolio-model-assets/loras/nsfw_master_flux.safetensors" \
    --relative-path models/loras \
    --filename nsfw_master_flux.safetensors

# =============================================================================
# FLUX FILL MODELS (~32.5 GB)
# =============================================================================

# Flux Fill Dev diffusion model (~23GB)
RUN comfy model download \
    --url https://huggingface.co/camenduru/FLUX.1-dev/resolve/main/flux1-fill-dev.safetensors \
    --relative-path models/diffusion_models \
    --filename flux1-fill-dev.safetensors

# Text encoders (CLIP L + T5-XXL, ~10GB total)
RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors \
    --relative-path models/text_encoders \
    --filename clip_l.safetensors

RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors \
    --relative-path models/text_encoders \
    --filename t5xxl_fp16.safetensors

# VAE (~335MB)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors \
    --relative-path models/vae \
    --filename ae.safetensors
