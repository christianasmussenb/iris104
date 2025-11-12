// ===========================
// Configuration
// ===========================
const API_BASE_URL = '/api/users';
let credentials = null;

// ===========================
// Authentication
// ===========================
const authForm = document.getElementById('authForm');
const authSection = document.getElementById('authSection');
const mainContent = document.getElementById('mainContent');
const currentUserSpan = document.getElementById('currentUser');
const logoutBtn = document.getElementById('logoutBtn');

authForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    
    // Store credentials
    credentials = {
        username: username,
        password: password,
        encoded: btoa(`${username}:${password}`)
    };
    
    // Show main content
    authSection.classList.add('hidden');
    mainContent.classList.remove('hidden');
    currentUserSpan.textContent = username;
    
    // Clear password field
    document.getElementById('password').value = '';
});

logoutBtn.addEventListener('click', () => {
    credentials = null;
    authSection.classList.remove('hidden');
    mainContent.classList.add('hidden');
    authForm.reset();
    clearAllResults();
});

// ===========================
// Tab Navigation
// ===========================
const tabButtons = document.querySelectorAll('.tab-btn');
const tabContents = document.querySelectorAll('.tab-content');

tabButtons.forEach(button => {
    button.addEventListener('click', () => {
        const tabName = button.getAttribute('data-tab');
        
        // Remove active class from all
        tabButtons.forEach(btn => btn.classList.remove('active'));
        tabContents.forEach(content => content.classList.remove('active'));
        
        // Add active class to selected
        button.classList.add('active');
        document.getElementById(`tab-${tabName}`).classList.add('active');
    });
});

// ===========================
// API Helper Functions
// ===========================
function showLoading() {
    document.getElementById('loadingOverlay').classList.remove('hidden');
}

function hideLoading() {
    document.getElementById('loadingOverlay').classList.add('hidden');
}

function getAuthHeader() {
    if (!credentials) return null;
    return `Basic ${credentials.encoded}`;
}

async function apiRequest(endpoint, method = 'GET', body = null) {
    showLoading();
    
    const options = {
        method: method,
        headers: {
            'Content-Type': 'application/json',
            'Authorization': getAuthHeader()
        }
    };
    
    if (body) {
        options.body = JSON.stringify(body);
    }
    
    try {
        const response = await fetch(`${API_BASE_URL}${endpoint}`, options);
        const data = await response.json();
        hideLoading();
        return data;
    } catch (error) {
        hideLoading();
        return {
            success: 0,
            error: `Error de conexión: ${error.message}`
        };
    }
}

// ===========================
// Result Display Functions
// ===========================
function displayResult(elementId, data) {
    const resultDiv = document.getElementById(elementId);
    resultDiv.innerHTML = '';
    
    if (data.success === 1) {
        resultDiv.innerHTML = `<div class="alert alert-success">${formatSuccessData(data)}</div>`;
    } else {
        resultDiv.innerHTML = `<div class="alert alert-error">❌ Error: ${data.error || 'Error desconocido'}</div>`;
    }
}

function formatSuccessData(data) {
    if (data.data && Array.isArray(data.data)) {
        // List of users
        return `
            <h3>✅ Usuarios encontrados: ${data.count}</h3>
            <div class="user-table-container">
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Nombre Completo</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${data.data.map(user => `
                            <tr>
                                <td><strong>${user.username}</strong></td>
                                <td>${user.firstname || '-'}</td>
                                <td>${user.lastname || '-'}</td>
                                <td>${user.fullname || '-'}</td>
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
            </div>
        `;
    } else if (data.exists !== undefined) {
        // Check user existence
        if (data.exists === 1) {
            return `✅ ${data.message}<br><strong>Usuario: ${data.username}</strong>`;
        } else {
            return `ℹ️ ${data.message}<br><strong>Usuario: ${data.username}</strong>`;
        }
    } else {
        // Lock/Unlock result
        return `✅ ${data.message}<br><strong>Usuario: ${data.username}</strong>`;
    }
}

function clearAllResults() {
    ['listResult', 'checkResult', 'lockResult', 'unlockResult'].forEach(id => {
        document.getElementById(id).innerHTML = '';
    });
}

// ===========================
// Form Handlers
// ===========================

// 1. List Users
document.getElementById('listForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const maxRows = document.getElementById('maxRows').value;
    const data = await apiRequest(`/list?maxRows=${maxRows}`, 'GET');
    displayResult('listResult', data);
});

// 2. Check User
document.getElementById('checkForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('checkUsername').value.trim().toUpperCase();
    const data = await apiRequest('/check', 'POST', { username });
    displayResult('checkResult', data);
});

// 3. Lock User
document.getElementById('lockForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('lockUsername').value.trim().toUpperCase();
    
    if (!confirm(`¿Está seguro que desea BLOQUEAR al usuario ${username}?`)) {
        return;
    }
    
    const data = await apiRequest('/lock', 'POST', { username });
    displayResult('lockResult', data);
});

// 4. Unlock User
document.getElementById('unlockForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('unlockUsername').value.trim().toUpperCase();
    
    if (!confirm(`¿Está seguro que desea DESBLOQUEAR al usuario ${username}?`)) {
        return;
    }
    
    const data = await apiRequest('/unlock', 'POST', { username });
    displayResult('unlockResult', data);
});

// ===========================
// Initialization
// ===========================
console.log('POC01 - SAP User Management System - Loaded');
