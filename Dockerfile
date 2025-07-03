FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto, utilizando o pip com a opção --no-cache-dir para reduzir o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto para o diretório de trabalho.
COPY . .

# Expõe a porta 8000 para que o aplicativo possa ser acessado externamente.
EXPOSE 8000

# Define o comando a ser executado quando o contêiner for iniciado.
# Utiliza o Uvicorn como servidor ASGI para servir a aplicação FastAPI.
# O parâmetro "app:app" especifica o módulo e a instância do aplicativo.
# O parâmetro "--host" define o endereço IP para o qual o servidor irá se vincular (0.0.0.0 permite acesso de qualquer lugar).
# O parâmetro "--port" define a porta em que o servidor irá escutar.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
