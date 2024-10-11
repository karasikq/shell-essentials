#!/bin/sh

export OLLAMA_HOST=0.0.0.0
export STORAGE_LOCATION=$HOME/.local/share/anythingllm

echo "Starting ollama..."
gnome-terminal -- ollama serve

echo "Run anythingllm container..."
mkdir -p $STORAGE_LOCATION
touch "$STORAGE_LOCATION/.env"
docker run -d -p 3001:3001 \
--cap-add SYS_ADMIN \
-v ${STORAGE_LOCATION}:/app/server/storage \
-v ${STORAGE_LOCATION}/.env:/app/server/.env \
-e STORAGE_DIR="/app/server/storage" \
mintplexlabs/anythingllm
echo "Complete."
