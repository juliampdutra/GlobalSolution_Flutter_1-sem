# 🌿 Florestae

Monitoramento ambiental do Brasil em tempo real.

Aplicação Flutter desenvolvida para o monitoramento de desmatamento e emissões de carbono no Brasil. Através de dados mockados de satélites e sensores ambientais, o app permite visualizar áreas críticas e acompanhar as principais fontes de emissão de CO₂ por categoria e bioma.

**Desenvolvido por:** Julia Dutra - RM 557645 • Vitor Portela - RM 554540  
**Instituição:** FIAP — Global Solution 2026  

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Fluxo de Telas](#-fluxo-de-telas)

---

## 🌱 Sobre o Projeto

O **Florestae** é uma solução mobile/web voltada ao monitoramento ambiental brasileiro. A aplicação exibe áreas desmatadas filtradas por bioma (Amazônia, Cerrado, Mata Atlântica, Pantanal, Caatinga), apresenta dados de emissões de CO₂ por categoria e oferece detalhes por região monitorada, com status de criticidade (Crítico, Alerta, Moderado, Estável).

---

## ✨ Funcionalidades

- **Onboarding** com apresentação guiada das principais funcionalidades
- **Monitoramento de áreas desmatadas** com status de criticidade
- **Filtro por bioma** (Todos, Amazônia, Cerrado, Mata Atlântica, Pantanal, Caatinga)
- **Detalhes por área** com hectares desmatados e emissões de CO₂
- **Rastreamento de emissões de CO₂** por categoria (Uso do Solo, Agricultura, Transporte, Energia, Indústria, Resíduos)
- **Tela "Sobre"** com informações do projeto e dos desenvolvedores

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                        # Ponto de entrada, configuração do tema
├── model/
│   ├── monitored_area.dart          # Modelo de área monitorada
│   └── carbon_emission.dart         # Modelo de emissão de carbono
├── navigation/
│   ├── app_routes.dart              # Definição de rotas nomeadas
│   └── app_navigation.dart          # Geração de rotas e passagem de argumentos
├── repository/
│   ├── monitored_area_repository.dart    # Dados mockados de áreas
│   └── carbon_emission_repository.dart   # Dados mockados de emissões
└── ui/
    ├── components/
    │   ├── app_logo.dart            # Logo da aplicação
    │   ├── area_card.dart           # Card de área monitorada
    │   ├── emission_card.dart       # Card de emissão de carbono
    │   ├── eco_top_app_bar.dart     # AppBar principal
    │   └── eco_detail_top_app_bar.dart  # AppBar de detalhe
    └── screens/
        ├── splash_screen.dart       # Tela de splash
        ├── intro_screen.dart        # Telas de onboarding
        ├── home_screen.dart         # Tela principal (lista de áreas)
        ├── area_detail_screen.dart  # Detalhe de área monitorada
        ├── emissions_screen.dart    # Lista de emissões de carbono
        └── about_screen.dart        # Sobre o projeto
```

---

## 📱 Fluxo de Telas

O fluxo da aplicação segue a sequência abaixo:

```
Splash → Onboarding (4 slides) → Home → Detalhe da Área
                                      → Emissões de Carbono
                                      → Sobre o Florestae
```

---

### Tela 1 — Splash Screen

Tela de boas-vindas exibida na inicialização do app. Apresenta a logo do Florestae com o slogan "Monitoramento ambiental do Brasil em tempo real." e avança para o onboarding. Com temporizador de 3 segundos para passar para próxima tela sozinho.

> **Rota:** `/` 

![Tela 1 - Splash](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/0f9223c86cfc76e63842f9c13dee076ed51214fa/tela1_.png)

---

### Tela 2 — Onboarding: Bem-vindo ao Florestae

Primeiro slide do onboarding com a ilustração do Satélite. Introduz o conceito do app ao usuário. Com temporizador de 3 segundos para passar para próxima tela sozinho. Também possui botões **Voltar** e **Próximo**.
> **Rota:** `/intro` 

![Tela 2 - Onboarding 1](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/0f9223c86cfc76e63842f9c13dee076ed51214fa/tela2_.png)

---

### Tela 3 — Onboarding: Monitoramento  de CO₂

Segundo slide do onboarding. Apresenta o ícone de CO₂ e informa que o app permite acompanhar as fontes de emissão por categoria. Com temporizador de 3 segundos para passar para próxima tela sozinho. Também possui botões **Voltar** e **Próximo**.

> **Rota:** `/intro` 

![Tela 3 - Onboarding 2](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/0f9223c86cfc76e63842f9c13dee076ed51214fa/tela3_.png)
---

### Tela 4 — Onboarding: Dados por Bioma

Quarto e último slide do onboarding. Apresenta o ícone de gráfico de barras e informa que é possível filtrar por Amazônia, Cerrado, Mata Atlântica e mais. Com temporizador de 3 segundos para passar para próxima tela sozinho. Também possui botão **Começar** que navega para a tela principal.

> **Rota:** `/intro`

![Tela 4 - Onboarding 3](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/0f9223c86cfc76e63842f9c13dee076ed51214fa/tela4_.png)

---

### Tela 5 — Home: Áreas Monitoradas

Tela principal do app. Exibe a lista de áreas monitoradas com chips de filtro por bioma no topo. Cada card mostra nome, bioma, hectares desmatados, emissões de CO₂ e badge de status (Crítico, Alerta, Moderado, Estável). No canto superior direito há atalho para **Emissões de Carbono** e botão de **Informações**.

> **Rota:** `/home`

| Campo | Descrição |
|---|---|
| Nome | Identificação da região (ex: Pará - Região Sul) |
| Bioma | Bioma ao qual pertence (ex: Amazônia) |
| Hectares | Área desmatada em ha |
| CO₂ | Emissões em toneladas |
| Status | Crítico / Alerta / Moderado / Estável |

![Tela 5 - Home](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/8bff957d29d67acd13778ed50535a5c38e1e4969/tela5.jpeg)

---

### Tela 6 — Detalhe da Área

Exibe os detalhes completos de uma área selecionada: nome, bioma, badge de status, cards com hectares desmatados e emissões de CO₂, e descrição detalhada da situação da área. Os dados são passados via argumento de navegação (`MonitoredArea`).

> **Rota:** `/area-detail`

![Tela 6 - Detalhe da Área](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/8bff957d29d67acd13778ed50535a5c38e1e4969/tela6.jpeg)

---

### Tela 7 — Emissões de Carbono

Lista todas as fontes de emissão de CO₂ com filtro por categoria (Todas, Uso do Solo, Agricultura, Transporte, Energia, Indústria, Resíduos). Cada card exibe nome da fonte, categoria, descrição e volume em toneladas de CO₂.

> **Rota:** `/emissions`

![Tela 7 - Emissões](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/8bff957d29d67acd13778ed50535a5c38e1e4969/tela7.jpeg)

---

### Tela 8 — Sobre o Florestae

Exibe informações sobre o projeto: logo, versão, descrição, lista de funcionalidades e os desenvolvedores responsáveis.

> **Rota:** `/about`

![Tela 8 - Sobre](https://github.com/juliampdutra/GlobalSolution_Flutter_1-sem/blob/8bff957d29d67acd13778ed50535a5c38e1e4969/tela8.jpeg)


