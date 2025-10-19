<!-- Load Tailwind CSS and the Inter font -->
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<style>
    /* Custom styles to achieve the specific visual feel */
    :root {
        /* Defining the primary color palette from the image */
        --primary-blue: #495ec0ef; 
        --primary-red: #d9534f;
    }
    
    body {
        font-family: 'Inter', sans-serif;
        color: #e5e7eb;
        /* Simulate a subtle dark, moody background (like the image) */
        background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.6)), url('https://placehold.co/1920x1080/0f172a/64748b?text=Abstract+Background');
        background-size: cover;
        background-position: center;
        background-attachment: fixed; /* Ensures background looks good on scroll if content overflowed */
    }

    /* Card styling for better visual depth */
    .login-card {
        transition: all 0.3s ease;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
    }

    /* Input focus styling matching the blue theme */
    .login-input:focus {
        border-color: var(--primary-blue);
        box-shadow: 0 0 0 3px rgba(73, 94, 192, 0.3);
    }

    /* Role button active state */
    .role-btn.active {
        background-color: var(--primary-blue);
        color: white;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(73, 94, 192, 0.4);
    }

    /* Role button inactive state */
    .role-btn:not(.active) {
        background-color: #e5e7eb;
        color: #4b5563;
        transition: background-color 0.2s, transform 0.2s;
    }
    
    .role-btn:not(.active):hover {
        background-color: #d1d5db;
    }
</style>

<div class="flex flex-col lg:flex-row items-center justify-center min-h-screen p-8">

    <!-- LEFT SIDE: Marketing Text / Hero Section -->
    <div class="lg:w-1/2 w-full lg:text-right text-center p-6 lg:mr-16">
        <h1 class="text-5xl md:text-6xl font-extrabold mb-6 leading-tight text-white drop-shadow-lg">
            Bridging Generations, Ending Loneliness.
        </h1>
        <p class="text-lg md:text-xl text-gray-300 font-light max-w-xl lg:ml-auto lg:mr-0 mx-auto">
            A simple way for compassionate volunteers to connect and build lasting, meaningful friendships.
        </p>
    </div>

    <!-- RIGHT SIDE: Login Card Container -->
    <div class="w-full max-w-md mt-10 lg:mt-0">
        <div id="loginCard" class="login-card bg-white p-8 sm:p-10 rounded-xl shadow-2xl">
            
            <h2 id="cardTitle" class="text-2xl font-bold text-gray-800 text-center mb-6">INCLUSIPHERE - Member</h2>
            
            <!-- Simulated Logo from Image -->
            <div class="flex justify-center items-center mb-6">
                <div class="relative w-20 h-20">
                    <!-- Blue Circle -->
                    <div class="absolute w-10 h-10 rounded-full bg-[var(--primary-blue)] opacity-80 top-0 left-0"></div>
                    <!-- Red Circle -->
                    <div class="absolute w-10 h-10 rounded-full bg-[var(--primary-red)] opacity-80 bottom-0 right-0"></div>
                    <!-- Text (Simulating the logo text) -->
                    <span class="absolute text-sm font-bold text-gray-700 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                        <span class="block leading-none text-center">INCLUSIPHERE</span>
                        <span class="block text-[8px] tracking-widest text-gray-500 text-center">QUALITY BEYOND LIMITS</span>
                    </span>
                </div>
            </div>

            <!-- Role Selector Buttons -->
            <div class="flex justify-center space-x-4 mb-8">
                <button id="memberBtn" class="role-btn active text-sm font-semibold py-2 px-4 rounded-full transition duration-200 cursor-pointer">
                    Member Login
                </button>
                <button id="volunteerBtn" class="role-btn text-sm font-semibold py-2 px-4 rounded-full transition duration-200 cursor-pointer">
                    Volunteer Login
                </button>
            </div>

            <form>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email or Mobile</label>
                    <input type="text" id="email" class="login-input w-full p-3 border border-gray-300 rounded-lg focus:outline-none transition duration-150" placeholder="Enter your email or mobile">
                </div>
                
                <div class="mb-6">
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="password" class="login-input w-full p-3 border border-gray-300 rounded-lg focus:outline-none transition duration-150" placeholder="Enter your password">
                </div>

                <div class="flex justify-end mb-8">
                    <a href="#" class="text-sm font-medium text-[var(--primary-blue)] hover:text-blue-700 transition duration-150">Forgot Password?</a>
                </div>

                <button type="submit" class="w-full bg-[var(--primary-blue)] text-white font-bold py-3 rounded-lg hover:bg-blue-700 transition duration-300 transform hover:scale-[1.01]">
                    Login
                </button>
            </form>

            <p class="text-center text-gray-600 mt-6 text-sm">
                Don’t have an account? 
                <a href="#" class="font-bold text-[var(--primary-red)] hover:text-red-700 transition duration-150">Sign Up</a>
            </p>

        </div>
    </div>

</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const memberBtn = document.getElementById('memberBtn');
        const volunteerBtn = document.getElementById('volunteerBtn');
        const cardTitle = document.getElementById('cardTitle');

        /**
         * Updates the title of the card based on the active role.
         * @param {string} role - The active role ("Member" or "Volunteer").
         */
        const updateTitle = (role) => {
            cardTitle.textContent = `INCLUSIPHERE - ${role}`;
        };

        // Initialize title based on the default active button (Member)
        updateTitle("Member"); 

        // Event listener for Member Button
        memberBtn.addEventListener('click', () => {
            if (!memberBtn.classList.contains('active')) {
                memberBtn.classList.add('active');
                volunteerBtn.classList.remove('active');
                updateTitle("Member");
            }
        });

        // Event listener for Volunteer Button
        volunteerBtn.addEventListener('click', () => {
            if (!volunteerBtn.classList.contains('active')) {
                volunteerBtn.classList.add('active');
                memberBtn.classList.remove('active');
                updateTitle("Volunteer");
            }
        });

        // Simple form submission handler
        document.querySelector('form').addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Display a message box (instead of using the forbidden alert())
            const activeRole = memberBtn.classList.contains('active') ? "Member" : "Volunteer";
            
            // Create and show a custom message box
            let messageBox = document.getElementById('messageBox');
            if (!messageBox) {
                messageBox = document.createElement('div');
                messageBox.id = 'messageBox';
                messageBox.className = 'fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50';
                messageBox.innerHTML = `
                    <div class="bg-white p-6 rounded-xl shadow-xl max-w-xs text-center">
                        <p class="text-lg font-bold mb-3 text-gray-800">${activeRole} Login Selected</p>
                        <p class="text-gray-600 mb-6">Form submission intercepted. In a real app, this would route you to the ${activeRole} dashboard.</p>
                        <button onclick="document.getElementById('messageBox').remove()" class="bg-[var(--primary-blue)] text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition">OK, Got It</button>
                    </div>
                `;
                document.body.appendChild(messageBox);
            }
        });
    });
</script>
