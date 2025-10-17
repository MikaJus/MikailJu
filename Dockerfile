# Используем официальный образ Python 3.9 (можно заменить на 3.10 или 3.11, если нужно)
FROM python:3.9-slim

# Устанавливаем рабочую директорию — в корень контейнера
WORKDIR /app

# Копируем requirements.txt и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем ВСЕ файлы и папки из репозитория в /app
COPY . .

# Убедимся, что папки для куков и логов существуют (на случай, если их нет в репо)
RUN mkdir -p cookies logs

# Запускаем основной скрипт
CMD ["python", "main.py"]