#!/bin/bash

cat > .env <<EOF
RENDER_GID=$(getent group render | cut -d: -f3)
MODEL=Qwen_Qwen3.5-35B-A3B-IQ4_XS.gguf
EOF

if [ ! -d .venv ]; then
    python3 -m venv .venv
fi

if [ -d .venv ]; then
    source .venv/bin/activate
    if [ $(which hf) ]; then
        echo "Hugging Face CLI is installed."
    else
        pip install huggingface_hub
    fi
fi


if [ -f .env ]; then
    export $(cat .env | xargs)
fi