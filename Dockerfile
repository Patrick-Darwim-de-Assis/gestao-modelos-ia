# ==========================================
# ETAPA 1: Compilação do Vue 3 (Build Stage)
# ==========================================
FROM node:18-alpine AS build-stage

# Define a pasta de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de dependências
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install

# Copia todo o código-fonte do projeto para dentro do contêiner
COPY . .

# Compila o projeto Vue 3 para produção (gera a pasta dist/)
RUN npm run build

# ==========================================
# ETAPA 2: Servidor Web Nginx (Production Stage)
# ==========================================
FROM nginx:alpine AS production-stage

# Copia os arquivos compilados da ETAPA 1 para a pasta padrão do Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expõe a porta 80 do contêiner
EXPOSE 80

# Comando para manter o Nginx rodando em primeiro plano
CMD ["nginx", "-g", "daemon off;"]