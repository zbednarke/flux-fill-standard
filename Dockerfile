# Flux Fill Inpainting (Standard) - RunPod Serverless Worker
# Uses flux1-fill-dev model (non-quantized, full precision)

FROM runpod/worker-comfyui:5.7.1-base

# Download diffusion model (Flux Fill Dev - from Comfy-Org public mirror)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/flux1-fill-dev/resolve/main/flux1-fill-dev.safetensors \
    --relative-path models/diffusion_models \
    --filename flux1-fill-dev.safetensors

# Download VAE (from Comfy-Org public mirror)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors \
    --relative-path models/vae \
    --filename ae.safetensors

# Download text encoders (CLIP L + T5-XXL)
RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors \
    --relative-path models/text_encoders \
    --filename clip_l.safetensors

RUN comfy model download \
    --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors \
    --relative-path models/text_encoders \
    --filename t5xxl_fp16.safetensors
