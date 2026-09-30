# 🤖 Plataforma de Monitoramento de Modelos de IA

> Dashboard reativo desenvolvido em Vue 3 para gestão e acompanhamento do ciclo de vida de modelos de Inteligência Artificial, Visão Computacional e Processamento de Linguagem Natural.

![Vue.js](https://img.shields.io/badge/Vue.js-3.x-4fc08d?style=flat&logo=vuedotjs)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-f7df1e?style=flat&logo=javascript)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ed?style=flat&logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Deployed-326ce5?style=flat&logo=kubernetes)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

---

## 🔗 Links de Acesso

- 🌐 **Produção (GitHub Pages):** [https://patrick-darwim-de-assis.github.io/gestao-modelos-ia/](https://patrick-darwim-de-assis.github.io/gestao-modelos-ia/)
- 🐳 **Docker Hub Registry:** [patrickdarwimdeassis/dashboard-vue](https://hub.docker.com/r/patrickdarwimdeassis/dashboard-vue)

---

## 📌 Sobre o Projeto

Este repositório contém uma aplicação web interativa focada no monitoramento em tempo real de modelos de Machine Learning (como **YOLOv8** e **BERT**). O projeto foi desenvolvido como demonstração de competência técnica em desenvolvimento front-end reativo, integração CI/CD, containerização e orquestração de microsserviços em ambiente Kubernetes.

### Funcionalidades
- ➕ **Cadastro Dinâmico:** Inclusão de novos modelos definindo nome, categoria e taxa de acurácia.
- 📊 **Gestão de Estado Reativa:** Acompanhamento automático de métricas e status de treinamento sem recarregamento de página.
- 🗑️ **Remoção de Itens:** Gerenciamento da lista com remoção individual por índice.
- 📱 **Interface Responsiva:** Layout moderno estruturado com CSS Grid para exibição em cartões (*cards*).

---

## 🛠️ Tecnologias Utilizadas

- **[Vue 3](https://vuejs.org/)** — Framework JavaScript progressivo com Composition API (`<script setup>`).
- **[Docker](https://www.docker.com/)** — Containerização de aplicação SPA com Nginx em multi-stage build.
- **[Kubernetes](https://kubernetes.io/)** — Orquestração de contêineres via Deployment e Service (NodePort).
- **[GitHub Actions](https://github.com/features/actions)** — Pipeline de CI/CD para automação de build e publicação da imagem no Docker Hub.
- **GitHub Pages** — Deploy de versão estática.

---

## 🐳 Containerização & Kubernetes (K8s)

A aplicação foi totalmente estruturada para ambientes de contêineres e microsserviços.

### **1. Build e Execução Local com Docker**

    
    # Construir a imagem Docker
    docker build -t patrickdarwimdeassis/dashboard-vue:latest .

    # Rodar o contêiner na porta 8080
    docker run -d -p 8080:80 patrickdarwimdeassis/dashboard-vue:latest

**2. Implantação em Cluster Kubernetes**
Para implantar no Kubernetes (Killercoda, Minikube, EKS, etc.), utilize o manifesto YAML abaixo:


    YAML
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: dashboard-vue
    spec:
    replicas: 1
    selector:
        matchLabels:
        app: dashboard-vue
    template:
        metadata:
        labels:
            app: dashboard-vue
        spec:
        containers:
        - name: dashboard-vue
            image: patrickdarwimdeassis/dashboard-vue:latest
            ports:
            - containerPort: 80
    ---
    apiVersion: v1
    kind: Service
    metadata:
    name: dashboard-vue
    spec:
    type: NodePort
    ports:
    - port: 80
        targetPort: 80
        nodePort: 30080
    selector:
        app: dashboard-vue

**Comandos de implantação no cluster**:

    
    # Criar Deployment e Service
    kubectl apply -f k8s/deployment.yaml

    # Forçar execução no nó controlplane (caso necessário)
    kubectl patch deployment dashboard-vue -p '{"spec":{"template":{"spec":{"nodeName":"controlplane"}}}}'

    # Testar resposta interna do serviço
    curl localhost:30080

🚀 **Como Executar o Projeto Localmente**

**Pré-requisitos**
Certifique-se de ter instalado em sua máquina o Node.js e o Git.

**Passo a Passo**-
**Clone o repositório**:

    
    git clone [https://github.com/Patrick-Darwim-de-Assis/gestao-modelos-ia.git](https://github.com/Patrick-Darwim-de-Assis/gestao-modelos-ia.git)

**Acesse a pasta do projeto**:

    
    cd gestao-modelos-ia

**Instale as dependências**:

    
    npm install

**Inicie o servidor de desenvolvimento**:

    
    npm run serve

**Acesse no navegador**: http://localhost:8080/

📦 **Deploy no GitHub Pages**

Caso realize alterações e deseje atualizar a versão estática no GitHub Pages:

    
    npm run deploy
    
Desenvolvido por **Patrick Darwim de Assis**.
