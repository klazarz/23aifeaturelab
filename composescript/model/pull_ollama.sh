#!/bin/bash

ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

echo "🔴 Retrieving model..."
ollama pull llama3.2

#ollama pull deepseek-r1:1.5b

ollama pull gemma3:1b

ollama pull nomic-embed-text:v1.5

#ollama pull all-minilm
#ollama pull all-minilm
echo "🟢 Done!"

# Wait for Ollama process to finish.
wait $pid
