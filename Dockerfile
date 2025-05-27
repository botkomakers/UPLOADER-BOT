FROM clintonabraham/clinton:latest

# প্রয়োজনীয় সিস্টেম প্যাকেজ ইন্সটল
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt কপি ও ইনস্টল
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# সোর্স ফাইল কপি
COPY . .

# বট রান করার কমান্ড
CMD ["python", "bot.py"]