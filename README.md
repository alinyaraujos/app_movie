# <p align="center">Application for viewing the main categories of movies</p>

- Vídeo:
<img src="https://github.com/alinyaraujos/app_movie/blob/main/assets/readme/video.gif" height="400px">

## Instalação

Necessário:

- Git
- [Flutter](https://flutter.dev)
- Visual Studio Code ou Android Studio

Instalação

```
$ git clone git@github.com:alinyaraujos/app_movie.git
cd app_movie
code . 
```

Após abrir o Visual Studio Code, execute:
```
$ flutter pub get
```
## API de filmes  
Para ter acesso a API é necessário criar uma conta e gerar uma chave de acesso
- [The Movie BD](https://www.themoviedb.org/)


Após abrir a conta crie dois arquivos de váriaveis de ambiente na raíz do seu projeto: 
`.env`
`.env_dev`

E preencha igual ao `.env_example` com as suas informações de acesso 

Após, execute:
```
$ flutter run
```
