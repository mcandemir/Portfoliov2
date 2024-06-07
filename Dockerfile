FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY app/requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8888 
COPY ./app .
# CMD ["python", "-m", "gunicorn", "--bind", "0.0.0.0:8888", "app:app"]
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0", "--port", "8888", "--debug"]