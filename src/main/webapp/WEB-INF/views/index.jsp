<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-primary {
            border-radius: 8px;
            font-weight: 600;
        }
        .new_to_site {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        .language-selector {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="language-selector" id="languageSelector">
    <button class="btn btn-link" onclick="changeLanguage('en')">EN</button>
    <button class="btn btn-link" onclick="changeLanguage('rw')">RW</button>
</div>
<div class="login-container">
    <h2 class="text-center mb-4" id="loginHeader">Login</h2>
    <form action="login" method="get">
        <div class="mb-3">
            <label for="email" class="form-label" id="emailLabel">Email</label>
            <input type="email" id="email" class="form-control" placeholder="Enter your email" required name="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label" id="passwordLabel">Password</label>
            <input type="password" id="password" class="form-control" placeholder="Enter your password" required name="password">
        </div>
        <button type="submit" class="btn btn-primary w-100" id="loginButton">Login</button>
        <p class="new_to_site" id="newToSiteText">New to site? <span><a href="signup">Signup</a></span></p>
    </form>
</div>

<script>
    function changeLanguage(lang) {
        const elements = {
            'loginHeader': {
                'en': 'Login',
                'rw': 'Injira'
            },
            'emailLabel': {
                'en': 'Email',
                'rw': 'Imeyili'
            },
            'passwordLabel': {
                'en': 'Password',
                'rw': 'Ijambo ry’ibanga'
            },
            'loginButton': {
                'en': 'Login',
                'rw': 'Injira'
            },
            'newToSiteText': {
                'en': 'New to site?',
                'rw': 'Mushya ku rubuga?'
            }
        };

        // Update all relevant elements based on selected language
        for (const [key, value] of Object.entries(elements)) {
            document.getElementById(key).textContent = value[lang];
        }

        // Update placeholders
        document.getElementById('email').placeholder = lang === 'en' ? 'Enter your email' : 'Injiza imeyili yawe';
        document.getElementById('password').placeholder = lang === 'en' ? 'Enter your password' : 'Injiza ijambo ry’ibanga ryawe';
    }
</script>
</body>
</html>
