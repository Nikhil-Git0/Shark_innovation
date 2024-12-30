const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const cors = require('cors');
const nodemailer = require('nodemailer');
const crypto = require('crypto');

const app = express();
app.use(bodyParser.json());
app.use(cors()); // Allow requests from your Flutter app

// PostgreSQL connection setup
const pool = new Pool({
    user: 'postgres',       // Your PostgreSQL username
    host: 'localhost',      // PostgreSQL host
    database: 'shark_innovation', // Database name
    password: 'postgres123', // Your database password
    port: 5432,             // Default PostgreSQL port
});

// Nodemailer setup
const transporter = nodemailer.createTransport({
    service: 'Gmail', // Or another email provider
    auth: {
        user: 'nikhildemo07@gmail.com', // Your email
        pass: 'vlvk akns eogh iuuy', // Your email password
    },
});

// ** Registration Endpoint **
app.post('/register', async (req, res) => {
    const { name, email, phone, city, linkedin, website, instagram, role } = req.body;

    // Validate input
    if (!name || !email || !phone || !role) {
        return res.status(400).json({ success: false, error: 'Missing required fields' });
    }

    try {
        // Check if the email already exists
        const emailCheckQuery = 'SELECT * FROM users WHERE email = $1';
        const emailCheckResult = await pool.query(emailCheckQuery, [email]);

        if (emailCheckResult.rows.length > 0) {
            return res.status(400).json({ success: false, error: 'Email already exists' });
        }

        // Insert the new user
        const query = `
            INSERT INTO users (name, email, phone, city, linkedin, website, instagram, role)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
            RETURNING *;
        `;
        const values = [name, email, phone, city, linkedin, website, instagram, role];
        const result = await pool.query(query, values);

        res.status(201).json({ success: true, user: result.rows[0] });
    } catch (error) {
        console.error('Error inserting user:', error.message);
        res.status(500).json({ success: false, error: 'Database error: ' + error.message });
    }
});

// ** Send OTP Endpoint **
app.post('/send-otp', async (req, res) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).json({ success: false, error: 'Email is required' });
    }

    try {
        // Generate a random 6-digit OTP
        const otp = crypto.randomInt(1000, 9999);

        // Store the OTP in the database
        await pool.query(
            `INSERT INTO otp_logins (email, otp, created_at)
             VALUES ($1, $2, NOW())
             ON CONFLICT (email) DO UPDATE SET otp = $2, created_at = NOW()`,
            [email, otp]
        );

        // Send the OTP via email
        const mailOptions = {
            from: 'nikhildemo07@gmail.com',
            to: 'nikhildemo07@gmail.com',
            subject: 'Your OTP for Login',
            text: `Your OTP is ${otp}. It is valid for 5 minutes.`,
        };

        await transporter.sendMail(mailOptions);

        res.status(200).json({ success: true, message: 'OTP sent successfully' });
    } catch (error) {
        console.error('Error sending OTP:', error.message);
        res.status(500).json({ success: false, error: 'Failed to send OTP: ' + error.message });
    }
});

// ** Verify OTP Endpoint **
app.post('/verify-otp', async (req, res) => {
    const { email, otp } = req.body;

    if (!email || !otp) {
        return res.status(400).json({ success: false, error: 'Email and OTP are required' });
    }

    try {
        // Verify the OTP and ensure it's within the valid time (5 minutes)
        const result = await pool.query(
            `SELECT * FROM otp_logins
             WHERE email = $1 AND otp = $2 AND NOW() - created_at < INTERVAL '5 minutes'`,
            [email, otp]
        );

        if (result.rows.length > 0) {
            res.status(200).json({ success: true, message: 'Login successful' });
        } else {
            res.status(401).json({ success: false, error: 'Invalid or expired OTP' });
        }
    } catch (error) {
        console.error('Error verifying OTP:', error.message);
        res.status(500).json({ success: false, error: 'Failed to verify OTP: ' + error.message });
    }
});

// ** Create Tables for OTP Logins **
const createTables = async () => {
    try {
        await pool.query(`
            CREATE TABLE IF NOT EXISTS otp_logins (
                email VARCHAR(255) PRIMARY KEY,
                otp INT NOT NULL,
                created_at TIMESTAMP NOT NULL
            );
        `);
        console.log('Tables created successfully');
    } catch (error) {
        console.error('Error creating tables:', error.message);
    }
};

createTables();

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
