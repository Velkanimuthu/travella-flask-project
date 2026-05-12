-- TRAVELLA - Tamil Nadu Additional Data
-- Run in MySQL Workbench: Ctrl+Shift+Enter
-- This ADDS new rows without deleting existing data

USE travella;

-- 
-- TAMIL NADU HOTELS
-- 

INSERT INTO hotels (hotel_name, location, price, rating, safety_score, safety_status, image_url, description, nearby_police, nearby_hospital, crime_rating) VALUES
('The Park Chennai', 'Nungambakkam, Chennai', 8500.00, 4.5, 84, 'Safe', 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600', 'Stylish boutique hotel in the heart of Chennai with rooftop pool, award-winning restaurants, and vibrant nightlife nearby.', 1, 1, 'Low'),
('Taj Coromandel', 'Nungambakkam, Chennai', 15000.00, 4.8, 90, 'Safe', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600', 'Chennai most iconic luxury hotel. Elegant rooms, world-class Patio restaurant, and legendary Southern hospitality since 1974.', 1, 1, 'Very Low'),
('Hyatt Regency Chennai', 'Anna Salai, Chennai', 11000.00, 4.6, 87, 'Safe', 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=600', 'Premium business hotel on Anna Salai with stunning city views, multiple dining outlets, and a state-of-the-art fitness center.', 1, 1, 'Low'),
('La Vida Rooms Chennai', 'T Nagar, Chennai', 2200.00, 4.1, 70, 'Safe', 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=600', 'Budget-friendly stay in the shopping hub of T Nagar. Walking distance to Pondy Bazaar and Ranganathan Street.', 1, 1, 'Low'),
('Le Pondy Beach Resort', 'ECR, Pondicherry', 6500.00, 4.4, 82, 'Safe', 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=600', 'Beachfront resort on the East Coast Road with private beach access, French-inspired architecture, and sea-view rooms.', 0, 1, 'Low'),
('Villa Shanti', 'White Town, Pondicherry', 5500.00, 4.6, 86, 'Safe', 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600', 'Charming heritage villa in the French Quarter. Colonial architecture, courtyard garden, and artisanal breakfast included.', 1, 1, 'Very Low'),
('Palais de Mahe', 'White Town, Pondicherry', 9800.00, 4.7, 88, 'Safe', 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600', 'Luxury boutique hotel in a restored 18th-century French mansion. Rooftop pool, spa, and the finest French Creole cuisine.', 1, 1, 'Very Low'),
('Gratitude Heritage Hotel', 'White Town, Pondicherry', 4200.00, 4.3, 80, 'Safe', 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600', 'A lovingly restored colonial home in the heart of White Town. Tranquil garden, yoga sessions, and Ayurvedic treatments.', 1, 0, 'Low'),
('The Residency Coimbatore', 'Avinashi Road, Coimbatore', 5800.00, 4.4, 83, 'Safe', 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=600', 'Premier business hotel in the heart of Coimbatore with rooftop pool, multi-cuisine restaurant, and access to textile markets.', 1, 1, 'Low'),
('Vivanta Coimbatore', 'Race Course Road, Coimbatore', 7200.00, 4.5, 85, 'Safe', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600', 'Taj group property offering elegant rooms, landscaped gardens, award-winning Kava restaurant near the Nilgiris foothills.', 1, 1, 'Low'),
('Hotel Kovai Comforts', 'RS Puram, Coimbatore', 1800.00, 3.9, 68, 'Moderate', 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=600', 'Affordable and clean accommodation in RS Puram. Great base for exploring Coimbatore and Ooty day trips.', 1, 1, 'Low'),
('Taj Gateway Madurai', 'Pasumalai Hill, Madurai', 8900.00, 4.6, 85, 'Safe', 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=600', 'Hilltop resort overlooking the magnificent Meenakshi Amman Temple. Heritage architecture, beautiful gardens, and temple-view rooms.', 1, 1, 'Low'),
('Hotel Heritage Madurai', 'SS Colony, Madurai', 3200.00, 4.2, 74, 'Safe', 'https://images.unsplash.com/photo-1464082354059-27db6ce50048?w=600', 'Centrally located comfortable hotel with rooftop terrace views of the Madurai skyline. Close to the famous Meenakshi Temple.', 1, 1, 'Low'),
('Savoy Hotel Ooty', 'Sylks Road, Ooty', 7500.00, 4.5, 81, 'Safe', 'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?w=600', 'A colonial-era Taj heritage property in the Nilgiris. Stone cottages with fireplaces, sprawling gardens, and misty mountain views.', 1, 1, 'Low'),
('Sterling Ooty Fern Hill', 'Fern Hill, Ooty', 5200.00, 4.3, 79, 'Safe', 'https://images.unsplash.com/photo-1596436029370-15b5d0b2d67d?w=600', 'Nestled among tea gardens and eucalyptus forests. Cozy cottages, bonfire evenings, and guided nature walks.', 0, 1, 'Very Low'),
('Hotel Sparsa Kanyakumari', 'Beach Road, Kanyakumari', 4500.00, 4.3, 80, 'Safe', 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600', 'Panoramic sea-view rooms at the southern tip of India. Watch sunrise and sunset over three seas from your own window.', 1, 1, 'Low');

-- 
-- TAMIL NADU TOURIST PLACES
-- 

INSERT INTO tourist_places (name, location, description, image_url, category) VALUES
('Marina Beach', 'Chennai, Tamil Nadu', 'The world second longest urban beach stretching 13km. A beloved gathering place with food stalls, horse rides, and stunning sunrise views over the Bay of Bengal.', 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600', 'Beach'),
('Kapaleeshwarar Temple', 'Mylapore, Chennai', 'A magnificent 7th-century Dravidian temple dedicated to Lord Shiva. The towering gopuram adorned with colorful sculptures is one of Chennai most iconic landmarks.', 'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=600', 'Spiritual'),
('Fort St. George', 'Chennai, Tamil Nadu', 'Built in 1644 by the British East India Company, this is the first English fortress in India. Now houses the Tamil Nadu legislative assembly and a fascinating museum.', 'https://images.unsplash.com/photo-1477587458883-47145ed94245?w=600', 'Heritage'),
('Mahabalipuram', 'Kanchipuram District, Tamil Nadu', 'A UNESCO World Heritage Site with extraordinary 7th-century rock-cut temples and the famous Shore Temple. A must-visit ancient Pallava port city on the Coromandel coast.', 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600', 'Heritage'),
('French Quarter Pondicherry', 'White Town, Pondicherry', 'Step into French India - cobblestone streets lined with bougainvillea-draped colonial villas, art galleries, boutique cafes, and the serene seaside promenade.', 'https://images.unsplash.com/photo-1564507592333-c60657eea523?w=600', 'Heritage'),
('Auroville', 'Pondicherry', 'A unique universal township built around the golden Matrimandir meditation dome. People from 50 nations live here in harmony pursuing human unity and sustainable living.', 'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=600', 'Spiritual'),
('Pondicherry Rock Beach', 'Promenade, Pondicherry', 'The iconic beach promenade lined with French colonial buildings, statues, and cafes. Perfect for evening walks, cycling, and watching the Bay of Bengal at sunrise.', 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?w=600', 'Beach'),
('Chunnambar Boat House', 'Pondicherry', 'A scenic backwater estuary where a river meets the sea. Enjoy boat rides through mangroves to a pristine private island beach. Perfect for a peaceful day trip.', 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=600', 'Beach'),
('Marudamalai Temple', 'Coimbatore, Tamil Nadu', 'A beautiful hilltop temple dedicated to Lord Murugan with panoramic views of Coimbatore city and the Western Ghats. Popular pilgrimage site with serene surroundings.', 'https://images.unsplash.com/photo-1561361058-c24e15abd4cf?w=600', 'Spiritual'),
('Dhyanalinga Temple', 'Coimbatore, Tamil Nadu', 'A unique meditative space created by Sadhguru at the Isha Yoga Center. The massive ellipsoid dome is India largest consecrated meditation space without rituals.', 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600', 'Spiritual'),
('Meenakshi Amman Temple', 'Madurai, Tamil Nadu', 'One of India greatest temples with 14 ornate gopurams rising up to 52 meters. The Hall of Thousand Pillars and the golden lotus tank are absolutely breathtaking.', 'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=600', 'Spiritual'),
('Thirumalai Nayakkar Palace', 'Madurai, Tamil Nadu', 'A 17th-century Dravidian palace with massive stucco pillars and a grand audience hall. The evening son et lumiere show brings Madurai history to life magnificently.', 'https://images.unsplash.com/photo-1477587458883-47145ed94245?w=600', 'Heritage'),
('Ooty Botanical Gardens', 'Ooty, Tamil Nadu', 'Spread across 55 acres on the slopes of the Nilgiris, these stunning gardens house over 650 plant species including a 20-million-year-old fossilized tree trunk.', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600', 'Mountain'),
('Ooty Lake', 'Ooty, Tamil Nadu', 'A picturesque artificial lake surrounded by lush eucalyptus forests and tea estates. Enjoy boating, cycling along the lakeside, and the famous Nilgiri toy train nearby.', 'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?w=600', 'Mountain'),
('Doddabetta Peak', 'Ooty, Tamil Nadu', 'The highest peak in the Nilgiris at 2637 meters. On clear days you can see across Tamil Nadu and Karnataka. The telescope house at the top offers stunning panoramic views.', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600', 'Mountain'),
('Kanyakumari Sunrise Point', 'Kanyakumari, Tamil Nadu', 'The southernmost tip of India where the Arabian Sea, Bay of Bengal and Indian Ocean meet. Witness the rare spectacle of sunrise and sunset over the sea on the same day.', 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=600', 'Spiritual'),
('Vivekananda Rock Memorial', 'Kanyakumari, Tamil Nadu', 'A stunning monument on a rocky island where Swami Vivekananda meditated in 1892. Reachable by ferry, it offers breathtaking views of the confluence of three oceans.', 'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600', 'Spiritual'),
('Ramanathaswamy Temple', 'Rameswaram, Tamil Nadu', 'One of the 12 Jyotirlinga shrines, this magnificent temple has the longest corridor in India at 1200 meters. The 22 sacred theerthams make it a major pilgrimage destination.', 'https://images.unsplash.com/photo-1561361058-c24e15abd4cf?w=600', 'Spiritual'),
('Brihadeeswarar Temple', 'Thanjavur, Tamil Nadu', 'A UNESCO World Heritage Site and masterpiece of Chola architecture. The 1000-year-old temple has a 66-meter vimana and a massive Nandi statue carved from a single rock.', 'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=600', 'Heritage');

-- 
-- TAMIL NADU RESTAURANTS
-- 

INSERT INTO restaurants (name, cuisine, location, rating, price_range, image_url) VALUES
('Murugan Idli Shop', 'South Indian', 'T Nagar, Chennai', 4.7, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Annalakshmi Restaurant', 'South Indian', 'Marshalls Road, Chennai', 4.6, 'Mid Range', 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=600'),
('The Rain Tree', 'Multi-Cuisine', 'Anna Salai, Chennai', 4.5, 'Fine Dining', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600'),
('Ponnusamy Hotel', 'Chettinad', 'Egmore, Chennai', 4.6, 'Mid Range', 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600'),
('Kaaraikudi Restaurant', 'Chettinad', 'Nungambakkam, Chennai', 4.5, 'Mid Range', 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600'),
('Le Cafe Pondicherry', 'French', 'Beach Road, Pondicherry', 4.4, 'Mid Range', 'https://images.unsplash.com/photo-1521017432531-fbd92d768814?w=600'),
('Villa Shanti Restaurant', 'French Creole', 'White Town, Pondicherry', 4.7, 'Fine Dining', 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=600'),
('Surguru Restaurant', 'South Indian', 'Mission Street, Pondicherry', 4.5, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Cafe des Arts', 'French', 'White Town, Pondicherry', 4.3, 'Mid Range', 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=600'),
('Satsanga', 'Continental', 'White Town, Pondicherry', 4.4, 'Mid Range', 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?w=600'),
('Annapoorna Sree Gowrishankar', 'South Indian', 'East Arokiasamy Road, Coimbatore', 4.7, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Namma Ooru Biriyani', 'Biryani', 'Gandhipuram, Coimbatore', 4.5, 'Budget', 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600'),
('The Springfields', 'Multi-Cuisine', 'Race Course Road, Coimbatore', 4.3, 'Fine Dining', 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600'),
('Sree Annapoorna', 'South Indian', 'RS Puram, Coimbatore', 4.6, 'Budget', 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=600'),
('Murugan Idli Shop Madurai', 'South Indian', 'West Masi Street, Madurai', 4.8, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Amma Mess', 'Chettinad', 'Town Hall Road, Madurai', 4.6, 'Budget', 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600'),
('Indo Ceylon Restaurant', 'South Indian', 'Near Meenakshi Temple, Madurai', 4.4, 'Budget', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600'),
('Sidewalk Cafe Ooty', 'Continental', 'Commercial Road, Ooty', 4.3, 'Mid Range', 'https://images.unsplash.com/photo-1521017432531-fbd92d768814?w=600'),
('Hotel Welbeck Restaurant', 'South Indian', 'Ettines Road, Ooty', 4.2, 'Budget', 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600'),
('Hotel Saravana Bhavan Kanyakumari', 'South Indian', 'Beach Road, Kanyakumari', 4.4, 'Budget', 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=600'),
('Archana Restaurant', 'Seafood', 'Near Ferry Point, Kanyakumari', 4.3, 'Mid Range', 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600');

-- 
-- CHECK TOTALS
-- 
SELECT 'Tamil Nadu data added successfully!' AS Status;
SELECT COUNT(*) AS total_hotels FROM hotels;
SELECT COUNT(*) AS total_places FROM tourist_places;
SELECT COUNT(*) AS total_restaurants FROM restaurants;
