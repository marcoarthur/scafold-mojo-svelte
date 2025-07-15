# scafold-mojo-svelte

A scaffold project combining [Mojolicious](https://mojolicious.org/) (Perl web framework) for the backend and [Svelte](https://svelte.dev/) for the frontend.  
This template provides a minimal yet practical starting point for building modern full-stack web applications.

---

## ✨ Features
- **Perl Mojolicious** backend with routing and API structure
- **Svelte** frontend for reactive UI
- Ready-to-use **development environment**
- Hot-reload for frontend development
- Configurable **environment variables**

---

## 📂 Project Structure

.
├── backend/          # Mojolicious app (Perl)
│   ├── lib/          # Perl modules
│   ├── templates/    # Mojo templates
│   ├── public/       # Static files
│   └── script/       # Application script
└── frontend/         # Svelte application
├── src/          # Svelte components
├── public/       # Static assets
└── package.json  # Frontend dependencies


---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/marcoarthur/scafold-mojo-svelte.git
cd scafold-mojo-svelte
````

---

### 2. Backend Setup (Mojolicious)

Make sure you have **Perl 5.16+** and [Carton](https://metacpan.org/pod/Carton) installed.

```bash
cd backend
carton install
```

Run the backend server:

```bash
carton exec morbo script/app
```

---

### 3. Frontend Setup (Svelte)

Make sure you have **Node.js (>=16)** and npm installed.

```bash
cd frontend
npm install
npm run dev
```

This will start the Svelte development server (usually on `http://localhost:5173`).

---

### 4. Combine Backend + Frontend

* Configure the backend to serve the built frontend from `frontend/public/` or proxy API calls.
* Build Svelte for production:

```bash
npm run build
```

Copy build output to the Mojolicious `public/` directory.

---

## ⚙️ Configuration

* Create `.env` files for environment-specific settings.
* Configure backend API routes in `backend/lib/MyApp.pm`.

---

## ✅ Requirements

* Perl 5.16+
* Node.js 16+
* Carton (for Perl dependency management)

---

## 📜 License

MIT License. See [LICENSE](LICENSE) for details.
