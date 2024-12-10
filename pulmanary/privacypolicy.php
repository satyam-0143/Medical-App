<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Set the content type to HTML
header('Content-Type: text/html; charset=UTF-8');

// Output the privacy policy HTML
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 20px;
        }
        h1, h2, h3, h4 {
            color: #333;
        }
        ul {
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2 style="color: white;">Privacy Policy</h2>
    </div>
    
    <main>
        <section class="privacy-policy">
            <h1>Introduction and Scope</h1>
            <p>Welcome to Pulmonary Rehabilitation App, a medical application designed for pulmonologists to manage patient treatments and interactions. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our services.</p>
            
            <h2>Interpretation and Definitions</h2>
            <p>For the purposes of this Privacy Policy:</p>
            <ul>
                <li><strong>Application</strong> refers to Pulmonary Rehabilitation App, provided by the Company.</li>
                <li><strong>Company</strong> (referred to as "We", "Us" or "Our") refers to the operators of the Pulmonary Rehabilitation App.</li>
                <li><strong>Personal Data</strong> refers to information that can identify an individual, such as name and phone number.</li>
                <li><strong>Service</strong> refers to the Pulmonary Rehabilitation App.</li>
                <li><strong>You</strong> refers to the individual or entity using the Service, as applicable.</li>
            </ul>

            <h2>Collecting and Using Your Personal Data</h2>
            <h3>Types of Data Collected</h3>
            <h4>Personal Data</h4>
            <p>While using Our Service, We may ask You to provide Us with personally identifiable information, such as:</p>
            <ul>
                <li>Name</li>
                <li>Phone number</li>
                <li>Age</li>
                <li>Gender</li>
            </ul>

            <h4>Third-Party Services</h4>
            <p>When You use the chat feature, You will be navigated to WhatsApp for direct communication with the doctor. Please note that WhatsApp has its own privacy policies regarding data handling.</p>

            <h4>Data Sharing</h4>
            <p>The Personal Data collected is shared only between the doctor and patient for treatment purposes. Patients will answer basic questions like "How hard do you feel while breathing after running?"</p>

            <h4>Data Retention</h4>
            <p>We will retain Your Personal Data for the duration of your treatment, typically not more than 8 weeks (2 months). After this period, your data will be deleted unless legally required for longer retention.</p>

            <h2>User Rights</h2>
            <p>As a user, You have the right to request the deletion of Your personal data. Doctors can delete patient data, and administrators can remove doctors from the system.</p>

            <h2>Children’s Privacy</h2>
            <p>Our Service is not directed towards anyone under the age of 12. We do not knowingly collect personal data from anyone under 12 without parental consent. If you are a parent and become aware that your child has provided us with personal information, please contact us.</p>

            <h2>Contact Us</h2>
            <p>If you have any questions about this Privacy Policy, You can contact us via email at: satyamkr.9543@gmail.com</p>
        </section>
    </main>
</body>
</html>';
?>
