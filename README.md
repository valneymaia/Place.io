# Place.io 📍

> Descubra e avalie os melhores lugares da sua cidade!

**Place.io** é um aplicativo iOS desenvolvido em SwiftUI que permite explorar locais (restaurantes, pontos turísticos, etc.), salvá-los nos favoritos, avaliar e comentar — tudo em uma interface moderna e intuitiva.

---

## 📱 Funcionalidades

| Tela | Descrição |
|------|-----------|
| **Mapa** | Visualize todos os lugares cadastrados no mapa. Filtre por categoria (Restaurante, Ponto Turístico) e navegue até a página de detalhes de cada local. |
| **Tinder** | Deslize para a direita para salvar um lugar nos favoritos, ou para a esquerda para descartá-lo — estilo Tinder. |
| **Lista** | Pesquise lugares pelo nome e acesse detalhes rapidamente. |
| **Detalhes** | Veja foto, endereço, telefone, horário de funcionamento, média de avaliação e comentários de cada local. |
| **Avaliação** | Avalie um local de 1 a 5 estrelas e deixe um comentário. |

---

## 🗂️ Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)**:

```
Projeto/Place.io/Place.io/
├── Place_ioApp.swift        # Ponto de entrada do app
├── ContentView.swift        # TabView principal (Mapa, Tinder, Lista)
│
├── Model.swift              # Modelos de dados (Local, dia, comenta, RatingModel)
│
├── ViewModel.swift          # ViewModel principal — busca e atualiza locais via API
├── RatingViewModel.swift    # ViewModel de avaliação por estrelas
│
├── MapView.swift            # Tela de mapa com filtros por categoria
├── TinderView.swift         # Tela de swipe para favoritar/descartar locais
├── ListView.swift           # Tela de lista com busca por nome
├── InfoView.swift           # Tela de detalhes do local
├── CommentsView.swift       # Tela de comentários do local
├── AvaliationView.swift     # Tela de avaliação (estrelas + comentário)
└── RatingButton.swift       # Componente reutilizável de botão de estrela
```

---

## 🛠️ Tecnologias

- **Swift 5** / **SwiftUI**
- **MapKit** — exibição de mapa e anotações
- **Node-RED** — backend para armazenamento e atualização dos dados dos locais
- **URLSession** — comunicação com a API REST

---

## ▶️ Como executar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/valneymaia/Place.io.git
   ```
2. **Abra o projeto no Xcode:**
   ```
   Projeto/Place.io/Place.io.xcodeproj
   ```
3. **Configure a URL da API** em `ViewModel.swift` para apontar para o endereço IP do seu servidor Node-RED:
   ```swift
   URL(string: "http://<SEU_IP>:1880/read")
   ```
4. **Execute** no simulador ou em um dispositivo físico com iOS 17+.

---

## 🎬 Demonstração

[![Vídeo de demonstração](https://img.shields.io/badge/▶️%20Ver%20Demo-YouTube-red?logo=youtube)](https://youtube.com/shorts/hOszJRLpDiI?si=kAFIZA4gnT8KrXSy)

---

## 📄 Apresentação

O arquivo `Placeio apresentacao.pdf` contém os slides de apresentação do projeto.

---

## 👥 Equipe

Desenvolvido pela **Turma 02** durante o programa Apple Developer Academy.
