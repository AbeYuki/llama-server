#!/bin/bash

set -euo pipefail

: : "${MODEL:?MODEL must be set}"

mkdir -p ./models

for model in ${MODEL}; do
    if [ -f "./models/${model}" ]; then
        echo "Already exists: ${model}"
        continue
    fi

    echo "Downloading: ${model}"

    case "${model}" in
        Qwen_Qwen3.5-9B-Q4_K_M.gguf)
            hf download \
                bartowski/Qwen_Qwen3.5-9B-GGUF \
                "${model}" \
                --local-dir ./models
            ;;

        Qwen_Qwen3.5-27B-Q4_K_M.gguf)
            hf download \
                bartowski/Qwen_Qwen3.5-27B-GGUF \
                "${model}" \
                --local-dir ./models
            ;;

        Qwen_Qwen3.5-27B-Q5_K_M.gguf)
            hf download \
                bartowski/Qwen_Qwen3.5-27B-GGUF \
                "${model}" \
                --local-dir ./models
            ;;

        Qwen_Qwen3.5-35B-A3B-IQ4_XS.gguf)
            hf download \
                bartowski/Qwen_Qwen3.5-35B-A3B-GGUF \
                "${model}" \
                --local-dir ./models
            ;;

        *)
            echo "Error: Unknown model: ${model}" >&2
            exit 1
            ;;
    esac

    if [ ! -f "./models/${model}" ]; then
        echo "Error: Download completed but model was not found: ${model}" >&2
        exit 1
    fi

    echo "Downloaded: ${model}"
done