Desafio API

Eu entendo que criar uma API de serviço do catálogo de filmes eu no qual eu precise fazer a leitura de um arquivo CSV eu precisava de 2 endpoints.
O primeiro no qual eu iria fazer a leitura do arquivo e salvar o mesmo no banco de dados e o outro seria um endpoint que retorna JSON ao invés de HTML em sua view.
O controller que eu gerei com esse intuito foi o "movies_controller.rb" dentro do caminho "controllers/api/v1/".

Eu comecei fazendo a minha rota no arquivo "routes.rb" criando a rota "post 'import_csv', to: 'movies#import_csv'" pois para eu ler a API primeiro eu precisaria ler o arquivo CSV e salvar no meu banco de dados. Dentro do meu app eu criei o model com o comando "rails g model Movie show_id:string genre:string title:string director:string cast:string country:string year:string published_at:string rating:string duration:string listed_in:string description:text" e rodei os comandos "rails:dbcreate" e "rails:dbmigrate" criando o arquivo "movie.rb".

Fui no postman e criei uma rota "POST" "http://localhost:3000/api/v1/import_csv" selecionei o "body", "form-data", e como "Key" eu passei o arquivo "csv_file" com o valor "netflix_titles.csv".

Então eu criei no meu controller o "import_csv" que primeiramente faz um código que é utilizado para achar o caminho dos parametros do arquivo CSV do postman CSV.foreach para iterar sobre cada linha de um arquivo CSV. Ele está usando o argumento headers: :first_row para dizer que a primeira linha do arquivo contém os nomes das colunas. Em cada iteração, ele está criando um novo objeto Movie com os valores das colunas correspondentes e salvando esse objeto se ele não existir no banco de dados, desta forma terminei o endpoint de ler e salvar o arquivo.

Para fazer o segundo endpoint eu inclui o "defaults: { format: :json }" nas minhas rotas para o app entender que ele espera, por padrão, a uma rota que deve responder com dados no formato JSON e criei a minha rota "get 'movies/:type/:value', to: 'movies#get_movies'"(explicações sobre o motivo dessa rota ser dessa maneira mais a abaixo).

Um dos critérios do desafio era exibir o arquivo JSON filtrando os registros por ano de lançamento, gênero, país, etc e ordenálos por ordem de lançamento, desta forma eu criei a lógica "@movies = Movie.all.where("#{params[:type]}": params[:value]).order(published_at: :asc)" na qual eu crio uma instancia de Movie e seleciono todos os filmes, no meu banco de dados, no qual os parametros sejam os mesmos que eu boto na minha URL em ordem ascendente exemplo: "http://localhost:3000/api/v1/movies/country/France" assim eu retorno todos os filmes que tenham sido feitos na França, outro exemplo seria cololar "http://localhost:3000/api/v1/movies/genre/TV%20Show" onde retornaria todas as "TV Show" do meu banco de dados.

Após realizar a lógica do filtro eu criei a lógica "@movies = Movie.all.order(published_at: :asc) if params[:type] == 'all' && params[:value] == 'movies'" na qual eu só boto para que na rota "http://localhost:3000/api/v1/movies/all/movies" apareçam todos os movies do banco de dados.

Após isso eu criei o código "render json: format_response(@movies)" que está chamando o método privado "format_response", passando a variável de instância @movies como argumento. O método "format_response" está iterando sobre o array de objetos "movies" (que é a variável de instância @movies), e para cada objeto "movie", ele está criando um novo objeto hash com algumas das propriedades do objeto "movie" e adicionando esse objeto hash para um array. Finalmente, o método "format_response" retorna o array de objetos hash formatado, que é passado para o método "render json" e enviado como resposta à requisição. Dessa forma, a resposta será no formato json com os dados especificos.


COMO EXECUTAR O PROJETO:

1- bundle install
2- rails db:create
3- abrir o postman e criar a rota POST citado acima
4- rails db:migrate
5- abrir o postman e digitar http://localhost:3000/api/v1/movies/genre/TV%20Show para filmes filtrados por TV show
6- digitar http://localhost:3000/api/v1/movies/all/movies para ver todos os filmes da database



DESAFIO LÓGICA DE PROGRAMÇÃO


1- Primeiro eu crio a contagem dos diamantes
2- Crio a variável "expression" e coloco seu valor
3- O ".tr" Aqui ele cria uma string, trocando o . por string vazia, ou seja, removendo o .
4- O tap aqui retorn a propria string sem o . anterior como objeto para o bloco, ou seja, o objeto fica disponível ali para ser usado dentro do bloco
5- Dentro do bloco é iniciado a iteração no objeto usando um while
e o método ".sub!" para caso seja encontrado o diamante '<>' ele é adicionado ao "diamond_counter" e
ele substitui por uma string vazia

COMO EXECUTAR A LOGICA

1- Abrir o arquivo com o nome "desafio_logica_programação.rb" nesse app
2- Abrir o terminal e digitar o comando rails c
3- Copiar e colar linha por linha o código dentro do terminal
4- Descobrir quantos diamantes foram encontrados no desafio :)
