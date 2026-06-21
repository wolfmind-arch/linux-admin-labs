# Local AI Lab - Ollama, Open WebUI and AnythingLLM

## Objective

Build a local AI environment on Ubuntu for:

* Linux learning
* CompTIA A+ study
* Working with PDF documentation
* Testing local Large Language Models (LLMs)
* Comparing local AI with ChatGPT

---

## Environment

### Host System

Ubuntu Desktop

### Hardware

* Lenovo ThinkCentre M920x Tiny
* Intel Core i7-8700
* 16 GB RAM
* 512 GB SSD

---

## Technologies Used

### Docker

Container platform used to deploy AI applications.

Verify Docker installation:

```bash
docker --version
docker ps
```

---

### Ollama

Local LLM runtime.

Installation:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Check service:

```bash
systemctl status ollama
```

List installed models:

```bash
ollama list
```

Run model:

```bash
ollama run qwen3:4b
```

---

## Models Tested

### Qwen 3 4B

Advantages:

* Better reasoning
* Better technical explanations
* Good Linux knowledge

Disadvantages:

* Slower responses
* Higher RAM usage

Example:

```bash
ollama run qwen3:4b
```

---

### Gemma 3 1B

Advantages:

* Very fast
* Low resource requirements

Disadvantages:

* Less accurate
* Limited reasoning

Example:

```bash
ollama run gemma3:1b
```

---

## Open WebUI

Purpose:

Provide ChatGPT-like web interface for local models.

Docker deployment:

```bash
docker run -d \
-p 3000:8080 \
--add-host=host.docker.internal:host-gateway \
-v open-webui:/app/backend/data \
--name open-webui \
ghcr.io/open-webui/open-webui:main
```

Access:

```text
http://localhost:3000
```

Features:

* Chat interface
* Multiple models
* Conversation history
* User accounts

---

## AnythingLLM

Purpose:

RAG (Retrieval-Augmented Generation) using personal documents.

Docker deployment:

```bash
docker run -d \
-p 3001:3001 \
--name anythingllm \
mintplexlabs/anythingllm
```

Access:

```text
http://localhost:3001
```

---

## Knowledge Base Structure

Workspace:

```text
ai-knowledge/
├── linux/
├── bash/
├── git/
├── networking/
├── python/
└── comptia/
```

Documents imported:

* CompTIA A+
* Linux administration notes
* Bash scripting notes
* Networking materials
* PDF books

---

## Testing Results

### Local AI Advantages

* Works offline
* Full privacy
* No API costs
* Can use personal documents

### Local AI Disadvantages

* Slower than ChatGPT
* Lower reasoning quality
* Limited context window
* Requires local hardware resources

---

## Comparison with ChatGPT

### ChatGPT

Advantages:

* Better reasoning
* Better explanations
* Better troubleshooting
* Faster answers

### Local AI

Advantages:

* Offline access
* Private environment
* Can use custom knowledge base

---

## Linux Skills Practiced

Docker:

```bash
docker ps
docker logs
docker restart
docker stop
docker start
```

Networking:

```bash
ss -tuln
ip a
```

Services:

```bash
systemctl status ollama
```

Processes:

```bash
ps aux
```

---

## Lessons Learned

1. Local AI requires significant hardware resources.
2. Smaller models are faster but less accurate.
3. Docker simplifies deployment.
4. RAG improves responses when using personal documents.
5. ChatGPT still provides superior reasoning and troubleshooting.
6. Local AI is useful as a private study assistant.

---

## Commands Used

```bash
docker ps
docker logs
docker restart
docker stop
docker start

ollama list
ollama run qwen3:4b
ollama run gemma3:1b

systemctl status ollama

ss -tuln
ip a
ps aux
```

---

## Result

Successfully deployed:

* Ollama
* Open WebUI
* AnythingLLM

Tested local LLM models.

Created local AI study environment for Linux administration and CompTIA A+ learning.
