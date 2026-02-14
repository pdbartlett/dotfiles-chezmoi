#!/bin/bash

echo "🔍 Validating generated Taskfile..."

if command -v task &> /dev/null; then
    # 'task --list' returns non-zero if the YAML is invalid
    if task --list &> /dev/null; then
        echo "✅ Taskfile is valid."
    else
        echo "❌ Taskfile generation error! Check your apps.yaml for syntax issues."
        # Optional: Print the error to the terminal
        task --list
        exit 1
    fi
else
    echo "◈ Task not found, skipping validation."
fi
