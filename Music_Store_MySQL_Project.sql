CREATE DATABASE m;
USE m;
SET sql_mode= "TRADITIONAL";

## 1. Top 10 Customers by Total Spending
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) as total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

## 2. Top 10 Best-Selling Tracks
SELECT t.track_id, t.name, SUM(il.quantity) as total_quantity_sold
FROM track t
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY t.track_id, t.name
ORDER BY total_quantity_sold DESC
LIMIT 10;

## 3. Most Popular Genres
SELECT g.name as genre, SUM(il.quantity) as total_quantity_sold
FROM genre g
JOIN track t ON g.genre_id = t.genre_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY g.name
ORDER BY total_quantity_sold DESC;

## 4. Most Popular Playlists
SELECT p.playlist_id, p.name, COUNT(pt.track_id) as total_tracks
FROM playlist p
JOIN playlist_track pt ON p.playlist_id = pt.playlist_id
GROUP BY p.playlist_id, p.name
ORDER BY total_tracks DESC
LIMIT 10;

## 5. Top Artists by Total Sales
SELECT a.name as artist, SUM(il.quantity * il.unit_price) as total_sales
FROM artist a
JOIN album al ON a.artist_id = al.artist_id
JOIN track t ON al.album_id = t.album_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY a.name
ORDER BY total_sales DESC
LIMIT 10;

## 6. Employee Performance by Total Sales
SELECT e.employee_id, e.first_name, e.last_name, SUM(i.total) as total_sales
FROM employee e
JOIN customer c ON e.employee_id = c.support_rep_id
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales DESC;

## 7. Average Invoice Amount by Country
SELECT c.country, AVG(i.total) as average_invoice_amount
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.country
ORDER BY average_invoice_amount DESC;

## 8. Track Popularity by Media Type
SELECT mt.name as media_type, SUM(il.quantity) as total_quantity_sold
FROM media_type mt
JOIN track t ON mt.media_type_id = t.media_type_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY mt.name
ORDER BY total_quantity_sold DESC;

## 9. Customer Demographics
SELECT country, COUNT(customer_id) as total_customers
FROM customer
GROUP BY country
ORDER BY total_customers DESC;

## 10. Longest Tracks by Duration
SELECT t.track_id, t.name, t.milliseconds
FROM track t
ORDER BY t.milliseconds DESC
LIMIT 10;

## All tables
select * from genre;
select * from invoice;
select * from invoice_line;
select * from track;
select * from customer;
select * from media_type;
select * from album;
select * from artist;
select * from playlist;
select * from playlist_track;
































































SET NAMES 'utf8mb4';
