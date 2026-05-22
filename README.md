# XHYPE Chat App 🚀

XHYPE is a modern, fast, and feature-rich real-time messaging application designed for seamless communication. Built with a focus on speed, security, and a fluid user experience.

![License](https://shields.io)
![PRs Welcome](https://shields.io)

## ✨ Features

*   **Real-Time Messaging:** Instant message delivery and receipt utilizing WebSocket technology.
*   **Secure Authentication:** User signup, login, and protected sessions (JWT / OAuth)
*   **Responsive Design:** Dark mode support and an optimized UI for mobile, tablet, and desktop views.

## 🛠️ Tech Stack

*   **Frontend:** [Flutter]
*   **Backend:** [FireBase]
*   **Database:** [Firestore]

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:
*   Node.js (v18+ recommended) or your specific runtime environment.
*   Package manager (npm, yarn, or pnpm).
*   A running instance of your chosen database.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com
   cd xhype-chat-app
   ```

2. **Install dependencies:**
   *For backend:*
   ```bash
   cd backend
   npm install
   ```
   *For frontend:*
   ```bash
   cd ../frontend
   npm install
   ```

3. **Environment Setup:**
   Create a `.env` file in both the frontend and backend directories based on the `.env.example` files provided.
   ```env
   PORT=5000
   DATABASE_URL=your_database_url
   JWT_SECRET=your_secret_key
   ```

4. **Run the Application:**
   *Start the backend:*
   ```bash
   cd backend
   npm run dev
   ```
   *Start the frontend:*
   ```bash
   cd frontend
   npm run dev
   ```


