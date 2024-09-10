_# 🎬 Filme Flix

**Filme Flix** é um aplicativo simples em Flutter que permite aos usuários buscar por filmes e obter detalhes como título, ano, diretor, classificação, e muito mais utilizando a **OMDb API**.

## 📖 Índice

- [Sobre](#sobre)
- [Funcionalidades](#funcionalidades)
- [Como Começar](#como-começar)
- [Integração com a API](#integração-com-a-api)
- [Instalação](#instalação)
- [Uso](#uso)
- [Capturas de Tela](#capturas-de-tela)
- [Contribuição](#contribuição)
- [Licença](#licença)

## 📜 Sobre

**Filme Flix** foi criado para demonstrar como integrar Flutter com uma API REST, especificamente a **OMDb API**. O aplicativo permite que os usuários busquem filmes pelo título e visualizem informações detalhadas, como:

- Título do filme
- Ano de lançamento
- Diretor
- Classificação no IMDb
- Imagem do pôster

## ✨ Funcionalidades

- 🔍 **Buscar filmes** pelo título.
- 🎥 **Exibir detalhes do filme** incluindo ano, diretor e classificação do IMDb.
- 🖼️ **Exibir pôsteres dos filmes** diretamente da API.
- 🚀 **Integração rápida e simples com API** usando a OMDb API.

## 🚀 Como Começar

Para obter uma cópia local do projeto e colocá-lo para rodar, siga os passos abaixo.

### Pré-requisitos

Certifique-se de ter o seguinte instalado:

- **Flutter SDK**: [Instalar Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio** ou **VSCode** com os plugins de Flutter/Dart
- Uma **chave de API válida da OMDb** (Você pode obter [aqui](http://www.omdbapi.com/apikey.aspx))

### Integração com a API

O projeto usa a OMDb API para obter os detalhes dos filmes. Você precisará adicionar sua chave de API para fazer as requisições.

1. Registre-se e obtenha sua chave de API em [OMDb API](http://www.omdbapi.com/apikey.aspx).
2. Adicione sua chave de API no código onde as requisições são feitas:

```dart
final String apiKey = 'SUA_API_KEY_AQUI';  // Substitua pela sua chave de API
```

## 🔧 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/seuusuario/FilmeFlix.git
```

2. Navegue até o diretório do projeto:

```bash
cd FilmeFlix
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o aplicativo:

```bash
flutter run
```

## 🔧 Uso

Depois que o aplicativo estiver rodando, você pode:
- Buscar por um filme digitando o título na barra de busca.
- Visualizar os detalhes do filme como ano de lançamento, diretor, classificação no IMDb, e mais.
- Ver os pôsteres dos filmes buscados diretamente da API.

## 🖼️ Capturas de Tela

Vazio

## 💡 Funcionalidades Futuras

- 🔥 Favoritar filmes: Permitir que os usuários salvem seus filmes favoritos localmente.
- 📱 Design responsivo: Melhorar a UI para diferentes tamanhos de tela.
- 🛠️ Modo offline: Cache dos dados dos filmes para acesso offline.
