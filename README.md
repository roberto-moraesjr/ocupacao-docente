# 🚀 Sistema de Gestão Escolar e Agendamento de Horários

Um sistema web robusto e intuitivo desenvolvido para gerenciar o agendamento de turmas, disponibilidade de docentes, ocupação de ambientes e planejamento acadêmico. Focado na automação de processos, integridade de dados e saúde financeira escolar.

---

## ✨ Módulos e Funcionalidades Principais

### 1. Dashboard de Alta Performance
*   **Visualização Multidimensional**: Acompanhamento em tempo real da ocupação de professores e salas com filtros avançados.
*   **Navegação Temporal**: Navegação paginada (período de 30 dias) com carregamento dinâmico via AJAX.
*   **Indicadores Rápidos**: Visão analítica de custos, metas e saúde financeira escolar na tela principal.

### 2. Motor de Importação Inteligente (Excel)
*   **Processamento Multi-abas**: Suporte à leitura em lote de Cursos, Docentes, Ambientes, Turmas e Agendas a partir de uma única planilha.
*   **Normalização Heurística**: Tratamento automático de datas (Serial Excel/ISO), remoção de acentos e mapeamento inteligente de colunas.
*   **Auto-Agenda**: Geração automática de cronogramas acadêmicos baseados na carga horária e dias da semana caso a aba de agenda seja omitida.

### 3. Gestão de Metas e Custos A/H
*   **Painel de Metas**: Acompanhamento analítico da relação Custo Meta vs. Custo Realizado.
*   **Simulador de Cenários (What-if)**: Interface interativa para simulação de novos custos e impactos financeiros na viabilidade das turmas.

### 4. Logística de Professores e Ambientes
*   **Estratégia de Substituição**: Busca inteligente de professores substitutos com base em área de conhecimento e janelas de disponibilidade livre de conflitos.
*   **Gestão de Férias e Feriados**: Bloqueio automático de agendas docentes em períodos de férias e suspensão de aulas em feriados civis com recálculo automático da carga horária.
*   **Workload (Carga Horária)**: Monitoramento de saldo de horas anual com cálculo proporcional para docentes admitidos no decorrer do ano.

### 5. Gerenciamento de Reservas de Ambientes
*   **Reservas Pontuais**: Agendamento de salas e laboratórios para eventos específicos, reuniões ou palestras.
*   **Motor de Conflitos**: Validação em tempo real para impedir reservas sobrepostas no mesmo horário e ambiente.

### 6. Gestão de Turmas e Checklist de Conformidade
*   **Ficha da Turma**: Cadastro completo de turmas vinculadas a cursos, salas e docentes.
*   **Checklist de Documentação (CRI)**: Acompanhamento de pendências de diários de classe, plano de curso, cronograma e encerramento pedagógico.

### 7. Preparação e Planejamento Didático
*   **Planejamento de Aulas**: Registro de planos de ensino e status de preparação das disciplinas pelos docentes.
*   **Controle de Horas-Atividade**: Dedução e acompanhamento de horas reservadas para planejamento pedagógico extraclasse.

### 8. Métrica SENAI (Produção Aluno/Hora)
*   **KPIs de Produtividade**: Cálculo em tempo real da produção aluno-hora levando em conta matrículas, taxa de evasão e aditamentos de contratos.

### 9. Administração de Usuários e RBAC
*   **Níveis de Acesso**: Perfis administrativos segregados por papéis (Admin, Gestor, CRI, Professor).
*   **Gestão de Perfis**: Cadastro de credenciais com hashes seguros e controle estrito de acessos de rotas baseadas na sessão.

### 10. Notificações Globais e Redirecionamento
*   **Deep-linking**: Notificações integradas no painel que apontam com links diretos e destaque visual para os registros que demandam atenção imediata.

### 11. Relatórios e Exportações Avançadas
*   **Exportação XLS**: Download direto dos dados de turmas, agendas completas de professores e ocupação de ambientes formatados para visualização offline.
*   **Relatório Anual**: Consolidado financeiro e operacional de metas vs. realizado.

---

## 🛠️ Tecnologias Utilizadas

*   **Backend**: PHP 8.1+ (Arquitetura MVC simplificada)
*   **Banco de Dados**: MySQL / MariaDB (InnoDB) com transações ACID
*   **Frontend**: HTML5, JavaScript (ES6+), Vanilla CSS (Design Responsivo & HSL Variables)
*   **Gráficos**: Chart.js 4.x para visualização analítica profunda
*   **Design**: Interface Premium com suporte a Dark/Light Mode, Glassmorphism e micro-animações
*   **Integração**: PHPSpreadsheet / Custom Excel Parser

---

## ⚙️ Instalação e Configuração

### 1. Pré-requisitos
*   Servidor local (XAMPP, WAMP ou Laragon) com PHP 8.0+.
*   Gerenciador de dependências Composer.
*   Servidor MySQL / MariaDB.

### 2. Instalação de Dependências
Na raiz do projeto, instale as dependências declaradas no `composer.json` (como o PHPSpreadsheet):
```bash
composer install
```

### 3. Configurar Banco de Dados
1. Crie um banco de dados chamado `gestao_escolar`.
2. Importe o script de estrutura e dados iniciais localizado em `Sql/gestao_escolar.sql`.
3. Caso existam migrações adicionais de tabelas, execute `php/migrate_notificacoes.php` ou `php/controllers/fix_schema.php` para manter o banco atualizado.

### 4. Configurar Conexão
Edite o arquivo `php/configs/db.php` com as credenciais do seu servidor MySQL:
```php
$host = 'localhost';
$user = 'root';
$pass = ''; // Senha do seu banco de dados
$db   = 'gestao_escolar';
```

### 5. Credenciais de Acesso Padrão
*   **URL**: `http://localhost/Projeto-horario/` (ou caminho correspondente no htdocs)
*   **Usuário**: `admin@senai.br`
*   **Senha**: `admin102030`

---

## 📂 Estrutura de Diretórios Detalhada

```text
├───assets/                  # Recursos visuais, logotipos e mockups
├───css/                     # Design System (Estilos unificados e específicos)
│   ├───style.css            # Variáveis HSL Globais e Estrutura Principal
│   ├───dashboard_ajax.css   # Estilos para o Dashboard com atualização AJAX
│   └───*                    # Estilos específicos de componentes (login, metas, etc.)
├───js/                      # Lógica de negócio e interações dinâmicas no front
│   ├───calendar.js          # Calendário interativo de turmas e salas
│   ├───metas_ah.js          # Gráficos e simulação de Custo Aluno/Hora
│   ├───substituicao.js      # Lógica de busca de professores substitutos
│   └───*                    # Scripts de suporte e inicialização de gráficos
├───php/                     # Lógica de negócio e visualizações no servidor
│   ├───components/          # Fragmentos reutilizáveis de UI (Header, Sidebar)
│   ├───configs/             # Conexões, autenticação (auth.php), envio de e-mails (mailer.php) e funções auxiliares (utils.php)
│   ├───controllers/         # Controladores da API REST e endpoints AJAX
│   ├───models/              # Modelos para abstração e consultas de banco de dados
│   └───views/               # Arquivos php que representam as páginas/telas do sistema
├───Sql/                     # Arquivos de estrutura e dados iniciais (DML/DDL)
└───index.php                # Roteamento e tela principal do painel unificado
```

---

## 🔒 Segurança e Regras de Negócio

*   **Validação de Conflitos**: Algoritmo robusto que impede a alocação dupla de docentes ou salas no mesmo horário/dia.
*   **Controle de Acesso (RBAC)**: Níveis de permissão distintos (Admin, Gestor, CRI, Professor) com restrições de visualização e edição.
*   **Cálculo de Hora-Atividade**: Dedução automática de horas de planejamento conforme regras contratuais.
*   **Integridade de Dados**: Uso de transações SQL durante importações massivas para garantir "rollback" em caso de inconsistência no Excel.
*   **Validação Cruzada de Férias e Feriados**: Bloqueios automatizados evitam que tarefas acadêmicas sejam agendadas fora do calendário permitido.

---

## 📝 Autor
Desenvolvido para otimização estratégica de recursos educacionais e automação de fluxos acadêmicos SENAI.

---
**Última atualização:** 19 de Junho de 2026.
