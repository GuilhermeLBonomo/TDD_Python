# Meu primeiro Dockerfile
# Usar a imagem oficial do Python 3.11 como base
FROM python:3.11-slim

# Definir variáveis de ambiente
# 1. Impede que o Python escreva arquivos .pyc
ENV PYTHONDONTWRITEBYTECODE 1

# 2. Garante que o output do Python seja exibido imediatamente
ENV PYTHONUNBUFFERED 1

# Instalar dependências do sistema necessárias
RUN apt-get update && \
    apt-get install -y \
    gcc \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    wget \
    unzip \
    firefox-esr \
    && rm -rf /var/lib/apt/lists/*

# Baixar e instalar o GeckoDriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz && \
    tar -xzf geckodriver-v0.35.0-linux64.tar.gz && \
    mv geckodriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-v0.35.0-linux64.tar.gz

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos de requisitos e instalá-los
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Comando para iniciar a aplicação (ajuste conforme necessário)
CMD ["bash"]

