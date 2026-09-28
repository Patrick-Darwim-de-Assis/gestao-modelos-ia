<template>
  <div id="app" class="container">
    <header class="header">
      <h1>Plataforma de Monitoramento de IA</h1>
      <p>Projeto TT-IV-A / Fapesp</p>
    </header>

    <!-- Formulário para cadastrar novo modelo -->
    <section class="form-section">
      <h2>Cadastrar Novo Modelo</h2>
      <form @submit.prevent="adicionarModelo">
        <input
          type="text"
          v-model="novoNome"
          placeholder="Nome do Modelo"
          required
        />
        <select v-model="novaCategoria">
          <option value="Visão Computacional">Visão Computacional</option>
          <option value="Processamento de Linguagem Natural">Processamento de Linguagem Natural</option>
          <option value="Análise de Dados Tabulares">Análise de Dados Tabulares</option>
        </select>
        <input
          type="number"
          step="0.01"
          v-model="novaAcuracia"
          placeholder="Acurácia (ex.: 0.95)"
          required
        />
        <button type="submit">Adicionar Modelo</button>
      </form>
    </section>

    <!-- Lista de Modelos Cadastrados -->
     <section class="list-section">
      <h2>Modelos de Execução</h2>
      <div class="cards-grid">
        <div
          v-for="(modelo, index) in listaModelos"
          :key="index"
          class="card"
        >
          <h3>{{ modelo.nome }}</h3>
          <p><strong>Categoria:</strong> {{ modelo.categoria }}</p>
          <p><strong>Acurácia:</strong> {{ (modelo.acuracia * 100).toFixed(1) }}%</p>
          <p><strong>Status:</strong> {{ modelo.status }}</p>
          <button @click="removerModelo(index)" class="btn-delete">Remover</button>
        </div>
      </div>
     </section>
  </div>
</template>

<script setup>
  import { ref } from 'vue';
  // 1. Array reativo com os modelos iniciais
  const listaModelos = ref([
    { nome: 'YOLOv8 - Detect de Folhas', categoria: 'Visão Computacional', acuracia: 0.94, status: 'Concluído' },
    { nome: 'BERT - Análise de Texto', categoria: 'Processamento de Linguagem Natural', acuracia: 0.88, status: 'Treinando' }
  ]);

  // 2. Variáveis para controlar os campos do formulário
  const novoNome = ref('');
  const novaCategoria = ref('Visão Computacional');
  const novaAcuracia = ref('');

  // Função para adicionar um novo modelo
  const adicionarModelo = () => {
    if (novoNome.value && novaAcuracia.value) {
      listaModelos.value.push({
        nome: novoNome.value,
        categoria: novaCategoria.value,
        acuracia: parseFloat(novaAcuracia.value),
        status: 'Treinando'
      });

      // Limpar os campos do formulário
      novoNome.value = '';
      novaAcuracia.value = '';
    }
  };

  // Função para remover um modelo pelo índice
  const removerModelo = (index) => {
    listaModelos.value.splice(index, 1);
  }
</script>

<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f7f6;
    margin: 0;
    padding: 20px;
  }

  .container {
    max-width: 900px;
    margin: 0 auto;
  }

  .header {
    text-align: center;
    margin-bottom: 30px;
  }

  .form-section, .list-section {
    background: white;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  form {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
  }

  input, select, button {
    padding: 10px;
    font-size: 14px;
  }

  button {
    background-color: #2c3e50;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 4px;
  }

  .cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 15px;
  }

  .card {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 6px;
    background-color: #fafafa;
  }

  .btn-delete {
    background-color: #e74c3c;
    margin-top: 10px;
  }
</style>
