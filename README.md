# JarvisAI
--------------------------------------------------------------------------------
hello, i'm Doom, and this is my adaptation of Jarvis!
--
this repository serves as a showcase of sorts, for my locally ran Jarvis AI framework skeleton, and response protocol!
________________________________________________________________________________
the purpose of me releasing Jarvis to the public is so that if one felt so inclined, as to try and make their own personal assistant, they have the option to take inspiration from my project. <3
________________________________________________________________________________

now, let us begin.

# J.A.R.V.I.S.
### Just A Rather Very Intelligent System

> a personal AI assistant for Windows — voice-activated via hotkey, powered by Groq and ElevenLabs, with full computer control.

---

## simple overview

JARVIS, is a locally-run AI assistant that listens to your voice, responds through whatever your audio output is, in a calm and authoritative voice, and can control your Windows PC on command. Press a single key, speak naturally, and JARVIS handles the rest. ( the goal was to make him as similiar to the movie version of J.A.R.V.I.S as possible <3)

**capabilities!!:**
- Voice activation via the ` (backtick) key
- Natural speech recognition via Groq Whisper
- Human-quality voice responses via ElevenLabs (Adam voice, you can change it)
- Open and close any application on your PC
- Take screenshots, check system stats, set volume
- Search the web, read and analyze files
- Full conversation memory within a session
- Animated web UI with real-time status circle

---

## now, for some boring prerequisites

### 1. Python 3.11 64-bit — Required
JARVIS requires the **64-bit** version of Python 3.11. Using 32-bit Python will cause package installation failures.

- Download: https://www.python.org/downloads/release/python-3119/
- Scroll to **Files** → select **Windows installer (64-bit)**
- During install, check **"Add Python to PATH"**
- Verify after install — open Command Prompt:
```
  python --version
  python -c "import struct; print(struct.calcsize('P')*8, 'bit')"
```
  Must show `3.11.x` and `64 bit`.

### 2. Git — Required to clone (obviously!)
- Download: https://git-scm.com/download/win
- Install with all defaults

### 3. Groq API Key — Free
Used for the AI brain (Llama 3.3 70B) and voice transcription (Whisper).

1. Go to https://console.groq.com and sign up
2. Navigate to **API Keys** → **Create API Key**
3. Name it `JARVIS` and copy the key (starts with `gsk_...`)

### 4. ElevenLabs API Key — Free tier available
Used for high-quality voice output (Adam voice). Free tier: 10,000 characters/month.

1. Go to https://elevenlabs.io and sign up
2. Click your **profile icon** (bottom-left) → **Profile + API Key**
3. Reveal and copy your key

### 5. Administrator Access — Required
The backtick global hotkey requires admin privileges to register system-wide. 
I tried to find another fix for this, but this was the simplest way.

---

## Installation

### Step 1 — Clone the repository
```
git clone https://github.com/DoomCreates/JarvisAI.git
cd JarvisAI
```

### Step 2 — Configure your API keys
```
copy .env.example .env
```
Open `.env` in Notepad and fill in:
```
GROQ_API_KEY=gsk_your_key_here
ELEVENLABS_API_KEY=your_key_here
```

### Step 3 — Add your application paths
Open `app.py` and find the `APP_PATHS` section near the top. Add your apps like this:
```python
"discord":  r"C:\Users\YourName\AppData\Local\Discord\Update.exe",
"spotify":  r"C:\Users\YourName\AppData\Roaming\Spotify\Spotify.exe",
"steam":    r"C:\Program Files (x86)\Steam\steam.exe",
```

**To find a path:** right-click any app shortcut → **Properties** → copy the **Target** field.

### Step 4 — Run setup
Double-click `setup.bat`. Takes 2–5 minutes.

### Step 5 — Launch
Right-click `launch.bat` → **Run as Administrator**

Chrome opens automatically at `http://127.0.0.1:5000`. Keep the terminal window open.

---

## Usage

| Action | How |
|---|---|
| Activate mic | Press `` ` `` (backtick) |
| Speak command | Talk naturally, pause 1.5s when done |
| Text input | Type in the box, press Enter |
| Upload a file | Click 📁 FILE |
| Stop voice | Click ⏹ STOP |
| New session | Click CLEAR MEMORY |

### Example Commands
```
"Open Discord"
"Take a screenshot"
"What's my CPU usage?"
"Set volume to 40"
"Search for the weather today"
"Close Chrome"
```

---

## Project Structure
```
JARVIS/
├── app.py              # Flask backend — AI, voice, computer control
├── requirements.txt    # Python dependencies
├── .env                # Your API keys (never committed)
├── .env.example        # Safe key template
├── .gitignore          # Excludes .env, venv, cache
├── setup.bat           # First-time installation
├── launch.bat          # Startup script
└── templates/
    └── index.html      # Animated JARVIS UI
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Backtick hotkey not working | Right-click `launch.bat` → Run as Administrator |
| `pyautogui` install error | Run: `venv\Scripts\activate` then `pip install pyautogui` |
| `pandas` missing | Run: `pip install pandas openpyxl --only-binary=:all:` |
| `proxies` TypeError on launch | Run: `pip install "httpx==0.27.2" "groq==0.9.0"` |
| Permission denied in setup | Delete the `venv` folder, end all `python.exe` in Task Manager, re-run setup |
| App not found | Add its path to `APP_PATHS` in `app.py` |
| No voice output | Check `ELEVENLABS_API_KEY` in `.env` — no spaces, correct key |
| Page won't load | Check terminal for errors, confirm `.env` keys are set |

---

## Security Notes

- `.env` is excluded from Git via `.gitignore` — your keys are never committed
- The server runs on `127.0.0.1` only — not accessible from other devices on your network

---

## License

MIT — free to use, modify, and distribute.
```

---

You'll also want these two small files in the same folder:

**`.gitignore`:**
```
venv/
.env
__pycache__/
*.pyc
*.pyo
.DS_Store
```

**`.env.example`:**
```
GROQ_API_KEY=your_groq_api_key_here
ELEVENLABS_API_KEY=your_elevenlabs_api_key_here
