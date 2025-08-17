# בסיס: Python 3.11
FROM python:3.11-slim

# הגדרת תיקייה לעבודה
WORKDIR /app

# התקנת חבילות
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# העתקת הקוד
COPY . .

# הרצת השרת
CMD ["uvicorn", "DataLoader:app", "--host", "0.0.0.0", "--port", "8000"]