-- TRAVELLA DATABASE (FIXED - no smart quotes)
CREATE DATABASE IF NOT EXISTS travella;
USE travella;

DROP TABLE IF EXISTS hotel_bookings;
DROP TABLE IF EXISTS hotels;

CREATE TABLE hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(150) NOT NULL,
    location VARCHAR(200) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    safety_score INT NOT NULL,
    safety_status ENUM('Safe','Moderate','Risky') NOT NULL,
    image_url VARCHAR(300),
    description TEXT,
    nearby_police TINYINT(1) DEFAULT 0,
    nearby_hospital TINYINT(1) DEFAULT 0,
    crime_rating VARCHAR(20)
);

INSERT INTO hotels (hotel_name, location, price, rating, safety_score, safety_status, image_url, description, nearby_police, nearby_hospital, crime_rating) VALUES
('The Taj Mahal Palace', 'Mumbai, Maharashtra', 24999.00, 4.9, 92, 'Safe', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600', 'Iconic luxury hotel overlooking the Arabian Sea and Gateway of India. World-class dining, spa, and heritage architecture.', 1, 1, 'Very Low'),
('The Leela Palace', 'New Delhi, Delhi', 18500.00, 4.8, 88, 'Safe', 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=600', 'Grand palace hotel in the heart of Delhi with Mughal-inspired architecture, premium restaurants, and a luxurious spa.', 1, 1, 'Low'),
('ITC Grand Chola', 'Chennai, Tamil Nadu', 12750.00, 4.7, 85, 'Safe', 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600', 'A tribute to the glory of the Chola dynasty. Sprawling resort with multiple dining concepts and a world-class spa.', 1, 1, 'Low'),
('The Oberoi Udaivilas', 'Udaipur, Rajasthan', 32000.00, 4.9, 90, 'Safe', 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600', 'Set on the banks of Lake Pichola, this palatial property redefines luxury with private terraces and butlers.', 1, 1, 'Very Low'),
('Taj Falaknuma Palace', 'Hyderabad, Telangana', 27500.00, 4.8, 87, 'Safe', 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600', 'Perched atop a hill, this nizam-era palace offers extraordinary views, royal cuisine, and antique furnishings.', 1, 1, 'Low'),
('Aman-i-Khas', 'Ranthambore, Rajasthan', 45000.00, 4.9, 78, 'Safe', 'https://images.unsplash.com/photo-1596436029370-15b5d0b2d67d?w=600', 'Exclusive jungle camp near the Ranthambore Tiger Reserve. Tented luxury suites with personalized wildlife safaris.', 0, 0, 'Low'),
('Fortune Select Grand Ridge', 'Tirupati, Andhra Pradesh', 5200.00, 4.2, 72, 'Safe', 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=600', 'Modern business hotel ideal for pilgrims visiting Tirumala. Clean rooms, multi-cuisine restaurant, and reliable service.', 1, 1, 'Low'),
('Hotel Clarks Varanasi', 'Varanasi, Uttar Pradesh', 6800.00, 4.0, 61, 'Moderate', 'https://images.unsplash.com/photo-1464082354059-27db6ce50048?w=600', 'Heritage hotel close to the ghats. Comfortable rooms, Ganga view, and guided tour arrangements.', 1, 0, 'Moderate'),
('Zostel Manali', 'Manali, Himachal Pradesh', 1200.00, 4.3, 55, 'Moderate', 'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?w=600', 'Vibrant backpacker hostel at the foothills. Social atmosphere, adventure activity bookings, and mountain views.', 0, 1, 'Moderate'),
('Royal Heritage Haveli', 'Jaisalmer, Rajasthan', 4500.00, 4.1, 66, 'Moderate', 'https://images.unsplash.com/photo-1548013146-72479768bada?w=600', 'Sandstone haveli in the heart of Jaisalmer Fort. Rooftop restaurant, camel safari bookings, folk music evenings.', 1, 0, 'Moderate'),
('Backpacker Inn Old Delhi', 'Old Delhi, Delhi', 800.00, 3.2, 38, 'Risky', 'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=600', 'Budget accommodation in the historic Old Delhi lanes. Extremely close to spice markets and street food.', 0, 0, 'High'),
('Sea View Guesthouse', 'Goa, Goa', 2200.00, 3.8, 47, 'Risky', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=600', 'Budget guesthouse 200m from Calangute Beach. Basic rooms, no security, but excellent beach access.', 0, 0, 'Moderate');

CREATE TABLE hotel_bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_name VARCHAR(150) NOT NULL,
    hotel_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    room_type ENUM('Single','Double','Suite') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

DROP TABLE IF EXISTS tourist_places;

CREATE TABLE tourist_places (
    place_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(200) NOT NULL,
    description TEXT,
    image_url VARCHAR(300),
    category ENUM('Beach','Mountain','Heritage','City','Wildlife','Spiritual') NOT NULL
);

INSERT INTO tourist_places (name, location, description, image_url, category) VALUES
('Taj Mahal', 'Agra, Uttar Pradesh', 'One of the Seven Wonders of the World, this ivory-white marble mausoleum built by Mughal Emperor Shah Jahan is an eternal symbol of love.', 'https://images.unsplash.com/photo-1564507592333-c60657eea523?w=600', 'Heritage'),
('Radhanagar Beach', 'Havelock Island, Andaman', 'Consistently ranked among Asia best beaches, Radhanagar boasts crystal-clear turquoise waters and powder-white sands.', 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600', 'Beach'),
('Rohtang Pass', 'Manali, Himachal Pradesh', 'A high mountain pass in the Kullu Valley offering breathtaking snow-capped vistas, skiing, and adventure activities at 3978m altitude.', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600', 'Mountain'),
('Amber Fort', 'Jaipur, Rajasthan', 'A magnificent hilltop fort-palace blending Rajput and Mughal architecture. Famous for its Sheesh Mahal mirror palace and elephant rides.', 'https://images.unsplash.com/photo-1477587458883-47145ed94245?w=600', 'Heritage'),
('Kerala Backwaters', 'Alleppey, Kerala', 'A serene network of canals, lagoons, and lakes. Houseboat cruises through lush paddy fields and coconut groves are unforgettable.', 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=600', 'City'),
('Varanasi Ghats', 'Varanasi, Uttar Pradesh', 'The spiritual heart of India. The ancient ghats along the Ganges river are alive with rituals, ceremonies, and the eternal rhythm of Hindu life.', 'https://images.unsplash.com/photo-1561361058-c24e15abd4cf?w=600', 'Spiritual'),
('Ranthambore National Park', 'Sawai Madhopur, Rajasthan', 'India premier tiger reserve set against dramatic landscape of ancient fort ruins. One of the best places to spot Bengal tigers in the wild.', 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600', 'Wildlife'),
('Goa Beaches', 'Panaji, Goa', 'India beach paradise from the energetic shores of Baga and Calangute to the serene coves of Palolem. Vibrant nightlife, water sports, and Portuguese heritage.', 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?w=600', 'Beach'),
('Hampi Ruins', 'Hampi, Karnataka', 'A UNESCO World Heritage Site and the last capital of the Vijayanagara Empire. Surreal boulder landscape dotted with magnificent temple ruins.', 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600', 'Heritage'),
('Ziro Valley', 'Lower Subansiri, Arunachal Pradesh', 'A picturesque valley of the Apatani tribe, surrounded by pine-covered hills and lush rice fields. One of India best-kept secrets.', 'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=600', 'Mountain'),
('Mysore Palace', 'Mysuru, Karnataka', 'An opulent royal residence and one of India most visited monuments. Illuminated by 100,000 lights on special occasions. A marvel of Indo-Saracenic architecture.', 'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=600', 'Heritage'),
('Sundarbans Delta', 'West Bengal', 'The world largest mangrove forest and home to the Royal Bengal Tiger. A UNESCO World Heritage Site with unique tidal waterways.', 'https://images.unsplash.com/photo-1559827291-72ee739d0d9a?w=600', 'Wildlife');

DROP TABLE IF EXISTS restaurants;

CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    cuisine VARCHAR(100) NOT NULL,
    location VARCHAR(200) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    price_range VARCHAR(20) NOT NULL,
    image_url VARCHAR(300)
);

INSERT INTO restaurants (name, cuisine, location, rating, price_range, image_url) VALUES
('Bukhara', 'North Indian', 'ITC Maurya, New Delhi', 4.8, 'Premium', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600'),
('Indian Accent', 'Modern Indian', 'The Lodhi, New Delhi', 4.9, 'Premium', 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=600'),
('Karavalli', 'Coastal Indian', 'Gateway Hotel, Bengaluru', 4.7, 'Fine Dining', 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600'),
('Peshwari', 'North Indian', 'ITC Grand Chola, Chennai', 4.6, 'Fine Dining', 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=600'),
('Mahesh Lunch Home', 'Seafood', 'Fort, Mumbai', 4.5, 'Mid Range', 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600'),
('Saravana Bhavan', 'South Indian', 'Multiple Locations', 4.4, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Pinch of Spice', 'Mughlai', 'Agra, Uttar Pradesh', 4.3, 'Mid Range', 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600'),
('Lakeview Restaurant', 'Multi-Cuisine', 'Udaipur, Rajasthan', 4.6, 'Fine Dining', 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?w=600'),
('Bhoj Restaurant', 'Rajasthani', 'Jaipur, Rajasthan', 4.2, 'Mid Range', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600'),
('Cafe Mambo', 'Continental', 'Calangute, Goa', 4.1, 'Mid Range', 'https://images.unsplash.com/photo-1521017432531-fbd92d768814?w=600'),
('The Fat Monk', 'Asian Fusion', 'Mcleodganj, Himachal Pradesh', 4.3, 'Mid Range', 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600'),
('Ohris Dum Pukht', 'Hyderabadi', 'Banjara Hills, Hyderabad', 4.5, 'Fine Dining', 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=600');

DROP TABLE IF EXISTS vehicle_bookings;

CREATE TABLE vehicle_bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    vehicle_type ENUM('Car','Bike','Taxi','Bus') NOT NULL,
    pickup_location VARCHAR(200) NOT NULL,
    drop_location VARCHAR(200) NOT NULL,
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT 'SUCCESS! Database setup complete!' AS Status;
SELECT COUNT(*) AS hotels_inserted FROM hotels;
SELECT COUNT(*) AS places_inserted FROM tourist_places;
SELECT COUNT(*) AS restaurants_inserted FROM restaurants;
