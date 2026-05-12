import os
from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
import mysql.connector
from mysql.connector import Error
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'travella_secret_key_2024'

import os
import mysql.connector
from mysql.connector import Error

def get_db():
    try:
        conn = mysql.connector.connect(
            host=os.getenv("MYSQLHOST"),
            user=os.getenv("MYSQLUSER"),
            password=os.getenv("MYSQLPASSWORD"),
            database=os.getenv("MYSQLDATABASE"),
            port=os.getenv("MYSQLPORT")
        )
        return conn
    except Error as e:
        print(f"DB connection error: {e}")
        return None

def query(sql, params=None, fetch=True, commit=False):
    conn = get_db()
    if not conn:
        return [] if fetch else None
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(sql, params or ())
        if commit:
            conn.commit()
            return cursor.lastrowid
        return cursor.fetchall() if fetch else cursor.fetchone()
    except Error as e:
        print(f"Query error: {e}")
        return [] if fetch else None
    finally:
        conn.close()

# ─── ROUTES ───────────────────────────────────

@app.route('/')
def index():
    hotels = query("SELECT * FROM hotels ORDER BY rating DESC LIMIT 4")
    places = query("SELECT * FROM tourist_places LIMIT 6")
    return render_template('index.html', hotels=hotels, places=places)

@app.route('/tourist-places')
def tourist_places():
    category = request.args.get('category', '')
    if category:
        places = query("SELECT * FROM tourist_places WHERE category = %s ORDER BY name", (category,))
    else:
        places = query("SELECT * FROM tourist_places ORDER BY name")
    categories = query("SELECT DISTINCT category FROM tourist_places ORDER BY category")
    return render_template('tourist_places.html', places=places, categories=categories, active_category=category)

@app.route('/hotels')
def hotels():
    hotels = query("SELECT * FROM hotels ORDER BY safety_score DESC")
    return render_template('hotels.html', hotels=hotels)

@app.route('/hotels/book', methods=['POST'])
def book_hotel():
    try:
        guest_name  = request.form.get('guest_name', '').strip()
        hotel_id    = request.form.get('hotel_id')
        check_in    = request.form.get('check_in_date')
        check_out   = request.form.get('check_out_date')
        room_type   = request.form.get('room_type')

        if not all([guest_name, hotel_id, check_in, check_out, room_type]):
            flash('Please fill in all fields.', 'danger')
            return redirect(url_for('hotels'))

        check_in_dt  = datetime.strptime(check_in, '%Y-%m-%d')
        check_out_dt = datetime.strptime(check_out, '%Y-%m-%d')
        if check_out_dt <= check_in_dt:
            flash('Check-out date must be after check-in date.', 'danger')
            return redirect(url_for('hotels'))

        hotel = query("SELECT * FROM hotels WHERE hotel_id = %s", (hotel_id,), fetch=False)
        if not hotel:
            flash('Hotel not found.', 'danger')
            return redirect(url_for('hotels'))

        query(
            "INSERT INTO hotel_bookings (guest_name, hotel_id, check_in_date, check_out_date, room_type) VALUES (%s,%s,%s,%s,%s)",
            (guest_name, hotel_id, check_in, check_out, room_type),
            fetch=False, commit=True
        )
        nights = (check_out_dt - check_in_dt).days
        flash(f'🎉 Booking confirmed for {guest_name}! {nights} night(s) at {hotel["hotel_name"]} — {room_type} room.', 'success')
    except Exception as e:
        print(e)
        flash('An error occurred. Please try again.', 'danger')
    return redirect(url_for('hotels'))

@app.route('/restaurants')
def restaurants():
    cuisine = request.args.get('cuisine', '')
    if cuisine:
        rest = query("SELECT * FROM restaurants WHERE cuisine LIKE %s ORDER BY rating DESC", (f'%{cuisine}%',))
    else:
        rest = query("SELECT * FROM restaurants ORDER BY rating DESC")
    cuisines = query("SELECT DISTINCT cuisine FROM restaurants ORDER BY cuisine")
    return render_template('restaurants.html', restaurants=rest, cuisines=cuisines, active_cuisine=cuisine)

@app.route('/routes')
def routes():
    return render_template('routes.html')

@app.route('/travel-planner')
def travel_planner():
    return render_template('travel_planner.html')

@app.route('/translator')
def translator():
    return render_template('translator.html')

@app.route('/emergency')
def emergency():
    return render_template('emergency.html')

@app.route('/vehicle-booking')
def vehicle_booking():
    return render_template('vehicle_booking.html')

@app.route('/vehicle-booking/confirm', methods=['POST'])
def confirm_vehicle():
    try:
        customer_name    = request.form.get('customer_name', '').strip()
        vehicle_type     = request.form.get('vehicle_type')
        pickup_location  = request.form.get('pickup_location', '').strip()
        drop_location    = request.form.get('drop_location', '').strip()
        booking_date     = request.form.get('booking_date')
        booking_time     = request.form.get('booking_time')

        if not all([customer_name, vehicle_type, pickup_location, drop_location, booking_date, booking_time]):
            flash('Please fill in all booking details.', 'danger')
            return redirect(url_for('vehicle_booking'))

        bid = query(
            "INSERT INTO vehicle_bookings (customer_name, vehicle_type, pickup_location, drop_location, booking_date, booking_time) VALUES (%s,%s,%s,%s,%s,%s)",
            (customer_name, vehicle_type, pickup_location, drop_location, booking_date, booking_time),
            fetch=False, commit=True
        )
        booking = {
            'booking_id': bid,
            'customer_name': customer_name,
            'vehicle_type': vehicle_type,
            'pickup_location': pickup_location,
            'drop_location': drop_location,
            'booking_date': booking_date,
            'booking_time': booking_time,
        }
        return render_template('vehicle_booking.html', booking=booking)
    except Exception as e:
        print(e)
        flash('An error occurred. Please try again.', 'danger')
        return redirect(url_for('vehicle_booking'))

if __name__ == '__main__':
    app.run(debug=True)
