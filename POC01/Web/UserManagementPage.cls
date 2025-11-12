/// CSP Page para gestión de usuarios SAP
Class POC01.Web.UserManagementPage Extends %CSP.Page
{

Parameter CONTENTTYPE = "text/html";

Parameter CHARSET = "UTF-8";

ClassMethod OnPage() As %Status
{
    Write "<!DOCTYPE html>",!
    Write "<html lang='es'>",!
    Write "<head>",!
    Write "<meta charset='UTF-8'>",!
    Write "<meta name='viewport' content='width=device-width, initial-scale=1.0'>",!
    Write "<title>Gestión de Usuarios SAP - POC01</title>",!
    Write "<style>",!
    Write "* { margin: 0; padding: 0; box-sizing: border-box; }",!
    Write "body { font-family: 'Segoe UI', sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; padding: 20px; }",!
    Write ".container { max-width: 1200px; margin: 0 auto; }",!
    Write ".header { background: white; padding: 30px; border-radius: 10px; margin-bottom: 30px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }",!
    Write ".header h1 { color: #0066cc; font-size: 2.5rem; margin-bottom: 10px; }",!
    Write ".subtitle { color: #6c757d; font-size: 1.1rem; }",!
    Write ".card { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); margin-bottom: 20px; }",!
    Write ".card h2 { color: #343a40; margin-bottom: 20px; font-size: 1.8rem; border-bottom: 3px solid #0066cc; padding-bottom: 10px; }",!
    Write ".form-group { margin-bottom: 20px; }",!
    Write ".form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #343a40; }",!
    Write ".form-group input { width: 100%; padding: 12px 15px; border: 2px solid #dee2e6; border-radius: 5px; font-size: 1rem; }",!
    Write ".form-group input:focus { outline: none; border-color: #0066cc; }",!
    Write ".btn { padding: 12px 30px; border: none; border-radius: 5px; font-size: 1rem; font-weight: 600; cursor: pointer; transition: all 0.3s; text-transform: uppercase; }",!
    Write ".btn-primary { background: #0066cc; color: white; }",!
    Write ".btn-success { background: #28a745; color: white; }",!
    Write ".btn-danger { background: #dc3545; color: white; }",!
    Write ".tabs { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }",!
    Write ".tab-btn { flex: 1; min-width: 200px; padding: 15px 20px; border: none; background: white; border-radius: 8px; cursor: pointer; font-size: 1rem; font-weight: 600; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }",!
    Write ".tab-btn.active { background: #0066cc; color: white; }",!
    Write ".tab-content { display: none; }",!
    Write ".tab-content.active { display: block; }",!
    Write ".result { margin-top: 20px; }",!
    Write ".alert { padding: 20px; border-radius: 8px; margin-top: 15px; }",!
    Write ".alert-success { background: #d4edda; border-left: 5px solid #28a745; color: #155724; }",!
    Write ".alert-error { background: #f8d7da; border-left: 5px solid #dc3545; color: #721c24; }",!
    Write ".user-table { width: 100%; border-collapse: collapse; margin-top: 10px; }",!
    Write ".user-table thead { background: #0066cc; color: white; }",!
    Write ".user-table th, .user-table td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #dee2e6; }",!
    Write ".user-table tbody tr:hover { background: #f8f9fa; }",!
    Write ".loading-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.7); display: none; justify-content: center; align-items: center; z-index: 9999; }",!
    Write ".loading-overlay.show { display: flex; }",!
    Write ".spinner { border: 5px solid rgba(255, 255, 255, 0.3); border-top: 5px solid white; border-radius: 50%; width: 60px; height: 60px; animation: spin 1s linear infinite; }",!
    Write "@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }",!
    Write ".footer { background: white; padding: 20px; border-radius: 10px; margin-top: 30px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }",!
    Write "</style>",!
    Write "</head>",!
    Write "<body>",!
    Write "<div class='container'>",!
    Write "<header class='header'>",!
    Write "<h1>🔐 Sistema de Gestión de Usuarios SAP</h1>",!
    Write "<p class='subtitle'>POC01 - User Management via BAPI</p>",!
    Write "</header>",!
    Write "<div class='tabs'>",!
    Write "<button class='tab-btn active' onclick='showTab(""list"")'>📋 Listar Usuarios</button>",!
    Write "<button class='tab-btn' onclick='showTab(""check"")'>🔍 Verificar Usuario</button>",!
    Write "<button class='tab-btn' onclick='showTab(""lock"")'>🔒 Bloquear Usuario</button>",!
    Write "<button class='tab-btn' onclick='showTab(""unlock"")'>🔓 Desbloquear Usuario</button>",!
    Write "</div>",!
    Write "<div class='tab-content active' id='tab-list'>",!
    Write "<div class='card'>",!
    Write "<h2>Listar Usuarios SAP</h2>",!
    Write "<form onsubmit='return getUsers(event)'>",!
    Write "<div class='form-group'>",!
    Write "<label for='maxRows'>Máximo de registros:</label>",!
    Write "<input type='number' id='maxRows' value='20' min='1' max='100'>",!
    Write "</div>",!
    Write "<button type='submit' class='btn btn-primary'>Obtener Lista</button>",!
    Write "</form>",!
    Write "<div id='listResult' class='result'></div>",!
    Write "</div>",!
    Write "</div>",!
    Write "<div class='tab-content' id='tab-check'>",!
    Write "<div class='card'>",!
    Write "<h2>Verificar Existencia de Usuario</h2>",!
    Write "<form onsubmit='return checkUser(event)'>",!
    Write "<div class='form-group'>",!
    Write "<label for='checkUsername'>Nombre de usuario SAP:</label>",!
    Write "<input type='text' id='checkUsername' required placeholder='Ej: ADSUSER'>",!
    Write "</div>",!
    Write "<button type='submit' class='btn btn-primary'>Verificar</button>",!
    Write "</form>",!
    Write "<div id='checkResult' class='result'></div>",!
    Write "</div>",!
    Write "</div>",!
    Write "<div class='tab-content' id='tab-lock'>",!
    Write "<div class='card'>",!
    Write "<h2>Bloquear Usuario SAP</h2>",!
    Write "<form onsubmit='return lockUser(event)'>",!
    Write "<div class='form-group'>",!
    Write "<label for='lockUsername'>Nombre de usuario SAP:</label>",!
    Write "<input type='text' id='lockUsername' required placeholder='Ej: TESTUSER'>",!
    Write "</div>",!
    Write "<button type='submit' class='btn btn-danger'>Bloquear Usuario</button>",!
    Write "</form>",!
    Write "<div id='lockResult' class='result'></div>",!
    Write "</div>",!
    Write "</div>",!
    Write "<div class='tab-content' id='tab-unlock'>",!
    Write "<div class='card'>",!
    Write "<h2>Desbloquear Usuario SAP</h2>",!
    Write "<form onsubmit='return unlockUser(event)'>",!
    Write "<div class='form-group'>",!
    Write "<label for='unlockUsername'>Nombre de usuario SAP:</label>",!
    Write "<input type='text' id='unlockUsername' required placeholder='Ej: TESTUSER'>",!
    Write "</div>",!
    Write "<button type='submit' class='btn btn-success'>Desbloquear Usuario</button>",!
    Write "</form>",!
    Write "<div id='unlockResult' class='result'></div>",!
    Write "</div>",!
    Write "</div>",!
    Write "<footer class='footer'>",!
    Write "<p>POC01 - SAP User Management System | InterSystems IRIS + SAP JCo 3.1</p>",!
    Write "</footer>",!
    Write "</div>",!
    Write "<div class='loading-overlay' id='loadingOverlay'>",!
    Write "<div class='spinner'></div>",!
    Write "</div>",!
    
    Do ..WriteJavaScript()
    
    Write "</body>",!
    Write "</html>",!
    
    Return $$$OK
}

ClassMethod WriteJavaScript()
{
    Write "<script>",!
    Write "const API_BASE = '/api/users';",!
    Write "function showTab(tabName) {",!
    Write "  const tabs = document.querySelectorAll('.tab-btn');",!
    Write "  const contents = document.querySelectorAll('.tab-content');",!
    Write "  tabs.forEach(t => t.classList.remove('active'));",!
    Write "  contents.forEach(c => c.classList.remove('active'));",!
    Write "  event.target.classList.add('active');",!
    Write "  document.getElementById('tab-' + tabName).classList.add('active');",!
    Write "}",!
    Write "function showLoading() { document.getElementById('loadingOverlay').classList.add('show'); }",!
    Write "function hideLoading() { document.getElementById('loadingOverlay').classList.remove('show'); }",!
    Write "async function apiRequest(endpoint, method, body) {",!
    Write "  showLoading();",!
    Write "  const options = { method, headers: { 'Content-Type': 'application/json' } };",!
    Write "  if (body) options.body = JSON.stringify(body);",!
    Write "  try {",!
    Write "    const response = await fetch(API_BASE + endpoint, options);",!
    Write "    const data = await response.json();",!
    Write "    hideLoading();",!
    Write "    return data;",!
    Write "  } catch (error) {",!
    Write "    hideLoading();",!
    Write "    return { success: 0, error: 'Error: ' + error.message };",!
    Write "  }",!
    Write "}",!
    Write "function displayResult(elementId, data) {",!
    Write "  const div = document.getElementById(elementId);",!
    Write "  if (data.success === 1) {",!
    Write "    div.innerHTML = '<div class=""alert alert-success"">' + formatSuccess(data) + '</div>';",!
    Write "  } else {",!
    Write "    div.innerHTML = '<div class=""alert alert-error"">Error: ' + (data.error || 'Desconocido') + '</div>';",!
    Write "  }",!
    Write "}",!
    Write "function formatSuccess(data) {",!
    Write "  if (data.data && Array.isArray(data.data)) {",!
    Write "    let html = '<h3>Usuarios encontrados: ' + data.count + '</h3>';",!
    Write "    html += '<table class=""user-table""><thead><tr><th>Username</th><th>Nombre</th><th>Apellido</th><th>Nombre Completo</th></tr></thead><tbody>';",!
    Write "    data.data.forEach(u => {",!
    Write "      html += '<tr><td><strong>' + u.username + '</strong></td><td>' + (u.firstname || '-') + '</td><td>' + (u.lastname || '-') + '</td><td>' + (u.fullname || '-') + '</td></tr>';",!
    Write "    });",!
    Write "    html += '</tbody></table>';",!
    Write "    return html;",!
    Write "  } else if (data.exists !== undefined) {",!
    Write "    return data.message + '<br><strong>Usuario: ' + data.username + '</strong>';",!
    Write "  } else {",!
    Write "    return data.message + '<br><strong>Usuario: ' + data.username + '</strong>';",!
    Write "  }",!
    Write "}",!
    Write "async function getUsers(e) {",!
    Write "  e.preventDefault();",!
    Write "  const maxRows = document.getElementById('maxRows').value;",!
    Write "  const data = await apiRequest('/list?maxRows=' + maxRows, 'GET');",!
    Write "  displayResult('listResult', data);",!
    Write "  return false;",!
    Write "}",!
    Write "async function checkUser(e) {",!
    Write "  e.preventDefault();",!
    Write "  const username = document.getElementById('checkUsername').value.trim().toUpperCase();",!
    Write "  const data = await apiRequest('/check', 'POST', { username });",!
    Write "  displayResult('checkResult', data);",!
    Write "  return false;",!
    Write "}",!
    Write "async function lockUser(e) {",!
    Write "  e.preventDefault();",!
    Write "  const username = document.getElementById('lockUsername').value.trim().toUpperCase();",!
    Write "  if (!confirm('Bloquear usuario ' + username + '?')) return false;",!
    Write "  const data = await apiRequest('/lock', 'POST', { username });",!
    Write "  displayResult('lockResult', data);",!
    Write "  return false;",!
    Write "}",!
    Write "async function unlockUser(e) {",!
    Write "  e.preventDefault();",!
    Write "  const username = document.getElementById('unlockUsername').value.trim().toUpperCase();",!
    Write "  if (!confirm('Desbloquear usuario ' + username + '?')) return false;",!
    Write "  const data = await apiRequest('/unlock', 'POST', { username });",!
    Write "  displayResult('unlockResult', data);",!
    Write "  return false;",!
    Write "}",!
    Write "console.log('POC01 - Loaded');",!
    Write "</script>",!
}

}
