# 🌍 Travella — Smart Tourist Safety & Travel Assistance

> A luxury travel editorial web application built with Flask + MySQL, featuring real-time safety ratings for hotels, destination discovery, restaurant listings, route navigation, language translation, emergency services, and vehicle booking.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🏛️ Tourist Places | 500+ curated destinations filterable by category |
| 🏨 Safety-Rated Hotels | Hotels with safety scores (0–100), crime ratings, and hospital/police proximity |
| 🍽️ Restaurants | Curated dining filterable by cuisine type |
| 🗺️ Route Navigation | Google Maps-powered directions with popular Indian routes |
| 🌐 Language Translator | Free MyMemory API with 17+ languages and travel phrases |
| 🆘 Emergency Services | SOS button, emergency numbers (Police 100, Ambulance 108), nearby hospitals/police |
| 🚗 Vehicle Booking | Car, bike, taxi, bus booking with confirmation page |

---

## 🗂️ Folder Structure

```
travella/
├── app.py                    # Flask application & routes
├── requirements.txt          # Python dependencies
├── README.md                 # This file
├── templates/
│   ├── index.html            # Homepage with hero, features, testimonials
│   ├── tourist_places.html   # Destinations grid with category filter
│   ├── hotels.html           # Hotels with safety badges + booking modal
│   ├── restaurants.html      # Restaurants with cuisine filter
│   ├── routes.html           # Google Maps navigation
│   ├── translator.html       # Language translator + travel phrases
│   ├── emergency.html        # SOS, emergency numbers, hospitals, police
│   └── vehicle_booking.html  # Vehicle selector + booking form + confirmation
├── static/
│   ├── css/style.css         # Full custom CSS (luxury editorial theme)
│   ├── js/script.js          # Navbar scroll, animations, translator API, etc.
│   └── images/               # (optional local images)
└── database/
    └── travella.sql          # CREATE + INSERT statements for all tables
```

---

## 🚀 Setup Instructions

### 1. Prerequisites

- Python 3.9+
- MySQL 8.0+
- pip

### 2. Clone / Extract the Project

```bash
unzip travella_flask_project.zip
cd travella
```

### 3. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 4. Set Up MySQL Database

Open your MySQL client (MySQL Workbench, DBeaver, or CLI) and import the SQL file:

```bash
mysql -u root -p < database/travella.sql
```

Or manually:
```sql
SOURCE /path/to/travella/database/travella.sql;
```

### 5. Configure Database Credentials

Open `app.py` and update the `DB_CONFIG` dictionary:

```python
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'YOUR_PASSWORD_HERE',   # ← Update this
    'database': 'travella',
    'port': 3306
}
```

### 6. Run the Application

```bash
python app.py
```

The app will be available at: **http://127.0.0.1:5000**

---

## 🗄️ Database Tables

| Table | Description |
|-------|-------------|
| `hotels` | Hotel listings with safety_score, safety_status, crime_rating |
| `hotel_bookings` | Stores hotel booking form submissions |
| `tourist_places` | Curated destinations with category |
| `restaurants` | Restaurant listings with cuisine and rating |
| `vehicle_bookings` | Vehicle booking form submissions |

---

## 🗺️ Google Maps Note

The navigation page uses a public Google Maps embed iframe with the free tier. For production:

1. Get a Google Maps Embed API key from [Google Cloud Console](https://console.cloud.google.com)
2. In `templates/routes.html`, update the iframe src to include `&key=YOUR_API_KEY`

Without an API key, the map will display with usage limits. For development and demo purposes, the current setup works fine.

---

## 🌐 Translation API

The translator uses [MyMemory](https://mymemory.translated.net/) — a free, no-key-required translation API. 

**Rate Limit:** 1000 words/day for anonymous usage. For higher limits, register at MyMemory and add your email parameter to the API URL.

---

## 🎨 Design System

| Element | Value |
|---------|-------|
| Primary Color | Deep Teal `#0D4F5C` |
| Accent Color | Golden Amber `#F2A93B` |
| Background | Ivory `#F9F5EE` |
| Dark Sections | Charcoal `#1A1A2E` |
| Display Font | Playfair Display (Google Fonts) |
| Body Font | DM Sans (Google Fonts) |

---

## 📱 Pages Overview

1. **/** — Homepage with hero, stats, feature cards, destination preview, safety showcase, testimonials
2. **/tourist-places** — Filterable grid of destinations (Beach, Mountain, Heritage, City, Wildlife, Spiritual)
3. **/hotels** — Safety-rated hotels with booking modal; safe/moderate/risky badges with pulsing animations
4. **/restaurants** — Cuisine-filtered restaurant cards with ratings and directions
5. **/routes** — Google Maps embed with popular route shortcuts
6. **/translator** — 17-language translator with essential travel phrases
7. **/emergency** — SOS button, emergency helplines, nearby hospitals/police, safety tips accordion
8. **/vehicle-booking** — Vehicle selector (Car/Bike/Taxi/Bus) + booking form + animated confirmation page

---

## 🛡️ Safety System

Hotels are ranked by `safety_score` (0–100):

| Score Range | Status | Badge |
|-------------|--------|-------|
| 75–100 | Safe | 🟢 Pulsing green ring |
| 50–74 | Moderate | 🟡 Amber indicator |
| 0–49 | Risky | 🔴 Red warning |

Factors include: proximity to police stations, proximity to hospitals, and crime rating.

---

*Built with ❤️ for Indian Tourism | Travella © 2024*
