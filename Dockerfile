# Adidiona uma versoa python no linux
FROM python:3.12-slim

# Instalando o streamlit
RUN pip install streamlit

# Esse comando diz para pegar o arquivo app.py e mandar para a pasta app/app.py no linux
COPY ./app.py /app/app.py

# Entrando na pasta app
WORKDIR /app

ENTRYPOINT [ "streamlit", "run", "app.py" ]

